using FoodWebMVC.Models;
using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.Extensions.Options;
using MimeKit;

namespace FoodWebMVC.Interfaces;

public interface IMailService
{
	Task SendEmailAsync(MailRequest mailRequest);
}

public class MailService : IMailService
{
	private readonly IConfiguration _configuration;
	private readonly MailSettings _mailSettings;

	public MailService(IOptions<MailSettings> mailSettings, IConfiguration configuration)
	{
		_mailSettings = mailSettings.Value;
		_configuration = configuration;
	}

	public async Task SendEmailAsync(MailRequest mailRequest)
	{
		var email = new MimeMessage();
		var mail = _configuration["MailSettings:Mail"];
		email.Sender = MailboxAddress.Parse(mail);
		email.To.Add(MailboxAddress.Parse(mailRequest.ToEmail));
		email.Subject = mailRequest.Subject;

		var builder = new BodyBuilder();

		// Attachments handling
		if (mailRequest.Attachments != null)
		{
			byte[] fileBytes;
			foreach (var file in mailRequest.Attachments)
				if (file.Length > 0)
				{
					using (var ms = new MemoryStream())
					{
						file.CopyTo(ms);
						fileBytes = ms.ToArray();
					}
					builder.Attachments.Add(file.FileName, fileBytes, ContentType.Parse(file.ContentType));
				}
		}

		builder.HtmlBody = mailRequest.Body;
		email.Body = builder.ToMessageBody();

		using var smtp = new SmtpClient();
		var host = _configuration["MailSettings:Host"];
		var password = _configuration["MailSettings:Password"]; // Gmail App Password

		// Connect to Gmail's SMTP server
		smtp.Connect(host, _mailSettings.Port, SecureSocketOptions.StartTls);

		// Authenticate with Gmail using the email and app password
		smtp.Authenticate(mail, password);

		// Send email asynchronously
		await smtp.SendAsync(email);

		// Disconnect and clean up
		smtp.Disconnect(true);
	}
}
using Microsoft.AspNetCore.Mvc;
using FoodWebMVC.Interfaces;
using System.Threading.Tasks;
using FoodWebMVC.Models;
using MimeKit;

public class TestController : Controller
{
    private readonly IMailService _mailService;

    public TestController(IMailService mailService)
    {
        _mailService = mailService;
    }

    [HttpGet]
    public IActionResult SendTestEmail()
    {
        return View();
    }

    [HttpPost]
    public async Task<IActionResult> SendTestEmail(string email)
    {
        var mailRequest = new MailRequest
        {
            ToEmail = email,
            Subject = "Test Email",
            Body = "This is a test email sent from your application."
        };
        await _mailService.SendEmailAsync(mailRequest);
        return View("EmailSent");
    }

}

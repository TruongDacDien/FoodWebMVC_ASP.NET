﻿using Microsoft.AspNetCore.Mvc;
using FoodWebMVC.Interfaces;
using System.Security.Claims;
using FoodWebMVC.Models;
using Microsoft.AspNetCore.Authorization;

namespace FoodWebMVC.Controllers
{
	[AllowAnonymous]
	public class UserController : Controller
	{
		private readonly IUserRepository _repo;
		private readonly IUserManager _userManager;
		private readonly IMailService _mailService;
		private readonly ITokenRepository _tokenRepository;

		public UserController(IUserRepository repo, IUserManager userManager, IMailService mailService, ITokenRepository tokenRepository)
		{
			_repo = repo;
			_userManager = userManager;
			_mailService = mailService;
			_tokenRepository = tokenRepository;
		}

		[HttpGet]
		public IActionResult Register()
		{
			return View();
		}

		[HttpPost]
		public async Task<IActionResult> RegisterAsync(RegisterViewModel model)
		{
			if (!ModelState.IsValid)
				return View(model);

			var user = _repo.Register(model);

			// SignIn user after registration
			await _userManager.SignIn(this.HttpContext, user, false);

			return LocalRedirect("~/Home/Index");
		}

		[HttpGet]
		public async Task<IActionResult> Login()
		{
			if (User.Identity.IsAuthenticated)
				await _userManager.SignOut(this.HttpContext);
			return View();
		}

		[HttpPost]
		public async Task<IActionResult> LoginAsync(LoginViewModel model)
		{
			if (!ModelState.IsValid)
				return RedirectToAction("Index", "User");

			var user = _repo.Validate(model);

			if (user == null)
				return View(model);

			// SignIn user after validation
			await _userManager.SignIn(this.HttpContext, user, model.RememberLogin);

			return RedirectToAction("Index", "Home");
		}

		public async Task<IActionResult> Logout(string returnUrl)
		{
			if (!User.Identity.IsAuthenticated || User.IsInRole("Admin"))
				return RedirectToAction("Index", "Home");
			await _userManager.SignOut(this.HttpContext);

			return RedirectToAction("Index", "Home");
		}

		[HttpGet]
		public IActionResult ForgotPassword()
		{
			return View();
		}

		[HttpPost]
		public async Task<IActionResult> ForgotPasswordAsync(ForgotViewModel model)
		{
			if (ModelState.IsValid)
			{
				var user = await _repo.HaveAccount(model);
				if (!user)
				{
					ViewBag.Message = "Your username or email is wrong!";
					return View(model);
				}

				// Create reset password link
				string linkResetPassword = _repo.CreateResetPasswordLink(model.UserName);

				try
				{
					// Send email with reset link
					var mailRequest = new MailRequest(model.Email, "Reset Password", linkResetPassword);
					await _mailService.SendEmailAsync(mailRequest);
					return RedirectToAction("ShowMessage");
				}
				catch (Exception ex)
				{
					ViewBag.Message = $"An error occurred while sending the email: {ex.Message}";
					return View(model);
				}
			}
			else
			{
				ViewBag.Message = "Please fill out all information before submitting!";
				return View(model);
			}
		}

		[HttpGet]
		public IActionResult ShowMessage()
		{
			ViewBag.Message = "Password reset link has been sent to your email. Check your mailbox.";
			return View();
		}

		[HttpGet]
		public IActionResult ResetPassword(string user, string token)
		{
			ViewBag.Message = null;
			bool checkedToken = _tokenRepository.CheckToken(user, token);
			if (checkedToken)
			{
				ViewBag.CustomerUserName = user;
				ViewBag.Token = token;
				return View();
			}
			return RedirectToAction("Login");
		}

		[HttpPost]
		public async Task<IActionResult> ResetPasswordAsync(ResetViewModel model)
		{
			if (ModelState.IsValid)
			{
				bool checkedToken = _tokenRepository.CheckToken(model.UserName, model.Token);
				if (checkedToken)
				{
					await _repo.ResetPassWord(model);
					return RedirectToAction("Index", "Home");
				}
				return RedirectToAction("Login");
			}
			ViewBag.CustomerUserName = model.UserName;
			ViewBag.Token = model.Token;
			return View(model);
		}

		[HttpGet]
		public IActionResult ChangeInfor()
		{
			if (!User.Identity.IsAuthenticated || User.IsInRole("Admin"))
				return RedirectToAction("Login");

			int id = Convert.ToInt32(User.FindFirstValue(ClaimTypes.NameIdentifier));
			InforViewModel model = _repo.GetUserInfor(id);
			return View(model);
		}

		[HttpPost]
		public async Task<IActionResult> ChangeInforAsync(InforViewModel model)
		{
			if (!User.Identity.IsAuthenticated || User.IsInRole("Admin"))
				return RedirectToAction("Login");

			int id = Convert.ToInt32(User.FindFirstValue(ClaimTypes.NameIdentifier));
			IFormFileCollection files = HttpContext.Request.Form.Files;
			await _repo.ChangeInforUser(model, id, files);

			return RedirectToAction("Profile");
		}

		public async Task<IActionResult> ClearImage()
		{
			int id = Convert.ToInt32(User.FindFirstValue(ClaimTypes.NameIdentifier));
			await _repo.ClearImage(id);
			return RedirectToAction("Profile");
		}

		[HttpGet]
		public IActionResult ChangePass()
		{
			if (!User.Identity.IsAuthenticated || User.IsInRole("Admin"))
				return RedirectToAction("Login");

			return View();
		}

		[HttpPost]
		public async Task<IActionResult> ChangePassAsync(ChangePasswordViewModel model)
		{
			if (!User.Identity.IsAuthenticated || User.IsInRole("Admin"))
				return RedirectToAction("Login");

			if (!ModelState.IsValid) return View(model);

			int id = Convert.ToInt32(User.FindFirstValue(ClaimTypes.NameIdentifier));
			string user = User.FindFirstValue(ClaimTypes.Name);

			if (await _repo.HaveAccount(user, model.OldPassword))
			{
				await _repo.ChangePasswordUser(model, id);
				return RedirectToAction("Profile");
			}
			ViewBag.Message = "Your password is wrong! Please try again.";
			return View();
		}

		public IActionResult Profile()
		{
			if (!User.Identity.IsAuthenticated || User.IsInRole("Admin"))
				return RedirectToAction("Login");

			int id = Convert.ToInt32(User.FindFirstValue(ClaimTypes.NameIdentifier));
			InforViewModel model = _repo.GetUserInfor(id);

			return View(model);
		}
	}
}

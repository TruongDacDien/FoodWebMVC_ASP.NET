using FoodWebMVC.Interfaces;
using FoodWebMVC.Models;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace FoodWebMVC.Views.User.Components.ChangePassComponent
{
    public class ChangePassComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();  
        }
    }
}

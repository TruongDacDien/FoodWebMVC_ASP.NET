using FoodWebMVC.Models;
using Microsoft.AspNetCore.Mvc;

namespace FoodWebMVC.Views.Cart.Components.CartComponent
{
	public class CartComponent : ViewComponent
	{
        public IViewComponentResult Invoke(IEnumerable<Item> list)
        {
            return View(list);
        }
    }
}

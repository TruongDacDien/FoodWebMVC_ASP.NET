using FoodWebMVC.Models;
using Microsoft.AspNetCore.Mvc;

namespace FoodWebMVC.Views.Cart.Components.Orders;

public class OrdersComponent : ViewComponent
{
	public IViewComponentResult Invoke(IEnumerable<Order> obj)
	{
		return View(obj);
	}
}
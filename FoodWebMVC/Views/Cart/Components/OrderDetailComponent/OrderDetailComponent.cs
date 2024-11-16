using FoodWebMVC.Models;
using Microsoft.AspNetCore.Mvc;

namespace FoodWebMVC.Views.Cart.Components.OderDetail
{
    public class OrderDetailComponent : ViewComponent
    {
        public IViewComponentResult Invoke(IEnumerable<OrderDetail> obj)
        {
            return View(obj);
        }
    }
}

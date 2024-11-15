using FoodWebMVC.Models;
using System.ComponentModel;

namespace FoodWebMVC.Models
{
	public class Item
	{
		public Product Product { get; set; }
		[DisplayName("Số lượng")]
		public int Quantity { get; set; }
		[DisplayName("Tổng tiền")]
		public decimal TotalCost
		{
			get
			{
				return Product.ProductPrice * Quantity;
			}
		}
	}
}

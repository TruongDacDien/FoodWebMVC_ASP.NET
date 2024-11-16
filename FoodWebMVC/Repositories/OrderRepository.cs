using FoodWebMVC.Models;
using FoodWebMVC.Interfaces;

namespace FoodWebMVC.Repositories
{
	public class OrderRepository: RepositoryBase<Order>, IOrderRepository
    {
		public OrderRepository(FoodWebMVCDbContext context): base(context)
		{

		}
		public async Task UpdatePaymentState(int orderId)
        {
			var order = await _context.Orders.FindAsync(orderId);
			order.PaidState = true;
			await _context.SaveChangesAsync();
        }
	}
}

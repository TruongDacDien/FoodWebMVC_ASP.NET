using FoodWebMVC.Models;
using FoodWebMVC.Interfaces;

namespace FoodWebMVC.Repositories
{
    public class OrderDetailRepository : RepositoryBase<OrderDetail>, IOrderDetailRepository
    {

    public OrderDetailRepository(FoodWebMVCDbContext context) : base(context)
    {

    }
    }
}

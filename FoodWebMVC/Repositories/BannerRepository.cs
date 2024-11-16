using FoodWebMVC.Models;
using FoodWebMVC.Interfaces;

namespace FoodWebMVC.Repositories
{
    public class BannerRepository : RepositoryBase<Banner>, IBannerRepository
    {
        public BannerRepository(FoodWebMVCDbContext context): base(context)
        {

        }
    }
}

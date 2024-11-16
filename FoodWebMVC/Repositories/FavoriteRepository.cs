using FoodWebMVC.Models;
using FoodWebMVC.Interfaces;

namespace FoodWebMVC.Repositories
{
    public class FavoriteRepository: RepositoryBase<Favorite>, IFavoriteRepository
    {
        public FavoriteRepository(FoodWebMVCDbContext context) : base(context)
        {

        }
    }
}

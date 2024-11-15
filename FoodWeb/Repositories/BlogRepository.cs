using FoodWebMVC.Models;
using FoodWebMVC.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace FoodWebMVC.Repositories
{
	public class BlogRepository :RepositoryBase<Blog>, IBlogRepository
	{
		public BlogRepository(FoodWebMVCDbContext context) : base(context){}
	}
}

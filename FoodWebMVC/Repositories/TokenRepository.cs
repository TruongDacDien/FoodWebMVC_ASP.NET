using FoodWebMVC.Interfaces;
using FoodWebMVC.Models;

namespace FoodWebMVC.Repositories;

public class TokenRepository : ITokenRepository
{
	private readonly FoodWebMVCDbContext _context;

	public TokenRepository(FoodWebMVCDbContext context)
	{
		_context = context;
	}

	public bool CheckToken(string userName, string token)
	{
		return _context.Tokens.FirstOrDefault(Token =>
			Token.CustomerUserName == userName && Token.TokenValue == token && Token.Expiry > DateTime.Now) != null;
	}
}
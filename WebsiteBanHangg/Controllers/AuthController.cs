using Microsoft.AspNetCore.Mvc;
using WebsiteBanHangg.Models;

namespace WebsiteBanHangg.Controllers
{
    public class AuthController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        
    }
}

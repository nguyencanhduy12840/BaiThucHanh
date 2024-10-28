using Microsoft.AspNetCore.Mvc;
using WebsiteBanHangg.Models;

namespace WebsiteBanHangg.Controllers
{
    public class ProductController : Controller
    {
        private readonly WebsitebanhangContext db;
        public ProductController(WebsitebanhangContext context)
        {
            db = context;
        }
        public IActionResult Index()
        {
            return View();
        }
    }
}

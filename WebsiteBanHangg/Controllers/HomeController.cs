using Azure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using WebsiteBanHangg.Models;
using X.PagedList;

namespace WebsiteBanHangg.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        WebsitebanhangContext db = new WebsitebanhangContext();
        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index(int? page)
        {
            int pageSize = 4;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listDanhMuc = db.Categories.ToList();
            var listSanPham = db.Products.AsNoTracking().OrderBy(x => x.ProductName);
            PagedList<Product> lst = new PagedList<Product>(listSanPham, pageNumber, pageSize);
            var viewModel = new CategoryProductViewModel
            {
                Categories = listDanhMuc,
                
            };
            return View(lst);
        }

        public IActionResult getProductWithCate(int CategoryId, int? page)
        {
            int pageSize = 4;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listDanhMuc = db.Categories.ToList();
            var listSanPham = db.Products.AsNoTracking().Where(x => x.CategoryId == CategoryId).OrderBy(x => x.ProductName);
            PagedList<Product> lst = new PagedList<Product>(listSanPham, pageNumber, pageSize);
            ViewBag.CategoryId = CategoryId;
            return View(lst);
        }

        public IActionResult ProductDetail(int productId)
        {
            var product = db.Products.SingleOrDefault(x => x.ProductId == productId);
            ViewBag.productImg = product.Image;
            return View(product);
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
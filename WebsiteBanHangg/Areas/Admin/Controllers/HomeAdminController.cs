using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebsiteBanHangg.Models;
using X.PagedList;
using static System.Net.Mime.MediaTypeNames;

namespace WebsiteBanHangg.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        WebsitebanhangContext db = new WebsitebanhangContext();
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }
        [Route("product")]
        public IActionResult ProductList(int? page)
        {
            int pageSize = 4;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listDanhMuc = db.Categories.ToList();
            var listSanPham = db.Products.AsNoTracking().OrderBy(x => x.ProductName);
            PagedList<Product> lst = new PagedList<Product>(listSanPham, pageNumber, pageSize);
            return View(lst);
        }
        [Route("CreateNewProduct")]
        [HttpGet]
        public IActionResult CreateNewProduct()
        {
            ViewBag.CategoryId = new SelectList(db.Categories.ToList(), "CategoryId", "CategoryName");
            return View();
        }
        [Route("CreateNewProduct")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateNewProduct(Product product, IFormFile Image)
        {
            if (ModelState.IsValid)
            {
                if (Image != null && Image.Length > 0)
                {
                    
                    var imagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images", Image.FileName);
                    using (var stream = new FileStream(imagePath, FileMode.Create))
                    {
                        await Image.CopyToAsync(stream);
                    }
                    product.Image =  Image.FileName;
                }
                db.Products.Add(product);
                await db.SaveChangesAsync();
                return Redirect("product");
            }
            ViewBag.CategoryId = new SelectList(db.Categories.ToList(), "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        [Route("UpdateProduct")]
        [HttpGet]
        public IActionResult UpdateProduct(int productId)
        {
            ViewBag.CategoryId = new SelectList(db.Categories.ToList(), "CategoryId", "CategoryName");
            var sanpham = db.Products.Find(productId);
            return View(sanpham);
        }
        [Route("UpdateProduct")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateProduct(Product product, IFormFile Image)
        {
            if (ModelState.IsValid)
            {
                var existingProduct = db.Products.AsNoTracking().FirstOrDefault(p => p.ProductId == product.ProductId);

                if (existingProduct == null)
                {
                    return NotFound();
                }
                if (Image != null && Image.Length > 0)
                {
                    var imagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images", Image.FileName);

                    using (var stream = new FileStream(imagePath, FileMode.Create))
                    {
                        await Image.CopyToAsync(stream);
                    }
                    product.Image = Image.FileName;
                }
                else
                {
                    product.Image = existingProduct.Image;
                }

                db.Entry(product).State = EntityState.Modified;
                await db.SaveChangesAsync();

                return Redirect("product");
            }
            ViewBag.CategoryId = new SelectList(db.Categories.ToList(), "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        [Route("DeleteProduct")]
        [HttpGet]
        public IActionResult DeleteProduct(int productId)
        {
            TempData["Message"] = "";
            db.Remove(db.Products.Find(productId));
            db.SaveChanges();
            TempData["Message"] = "Delete Product Successfully";
            return Redirect("product");
        }

        [Route("Dashboard")]
        public IActionResult getDashboard()
        {
            int productCount = db.Products.Count();
            int nikeCount = db.Products
                .Count(p => p.CategoryId == 1);
            int pumaCount = db.Products
                .Count(p => p.CategoryId == 2);
            int adidasCount = db.Products
                .Count(p => p.CategoryId == 3);
            ViewBag.ProductCount = productCount;
            ViewBag.NikeCount = nikeCount;
            ViewBag.PumaCount = pumaCount;
            ViewBag.AdidasCount = adidasCount;
            return View();
        }
        [Route("ProductDetail")]
        public IActionResult ProductDetail(int productId)
        {
            var product = db.Products
                    .Include(p => p.Category)
                    .FirstOrDefault(p => p.ProductId == productId);

            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }
    }
}


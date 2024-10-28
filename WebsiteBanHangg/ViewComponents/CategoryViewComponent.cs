using WebsiteBanHangg.Models;
using Microsoft.AspNetCore.Mvc;
using WebsiteBanHangg.Repository;

namespace WebsiteBanHangg.ViewComponents
{
    public class CategoryViewComponent : ViewComponent
    {
        private readonly ICategory category;
        public CategoryViewComponent(ICategory categoryy)
        {
            category = categoryy;
        }
        public IViewComponentResult Invoke()
        {
            var cate = category.GetAll().OrderBy(x => x.CategoryName);
            return View(cate);
        }
    }
}

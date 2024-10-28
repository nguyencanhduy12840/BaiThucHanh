using WebsiteBanHangg.Models;
namespace WebsiteBanHangg.Repository
{
    public interface ICategory
    {
        Category Add(Category category);
        Category Update(Category category);
        Category Delete(Category category);
        Category Get(int id);
        IEnumerable<Category> GetAll();
    }
}

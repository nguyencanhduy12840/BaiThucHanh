using WebsiteBanHangg.Models;
namespace WebsiteBanHangg.Repository
{
    public class CategoryRepository : ICategory
    {
        private readonly WebsitebanhangContext db;

        public CategoryRepository(WebsitebanhangContext db)
        {
            this.db = db;
        }

        public Category Add(Category category)
        {
            db.Categories.Add(category);
            db.SaveChanges();
            return category;
        }

        public Category Delete(Category category)
        {
            throw new NotImplementedException();
        }

        public Category Get(int id)
        {
            return db.Categories.Find(id);
        }

        public IEnumerable<Category> GetAll()
        {
            return db.Categories;
        }

        public Category Update(Category category)
        {
            db.Update(category);
            db.SaveChanges();
            return category;
        }
    }
}

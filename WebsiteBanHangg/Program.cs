using Microsoft.EntityFrameworkCore;
using WebsiteBanHangg.Models;
using WebsiteBanHangg.Repository;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddControllersWithViews();


var connectionString = builder.Configuration.GetConnectionString("WebsitebanhangContext");
builder.Services.AddDbContext<WebsitebanhangContext>(x => x.UseSqlServer(connectionString));


builder.Services.AddScoped<ICategory, CategoryRepository>();

var app = builder.Build();


if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();

using System;
using System.Collections.Generic;

namespace WebsiteBanHangg.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string ProductName { get; set; } = null!;

    public decimal Price { get; set; }

    public int Quantity { get; set; }

    public string? Description { get; set; }

    public string? Image { get; set; }

    public int? CategoryId { get; set; }

    public virtual Category? Category { get; set; }
}

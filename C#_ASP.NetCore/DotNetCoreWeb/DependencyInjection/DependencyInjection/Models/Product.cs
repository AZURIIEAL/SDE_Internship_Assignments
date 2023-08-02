namespace DependencyInjection.Models
{

    //This app will need a temporary storage for storing some products. To keep things simple, we will be storing these products in an “In-Memory Repository” and not in the database
    public class Product
    {
        public string Name { get; set; } = string.Empty;
        public decimal Price { get; set; }
    }
}

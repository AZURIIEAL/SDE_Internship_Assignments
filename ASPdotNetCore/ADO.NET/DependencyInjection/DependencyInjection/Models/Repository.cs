﻿namespace DependencyInjection.Models
{
    public class Repository : IRepository //Extends an interface.
    {

        public IEnumerable<Product> Products => products.Values;
        public Product this[string name] => products[name];


        public void AddProduct(Product product) => products[product.Name] = product;
        public void DeleteProduct(Product product) => products.Remove(product.Name);


        private Dictionary<string, Product> products; //Declaring an interface.
        public Repository() //Ctor
        {
            products = new Dictionary<string, Product>(); 
            new List<Product> {
                new Product { Name = "Shoes", Price = 99M },
                new Product { Name = "Shirts", Price = 29.99M },
                new Product { Name = "Pants", Price = 40.5M }
            }.ForEach(p => AddProduct(p));
        }

       
        
    }
}

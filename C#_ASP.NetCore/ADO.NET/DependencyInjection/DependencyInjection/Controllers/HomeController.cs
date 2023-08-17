using DependencyInjection.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace DependencyInjection.Controllers
{
    public class HomeController : Controller
    {

        //Variable and a ctor.
        private IRepository repository;
        public HomeController(IRepository repo)
        {
            repository = repo;
        }


        public IActionResult Index()
        {
            return View(repository.Products);
        }


    }
}
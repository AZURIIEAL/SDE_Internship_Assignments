using EmployeeManagement.Models;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeManagement.Controllers
{
    public class EmployeeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }


        //Will do method overloading here to set the get and post method.
        [HttpPost]
        public IActionResult Create(Employee employee)
        {
            return View();

        }
    }
}

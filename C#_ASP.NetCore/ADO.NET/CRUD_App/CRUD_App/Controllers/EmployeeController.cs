using CRUD_App.Models;
using Microsoft.AspNetCore.Mvc;

namespace CRUD_App.Controllers
{
    public class EmployeeController : Controller
    {
        public IActionResult Index()
        {
            return View(Repository.AllEmpoyees);
        }

        // HTTP GET VERSION
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        // HTTP POST VERSION  
        [HttpPost]

        //version of action method will be of HTTP POST type and will be invoked when the form is submitted.
        //This version of the action method will be responsible for receiving submitted data
        public IActionResult Create(Employee employee)
        {
            Repository.Create(employee);
            return View("Thanks", employee);
        }

        [HttpGet]
        public IActionResult Update(string empname)
        {
            Employee employee = Repository.AllEmpoyees.FirstOrDefault(e => e.Name == empname);
            return View();
        }

        [HttpPost]
        public IActionResult Update(Employee employee, string empname)
        {
            Repository.AllEmpoyees.FirstOrDefault(e => e.Name == empname).Age = employee.Age;
            Repository.AllEmpoyees.FirstOrDefault(e => e.Name == empname).Salary = employee.Salary;
            Repository.AllEmpoyees.FirstOrDefault(e => e.Name == empname).Department = employee.Department;
            Repository.AllEmpoyees.FirstOrDefault(e => e.Name == empname).Sex = employee.Sex;
            Repository.AllEmpoyees.FirstOrDefault(e => e.Name == empname).Name = employee.Name;

            return RedirectToAction("Index");
        }
    }
}

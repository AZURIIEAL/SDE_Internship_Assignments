using EmployeeDataManager.Models;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeDataManager.Controllers
{
    public class EmployeeController : Controller
    {

        public IActionResult Read()
        {
            return View(DbMimic.AllEmpoyees);
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
            employee.SetId();
            DbMimic.Create(employee);
            return View("Thanks", employee);

        }

        //The get method in update to get the object from the List.
        [HttpGet]
        public IActionResult Update(int empId)
        { 
            Employee employee = DbMimic.AllEmpoyees.FirstOrDefault(x =>x.Id == empId);
            return View(employee);
        }
        [HttpPost]
        public IActionResult Update(Employee employee,int empId) 
        {
            DbMimic.AllEmpoyees.FirstOrDefault(x=>x.Id==empId).Name = employee.Name;
            DbMimic.AllEmpoyees.FirstOrDefault(x => x.Id == empId).Gender = employee.Gender;
            DbMimic.AllEmpoyees.FirstOrDefault(x => x.Id == empId).EmployeeType = employee.EmployeeType;
            DbMimic.AllEmpoyees.FirstOrDefault(x => x.Id == empId).Salary = employee.Salary;
            DbMimic.AllEmpoyees.FirstOrDefault(x => x.Id == empId).Department = employee.Department;
            return RedirectToAction("Read");
        }


        [HttpPost]
        public IActionResult Delete(int empId)
        {
            Employee employee = DbMimic.AllEmpoyees.Where(e => e.Id == empId).FirstOrDefault();
            DbMimic.Delete(employee);
            return RedirectToAction("Read");
        }
    }
}


using FirstWebApp.Models;
using Microsoft.AspNetCore.Mvc;

namespace FirstWebApp.Controllers
{
    public class FirstNewController : Controller
    {
        public string Index()
        {
            //Change the return type to string and then we can access it from localhost/FirstNew/index index is the name of the method.
            //We have no need to specify the index part if it is named as index as .net would default call index(),incase of any other method name we need to specify it.
            return "Hey,How are you";
        }

        public IActionResult Hello()
        {
            ViewBag.Message = "Dynamic Hello";
            return View();
        }

        public IActionResult Info()
        {
            Person person = new Person();//declaring a new object
            person.Name = "Abin";
            person.Age = 21;
            person.Location = "Kerala";
            return View(person); //Passing the person object to the View
        }
    }
}
 
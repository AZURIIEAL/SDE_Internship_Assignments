using Microsoft.AspNetCore.Mvc;

namespace FirstWebApp.Controllers
{
    public class FirstController : Controller
    {
        public IActionResult Index()
            //IActionResult is the return type
        {
            return View();
        }
    }
}

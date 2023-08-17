using Configuation.Services;
using Microsoft.AspNetCore.Mvc;

namespace Configuation.Controllers
{
    public class HomeController : Controller
    {
        private TotalUsers totalUsers;
        public HomeController(TotalUsers tu)
        {
            totalUsers = tu;
        }

        public string Index()
        {
            return "Total Users are: " + totalUsers.TUsers();
        }
    }

}
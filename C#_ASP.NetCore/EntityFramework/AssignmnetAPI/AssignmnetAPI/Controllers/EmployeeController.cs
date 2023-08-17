
using Microsoft.AspNetCore.Mvc;

namespace EmployeeApplicationAPI.Controllers
{
    [ApiController]
    [Route("api/employees")]
    public class EmployeeController : Controller
    {
        // GET: EmployeeController
        [HttpGet]
        public ActionResult hello()
        {
            return Ok(1);
        }
    }
}

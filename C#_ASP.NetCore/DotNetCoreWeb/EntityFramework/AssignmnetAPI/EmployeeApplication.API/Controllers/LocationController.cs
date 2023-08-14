using EmployeeApplication.Model.Models;
using EmployeeApplication.Repository.Context;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EmployeeApplication.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LocationController : ControllerBase
    {
        private readonly EmployeeApplicationDbContext? dbContext;

        public LocationController(EmployeeApplicationDbContext dbContext)
        {

            this.dbContext = dbContext;
        }


        [HttpPost("Add")]
        public IActionResult Add([FromQuery] Location location)
        {
            return Ok(location);
        }
        [HttpDelete("Delete/{id}")]
        public IActionResult Delete([FromQuery] int id)
        {
            return Ok(0);
        }
        [HttpGet("GetById/{id}")]
        public string GetById(int id)
        {
            return "value";
        }
        [HttpGet("GetAll")]
        public ActionResult<Location> GetAll()
        {
            return Ok();
        }


        [HttpPut("Update/{id}")]
        public void Update([FromBody] Location location)
        {
        }

       
    }
}

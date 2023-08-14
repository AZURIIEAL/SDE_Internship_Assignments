using EmployeeApplication.Model.Models;
using EmployeeApplication.Repository.Context;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EmployeeApplication.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly EmployeeApplicationDbContext? dbContext;

        public EmployeeController(EmployeeApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        [HttpPost("Add")]
        public IActionResult Add([FromQuery] Employee employee)
        {
            //Need to create a new Donation object
            var EmployeeNew = new Employee()
            {
                Id = Guid.NewGuid(),
                Name = addDonationData.Name,
                BloodGroup = addDonationData.BloodGroup,
                Email = addDonationData.Email,
                Phone = addDonationData.Phone,
                Address = addDonationData.Address
            };
            dbContext?.Add(donationNEW);
            return Ok(dbContext?.SaveChanges());
            return Ok(employee);
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
        public ActionResult<Employee> GetAll()
        {
            return Ok();
        }


        [HttpPut("Update/{id}")]
        public void Update([FromBody] Employee employee)
        {
        }

    }
}

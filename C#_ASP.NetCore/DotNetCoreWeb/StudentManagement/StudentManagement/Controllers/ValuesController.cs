using Microsoft.AspNetCore.Mvc;
using StudentManagement.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace StudentManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET api/<ValuesController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }


        [HttpPost]
        public IActionResult PostData(string firstName,string lastName,string Address,string Email)
        {

            //Need to create a new Donation object
            DbQuery query = new DbQuery();
            Student student = new Student();
            student.FirstName = firstName;
            student.LastName = lastName;
            student.Address = Address;
            student.Email = Email;
            query.AddStudent(student);
            return Ok();
        }
        /* // POST api/<ValuesController>
         [HttpPost]
         public void Post([FromBody] string value)
         {
         }

         // PUT api/<ValuesController>/5
         [HttpPut("{id}")]
         public void Put(int id, [FromBody] string value)
         {
         }

         // DELETE api/<ValuesController>/5
         [HttpDelete("{id}")]
         public void Delete(int id)
         {
         }*/
    }
}

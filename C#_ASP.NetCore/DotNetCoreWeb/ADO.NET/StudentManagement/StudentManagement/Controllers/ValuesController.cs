using Microsoft.AspNetCore.Mvc;
using StudentManagement.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace StudentManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        //CREATE
        //Insert Values into 
        [HttpPost("InsertData")]
        public IActionResult PostData(string firstName,string lastName,string Address,string Email)
        {
            DbQuery query = new DbQuery();
            Student student = new Student();
            student.FirstName = firstName;
            student.LastName = lastName;
            student.Address = Address;
            student.Email = Email;
            query.AddStudent(student);
            return Ok();
        }

        //READ
        // GET details by Identity.
        [HttpGet("FindData/{id}")]
        public IActionResult GetById(int id)
        {
            DbQuery query = new DbQuery();
            Student donone = query.FindStudentById(id);
            if (donone == null)

            {
                return NotFound();
            }
            else
            {
                return Ok(donone);
            }

        }


        //READ
        // GET details by Identity.
        [HttpGet("FindDataAll")]
        public IActionResult GetAll()
        {
            DbQuery query = new DbQuery();
            return Ok(query.GetStudents());

        }


        [HttpPut("UpdateData/{id}")]
        public IActionResult UpdateData(int id, [FromBody] Student updatedStudent)
        {
            if (updatedStudent == null)
            {
                return BadRequest("Invalid data");
            }

            DbQuery query = new DbQuery();
            Student existingStudent = query.FindStudentById(id);

            if (existingStudent == null)
            {
                return NotFound();
            }

            // Update only the provided fields, keeping the previous data if a field is not provided.
            if (!string.IsNullOrWhiteSpace(updatedStudent.FirstName))
            {
                existingStudent.FirstName = updatedStudent.FirstName;
            }
            if (!string.IsNullOrWhiteSpace(updatedStudent.LastName))
            {
                existingStudent.LastName = updatedStudent.LastName;
            }
            if (!string.IsNullOrWhiteSpace(updatedStudent.Address))
            {
                existingStudent.Address = updatedStudent.Address;
            }
            if (!string.IsNullOrWhiteSpace(updatedStudent.Email))
            {
                existingStudent.Email = updatedStudent.Email;
            }

            query.UpdateStudent(id,existingStudent);

            return Ok();
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteData(int id)
        {
            DbQuery query = new DbQuery();
            Student existingStudent = query.FindStudentById(id);
            if (existingStudent == null)
            {
                return NotFound();
            }
            else
            {
                query.DeleteStudent(id);
                return Ok("Deleted");
            }
        }

    }
}

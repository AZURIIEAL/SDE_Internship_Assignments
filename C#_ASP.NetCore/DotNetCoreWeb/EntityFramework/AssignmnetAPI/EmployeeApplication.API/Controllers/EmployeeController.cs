using EmployeeApplication.Model.Models;
using EmployeeApplication.Repository.Context;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EmployeeApplication.API.Controllers
{
[Route("api/[controller]")]
[ApiController]
public class EmployeeController : ControllerBase
{
    private readonly EmployeeApplicationDbContext _dbContext;

    public EmployeeController(EmployeeApplicationDbContext dbContext)
    {
        this._dbContext = dbContext;
    }
    [HttpPost("add-employee")]
    public async Task<IActionResult> AddAsync([FromQuery] EmployeeDuplicate emp)
    {
        try
        {
            Employee EmployeeNew = new Employee
            {
                FirstName = emp.FirstName,
                LastName = emp.LastName,
                Email = emp.Email,
                PhoneNumber = emp.PhoneNumber,
                DepartmentId = emp.DepartmentId,
            };
            _dbContext.Add(EmployeeNew);
            await _dbContext.SaveChangesAsync();
            return Ok(EmployeeNew);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex);
        }

    }
    [HttpDelete("delete-by-id/{id}")]
    public async Task<IActionResult> DeleteAsync([FromQuery] int id)
    {
        try
        {
            var toDelete = await _dbContext.Departments.FindAsync(id);
            if (toDelete is null)
            {
                return NotFound();
            }

            _dbContext.Departments.Remove(toDelete);
            await _dbContext.SaveChangesAsync();

            return Ok("Deleted");
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex);
        }
    }


    [HttpGet("get-by-id/{id}")]
    public async Task<IActionResult> GetDataAsync(int id)
    {
        try
        {
            var toGet = await _dbContext.Departments.FindAsync(id);
            if (toGet == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(toGet);
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex);
        }
    }

    [HttpGet("get-all")]
    public async Task<ActionResult<Location>> GetAllAsync()
    {
        try
        {
            var locations = await _dbContext.Departments.ToListAsync();
            return Ok(locations);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex);
        }
    }


    [HttpPut("update-by-id")]
    public async Task<IActionResult> UpdatebyIdAsync([FromQuery] Department department)
    {
        try
        {
            Department? toUpdate = await _dbContext.Departments.FindAsync(department.Id);
            if (toUpdate is null)
            {
                return NotFound();
            }
            if (string.IsNullOrWhiteSpace(department.Name))
            {
                return UnprocessableEntity();
            }
            toUpdate.Name = department.Name;
            await _dbContext.SaveChangesAsync();
            return Ok(toUpdate);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex);
        }
    }

}
}

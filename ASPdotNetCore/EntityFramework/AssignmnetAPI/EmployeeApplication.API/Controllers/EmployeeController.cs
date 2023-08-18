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
        _dbContext.Employees.Add(EmployeeNew);
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
        var toDelete = await _dbContext.Employees.FindAsync(id);
        if (toDelete is null)
        {
            return NotFound();
        }

        _dbContext.Employees.Remove(toDelete);
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
        var toGet = await _dbContext.Employees.FindAsync(id);
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
public async Task<IActionResult> GetAllAsync()
{
    try
    {
        var employees = await _dbContext.Employees.ToListAsync();
        return Ok(employees);
    }
    catch (Exception ex)
    {
        return StatusCode(500, ex);
    }
}


[HttpPut("{id}")]
public async Task<IActionResult> UpdatebyIdAsync(int id,[FromQuery] EmployeeDuplicate emp)
{
    try
    {
        Employee? toUpdate = await _dbContext.Employees.FindAsync(id);
        if (toUpdate is null)
        {
            return NotFound();
        }
        if (!string.IsNullOrWhiteSpace(emp.FirstName))
        {
            toUpdate.FirstName = emp.FirstName;
        }
        if (!string.IsNullOrWhiteSpace(emp.LastName))
        {
            toUpdate.LastName = emp.LastName;
        }
        if (!string.IsNullOrWhiteSpace(emp.Email))
        {
            toUpdate.Email = emp.Email;
        }
        if (!string.IsNullOrWhiteSpace(emp.PhoneNumber))
        {
            toUpdate.PhoneNumber = emp.PhoneNumber;
        }
        if (!string.IsNullOrWhiteSpace((emp.DepartmentId.ToString())))
        {
            toUpdate.FirstName = emp.FirstName;
        }

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

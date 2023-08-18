using EmployeeApplication.Model.Models;
using EmployeeApplication.Repository.Context;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;


namespace EmployeeApplication.API.Controllers
{
[Route("api/[controller]")]
[ApiController]
public class LocationController : ControllerBase
{
    private readonly EmployeeApplicationDbContext _dbContext;

    public LocationController(EmployeeApplicationDbContext dbContext)
    {

        this._dbContext = dbContext;
    }

    [HttpPost("add-location")]
    public async Task<IActionResult> AddAsync([FromQuery] LocationDuplicate location)
    {
        try
        {
            Location locationNew = new Location { Name = location.Name };
            _dbContext.Add(locationNew);
            await _dbContext.SaveChangesAsync();
            return Ok(locationNew);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex);
        }

    }
    [HttpDelete("delete-by-id/{id}")]
    public async Task<IActionResult> DeleteAsync( int id)
    {
        try
        {
            var toDelete = await _dbContext.Locations.FindAsync(id);
            if (toDelete is null)
            {
                return NotFound();
            }

            _dbContext.Locations.Remove(toDelete);
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
            var toGet = await _dbContext.Locations.FindAsync(id);
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
            var locations = await _dbContext.Locations.ToListAsync();
            return Ok(locations);
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex);
        }
    }


    [HttpPut("update-by-id")]
    public async Task<IActionResult> UpdatebyIdAsync([FromQuery]  Location location)
{
    try
    {
        Location? toUpdate = await _dbContext.Locations.FindAsync(location.Id);
        if (toUpdate is null)
        {
            return NotFound();
        }
        if (string.IsNullOrWhiteSpace(location.Name))
        {
            return UnprocessableEntity();
        }
        toUpdate.Name = location.Name;
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

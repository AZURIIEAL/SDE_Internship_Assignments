using BloodDonationsEF.DataBaseMan;
using BloodDonationsEF.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BloodDonationsEF.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly DonationsAPIDbContext? dbContext;
        //We have all the required connections except a connection from the controller to the DB Context
        public ValuesController(DonationsAPIDbContext dbContext)
        {
            //We need a private property,to contact the database
            this.dbContext = dbContext;
        }

        [HttpPost("AddData")]
        //We will need another model as a domain as we are taking inputs..
        public IActionResult PostData([FromQuery] DonationAdd addDonationData)
        {
            //Need to create a new Donation object
            var donationNEW = new DonationFull()
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
        }
        //Now as we have inserted a data we need to see it too

        [HttpGet("GetAllData")]
        //Using Ienumerable to aoid the Ok wrapping while using IActionResult
        public IActionResult GetAllData()
        {
            return Ok(dbContext?.Donation.ToList());
        }
        //As we have data and now it can be viewed too ,now our task is updation
        //Now to edit/Update the data,we can use Put for that.
        [HttpPut("Updation/{id:guid}")]
        //but we would require a ID here.
        public IActionResult UpdateDonations(Guid Id,[FromQuery] DonationAdd addDonationDataUpdation)
        {
            DonationFull donationNEW = new DonationFull();
            var donationUpdation = dbContext?.Donation.Find(Id);
            if (donationUpdation == null)
            {
                return NotFound();
            }
            else
            {

                // Update only the provided fields, keeping the previous data if a field is not provided.
                if (!string.IsNullOrWhiteSpace(donationUpdation.Name))
                {
                    donationUpdation.Name = addDonationDataUpdation.Name;
                }
                if (!string.IsNullOrWhiteSpace(donationUpdation.Email))
                {
                    donationUpdation.Email = addDonationDataUpdation.Email;
                }
                if (!string.IsNullOrWhiteSpace(donationUpdation.BloodGroup))
                {
                    donationUpdation.BloodGroup = addDonationDataUpdation.BloodGroup;
                }
                if (!string.IsNullOrWhiteSpace(donationUpdation.Phone))
                {
                    donationUpdation.Phone = addDonationDataUpdation.Phone;
                }
                if (!string.IsNullOrWhiteSpace(donationUpdation.Address))
                {
                    donationUpdation.Address = addDonationDataUpdation.Address;
                }
                dbContext?.SaveChanges();
                return Ok(donationUpdation);
            }
        }
    }
}

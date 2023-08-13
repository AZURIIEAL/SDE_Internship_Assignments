
using BloodDonationsEF.DataBaseMan;
using BloodDonationsEF.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace BloodDonationsEF.Pages
{
    public class IndexModel : PageModel
    {
        private readonly DonationsAPIDbContext _dbContext;

        public IndexModel(DonationsAPIDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IList<DonationFull> Donations { get; private set; }

        public async Task<IActionResult> OnGetAsync()
        {
            Donations = await _dbContext.Donation.ToListAsync();
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(DonationAdd addDonationData)
        {
            var donationNEW = new DonationFull()
            {
                Id = Guid.NewGuid(),
                Name = addDonationData.Name,
                BloodGroup = addDonationData.BloodGroup,
                Email = addDonationData.Email,
                Phone = addDonationData.Phone,
                Address = addDonationData.Address
            };

            _dbContext.Donation.Add(donationNEW);
            await _dbContext.SaveChangesAsync();

            return RedirectToPage();
        }
    }
}

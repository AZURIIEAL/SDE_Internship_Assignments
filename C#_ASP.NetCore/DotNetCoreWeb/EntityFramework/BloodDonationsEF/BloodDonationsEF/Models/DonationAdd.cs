namespace BloodDonationsEF.Models
{
    public class DonationAdd
    {
        //This class wont have guid as we are not going to update that.
        public string Name { get; set; } = string.Empty;
        public string BloodGroup { get; set; }= string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Phone { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
    }
}

namespace BloodDonationsEF.Models
{
    //This class would act like our custom datatype.
    //This class will also act as our DATA MODEL CLASS (representing database Tables).
    public class DonationFull
    {

        //This would be our Donations domain model.
        public Guid Id { get; set; } //We will be using a guid for the primary key of our db
        public string Name { get; set; } =string.Empty;
        public string BloodGroup { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public long Phone { get; set; }
        public string Address { get; set; } = string.Empty;

        //After this we need to create a class file that would act like a middle man towards the database
        //As we are using entity framewok core we can use DBContext,create a new folder called Data and load a class
    }
}

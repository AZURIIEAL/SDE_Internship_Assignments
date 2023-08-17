using BloodDonationsEF.Models;
using Microsoft.EntityFrameworkCore;

namespace BloodDonationsEF.DataBaseMan
{
    //Add the nuget packages EFCore,EFSQLServer and EFTools from the packageManager.

    //Make this class inherit from DBContext which is included in the EFpackage ,it would help to connect with DB and instantiate a connection.
    //This class represents your database context and provides an entry point for accessing your data

    public class DonationsAPIDbContext : DbContext
    {
        //A ctor was made which has options and the options would be passed to the base class.

        //Dependency injection
        public DonationsAPIDbContext(DbContextOptions options) : base(options)
        {
        }
        //Create a single property as we only need one model to work with,its of type DBSet<//Having our model domain>.
        public DbSet<DonationFull> Donation { get; set; }


        //We would need to Inject this to the Program.cs as a service for the connection later.

    }
}

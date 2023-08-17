using EmployeeApplication.Model.Models;
using Microsoft.EntityFrameworkCore;


namespace EmployeeApplication.Repository.Context
{
    public class EmployeeApplicationDbContext : DbContext
    {
        public EmployeeApplicationDbContext(DbContextOptions options) : base(options)
        {
        }
        public DbSet<Location> Locations { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<Employee> Employees { get; set; }
    }
}

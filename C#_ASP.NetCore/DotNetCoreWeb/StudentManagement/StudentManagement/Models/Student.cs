using System.Net;

namespace StudentManagement.Models
{
    public class Student
    {
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string Address { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public Student(string firstName, string lastName, string Address, string Email)
        {
           FirstName = firstName;
           LastName = lastName;
           this.Address = Address;
           this.Email = Email;
        }

    }
    
}

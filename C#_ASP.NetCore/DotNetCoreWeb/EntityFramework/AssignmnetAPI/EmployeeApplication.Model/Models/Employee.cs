using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace EmployeeApplication.Model.Models
{
    public class Employee
    {
        public int Id { get; set; }

        [Required]
        public string FirstName { get; set; } = string.Empty;

        [Required]
        public string LastName { get; set; } = string.Empty;

        [Required]
        public string EMail { get; set; } = string.Empty;

        [Required]
        public string PhoneNumber { get; set; } = string.Empty;

        [Required]
        public Department? DepartmentId { get; set; }
    }
}

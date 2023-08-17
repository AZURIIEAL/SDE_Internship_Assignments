
using System.ComponentModel.DataAnnotations;


namespace EmployeeApplication.Model.Models
{
    public class Department
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; } = string.Empty;

        [Required]
        public int LocationId { get; set; }
        [Required]
        public Location? Location { get; set; }
    }
}

using System.ComponentModel.DataAnnotations;

namespace AssignmnetAPI.Models
{
    public class Location
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; } = string.Empty;
    }
}

namespace CRUD_App.Models
{
    public class Employee
    {
        //Making an employee class with properties.
        public string Name { get; set; } = string.Empty;
        public int Age { get; set; }
        public decimal Salary { get; set; }
        public string Department { get; set; } = string.Empty;
        public Char Sex { get; set; }
    }
}


namespace Employee.Model
{
    public class Employee
    {
        public string Id { get; private set; }
        public string Name { get; set; }
        public double Salary { get; set; }
        public string EmployeeType { get; set; }

        // Static fields to count the total number of employees
        private static int employeeCount = 0;

        // Static constructor to initialize the count
        static Employee()
        {
            employeeCount = 0;
        }

        // Constructor to create an employee object with auto-generated Id
        public Employee(string name, double salary, string employeeType)
        {
            employeeCount++;
            Id = "Emp" + employeeCount.ToString("D4");
            Name = name;
            Salary = salary;
            EmployeeType = employeeType;
        }
    }
}

namespace EmployeeManagement.Models
{
    //This employee class with properties would be refernced my DbMimic class
    public class Employee
    {
        public int Id { get; private set; } //ReadOnly property
        public string Name { get; set; } = string.Empty;
        public double Salary { get; set; }
        public string Department { get; set; } = string.Empty;
        public Char Gender { get; set; }
        public Char EmployeeType { get; set; } 

        // Static fields to count the total number of employees
        private static int employeeCount;

        // Static constructor to initialize the count
        static Employee()
        {
            //This field will be used to keep track of the total number of employees created.
            employeeCount = 0;
        }
        public static int GetTotalEmployeeCount()
        {
            // We can access the employeeCount static field directly from the Employee class.
            return Employee.employeeCount;
        }

        // Constructor to create an employee object with auto-generated Id
        public Employee(string name, char gender, Char employeeType, double salary,string department)
        {
            employeeCount++;
            Id = employeeCount + 1000;
            Name = name;
            Salary = salary;
            EmployeeType = employeeType;
            Department = department;
            Gender = gender;
        }
    }
}

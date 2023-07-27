public class Employee
{
    public string Id { get; private set; } //ReadOnly property
    public string Name { get; set; }
    public double Salary { get; set; }
    public string EmployeeType { get; set; }

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
    public Employee(string name, double salary, string employeeType)
    {
        employeeCount++;
        int x = employeeCount + 1000;
        Id = "Emp" + x.ToString();
        Name = name;
        Salary = salary;
        EmployeeType = employeeType;
    }
}


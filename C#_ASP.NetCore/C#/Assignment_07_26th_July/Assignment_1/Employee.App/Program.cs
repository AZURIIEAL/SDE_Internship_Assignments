 
class program
{

    // Method to print employee details
    static void PrintEmployeeDetails(Employee emp)
    {
        Console.WriteLine($"Id: {emp.Id}, Name: {emp.Name}, Salary: {emp.Salary}, Employee Type: {emp.EmployeeType}");
    }

    // Method to get the total number of employees

    static void Main()
    {
        // Create employee objects
        Employee emp1 = new Employee("John Doe", 15000, "Permanent");
        Employee emp2 = new Employee("Liam Smith", 20000, "Permanent");
        Employee emp3 = new Employee("Mary James", 15000, "Contract");

        // Print the details of the employees
        PrintEmployeeDetails(emp1);
        PrintEmployeeDetails(emp2);
        PrintEmployeeDetails(emp3);

        // Get the total number of employees
        int totalEmployees = Employee.GetTotalEmployeeCount();
        Console.WriteLine("Total number of employees: " + totalEmployees);
    }


}


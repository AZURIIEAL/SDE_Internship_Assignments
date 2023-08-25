using CQRS.Commands;
using CQRS.Queries;
using CQRS.Repositories;
using System.Reflection;
using CQRS.Models;

class Program
{
    static void Main(string[] args)
    {
        // Command the Employee Domain to save data
        var employeeCommand = new EmployeeCommands(new EmployeeCommandsRepository());
        employeeCommand.SaveEmployeeData(new CQRS.Models.Employee
        {
            Id = 200,
            FirstName = "Jane",
            LastName = "Smith",
            Street = "150 Toronto Street",
            City = "Toronto",
            PostalCode = "j1j1j1",
            DateOfBirth = new DateTime(2002, 2, 2)
        });
        Console.WriteLine($"Employee data stored");
        // Query the Employee Domain to get data
        var employeeQuery = new EmployeeQueries(new EmployeeQueriesRepository());
        var employee = employeeQuery.FindByID(100);
        Console.WriteLine($"Employee ID:{employee.Id}, Name:{employee.FullName}, Address:{employee.Address}, Age:{employee.Age}");
        Console.ReadKey();
    }
}
/*ASSIGNMENT_04
 *____________________________________________________________________________________________________________
To the Employee class of EmployeeManagement  application created earlier add below constructors
Employee(int id)   : assign only Id property
Employee(int id, string name) : assign only Name property
Employee(int id, string name, double salary) : assign only Salary property
Create employee object using the third constructor and Display details by calling Display method
_______________________________________________________________________________________________________________
*/

//Create a class Called Emplpyee.
public class Employee
{
    //Set Up 3 properties
    public int Id;
    public string Name;
    public double Salary;


    //We will proceed with contr overloading.
    // Constructor to assign only Id property.
    public Employee(int id)
    {
        Id = id;
    }

    // Constructor to assign Id and Name property.
    public Employee(int id, string name)
    {
        Id = id;
        Name = name;
    }

    // Constructor to assign Id, Name and Salary property.
    public Employee(int id, string name, int salary)
    {
        Id = id;
        Name = name;
        Salary = salary;
    }

    //A function to display the value got.
    public void Display()
    {
        Console.WriteLine("Employee Details:");
        Console.WriteLine("Id: " + Id);
        Console.WriteLine("Name: " + Name);
        Console.WriteLine("Salary: " + Salary);
    }

    //PSVM as a driver function/Entry point.
    static void Main(string[] args)
    {
        Console.WriteLine("3 parameters:");
        Employee employee3 = new Employee(111, "Abin", 15000);
        employee3.Display(); //Using the display method in the object.
        //***cntr 3 would be called here
         
        Console.WriteLine("\n2 parameters:");
        Employee employee2 = new Employee(169, "Ravi");
        employee2.Display(); //Using the display method in the object.
        //***cntr 2 would be called here

        Console.WriteLine("\n1 parameters:");
        Employee employee1 = new Employee(11);
        employee1.Display(); //Using the display method in the object.
        //***cntr 1 would be called here
    }
}


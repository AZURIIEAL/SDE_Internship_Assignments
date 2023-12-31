﻿//At first we need to make an employee class with some props.
using System.Reflection.Emit;

public class Employee  //Employee class with properties
{
    //We will not fill any data now,we will get it from SVM
    public int Id { get; set; } //for getting id
    public string Name { get; set; } //for name
    public DateTime DateOfJoin { get; set; } //to get the date if join using the datetime datatype
    public string Department { get; set; } //to get the department
    public double Salary { get; set; } //to get the salary 
    public char JobType { get; set; } //to check if P /C - permanant or contract
}

//Now to create the parent interface.
public interface IBonusCalculator //An interface to Declare a method
{
    //Method to get the bonus
    double CalculateBonus(Employee employee); //The name of the methods wil remain same.
}

//Now we need 2 more classes to access the interface and to act on their seperate conditions.
//

public class ContractEmployeeBonusCalculator : IBonusCalculator //Inheriting the interface.
{
    public double CalculateBonus(Employee employee) //For contrect employess 15%.
    {//The name of the methods wil remain same.
        return employee.Salary * (15/100);
    }
}

public class PermanentEmployeeBonusCalulator : IBonusCalculator //Inheriting the interface.
{
    public double CalculateBonus(Employee employee) //For permanenet employess 20%.
    {//The name of the methods wil remain same.
        return employee.Salary * (2/100);
    }
}

public class Program //Driver class
{
    public static void Main(string[] args) //Driver method.
    {
        Employee employee = new Employee //Making an employee object.
        {
            Id = 123,
            Name = "Abin",
            DateOfJoin = new DateTime(2020, 7, 03), //year month date
            Department = "Software Development",
            Salary = 15000,
            JobType = 'P' // P/C according to need.
        };


        IBonusCalculator bonus; 
        //An interface instance object,We will put an if condition while object creation.
        //If we put it inside the if else then there would be scope issues.
        if (employee.JobType == 'P')
        {
            bonus = new PermanentEmployeeBonusCalulator(); //if the charr is p pass it to permanent class.
     
        }
        else if (employee.JobType == 'C')
        {
            bonus = new ContractEmployeeBonusCalculator(); //if the char is C pass it to contract class.
          
        }
        else
        {
            Console.WriteLine("Enter Correctly and try again");
         
            return;
        }

       

        double Amount = bonus.CalculateBonus(employee); //interface and acces the method in them hence,Interfaceobject.method  .
        Console.WriteLine("The Bonus for the person :"+employee.Name);
        Console.WriteLine("Bonus amount: " + Amount);
        Console.ReadKey();
    }
}
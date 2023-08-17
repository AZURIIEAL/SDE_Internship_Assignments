using System;

public class Student
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int Mark { get; set; }
    public char Grade
    {
        get
        {
            if (Mark >= 90)
                return 'A';
            else if (Mark >= 80 && Mark < 90)
                return 'B';
            else if (Mark >= 70 && Mark < 80)
                return 'C';
            else
                return 'D';
        }
    }public void display()
    {
        Console.WriteLine("\nStudent ID:"+ Id);
        Console.WriteLine("Student Name:"+ Name);
        Console.WriteLine("Student Grade:"+ Grade);
    }

    static void Main(string[] args)
    {
        Student student1 = new Student 
        {
            Id = 1,
            Name = "John",
            Mark = 85
        };
        student1.display();


        Student student2 = new Student
        {
            Id = 2,
            Name = "David",
            Mark = 74
        };
        student2.display();

        Student student3 = new Student
        {
            Id = 3,
            Name = "Thomas",
            Mark = 90
        };
        student3.display();
    }
}




//Creating a student class with Id as readonly.
public class Student
{
    public int Id { get; private set; }
    public string Name { get; set; }
    public double Mark { get; set; }

    //ctor
    public Student(int id, string name, double mark)
    {
        Id = id;
        Name = name;
        Mark = mark;
    }
}

class Program
{
    //SVM driver code.
    static void Main()
    {
        //Now we need to create the list of students
        List<Student> students = new List<Student>
        {
            new Student(1, "John Doe", 85),
            new Student(2, "Liam Smith", 70),
            new Student(3, "Mary James", 62),
            new Student(4, "Davide James", 55),
            new Student(5, "Lionel Messi", 100),
            new Student(6, "Ronaldo", 90),
            new Student(7, "Neymar", 85)
        };
        //Now we need to use Linq to find some data.
        // Find the student with max mark
        Student studentWithMaxMark = students.OrderByDescending(s => s.Mark).First(); //.FIrst to get the descending one result and store it in studentWIthMaxmark

        // List the students whose mark is greater than 75
        List<Student> studentsWithMarkGreaterThan75 = students.Where(s => s.Mark > 75).ToList(); //Using .ToList to convert them into a list data

        // List the students whose name ends with 's'
        List<Student> studentsWithNameEndingWithS = students.Where(s => s.Name.EndsWith("s")).ToList(); //Uisng .EndsWith

        // Find the student whose name is 'Lionel Messi'
        Student lionelMessi = students.FirstOrDefault(s => s.Name == "Lionel Messi");

        // Display the mark of the student whose name is 'Ronaldo'
        //?.Mark: The null-conditional operator (?.) is used in case the result of FirstOrDefault is null. If "Ronaldo" is not found in the students collection, the whole expression will return null, and the null-conditional operator prevents a potential null reference exception. If "Ronaldo" is found, it will access the "Mark" property of the student.
        double markOfRonaldo = students.FirstOrDefault(s => s.Name == "Ronaldo")?.Mark ?? 0;
        //?? 0: This is the null-coalescing operator (??), which provides a default value (0 in this case) when the result of the expression on the left side of ?? is null. If the "Mark" of "Ronaldo" is null (which would happen if "Ronaldo" is not found in the collection), then the default value 0 will be assigned to markOfRonaldo
        // Output
        Console.WriteLine("Student with Max Mark: " + studentWithMaxMark.Name);
        Console.WriteLine("Students with Mark > 75:");
        foreach (var student in studentsWithMarkGreaterThan75)
        {
            Console.WriteLine($"{student.Name}, Mark: {student.Mark}");
        }
        Console.WriteLine("Students with Name Ending with 's':");
        foreach (var student in studentsWithNameEndingWithS)
        {
            Console.WriteLine($"{student.Name}, Mark: {student.Mark}");
        }

        //To confirm that messi
        if (lionelMessi != null)
        {
            Console.WriteLine($"Lionel Messi's Mark: {lionelMessi.Mark}");
        }
        else
        {
            Console.WriteLine("Lionel Messi not found in the list.");
        }

        Console.WriteLine($"Mark of Ronaldo: {markOfRonaldo}");





    }
}

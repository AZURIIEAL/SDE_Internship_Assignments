/* Assignment No1:
 * Create a console app using C#(Preferably ASP.Net Core).
 * It Should get input from the user.
 * Must use a few different datatypes.
 * Also the user should be able to see it at the end.*/


Console.WriteLine("\n ASP.Net Assignment No:1  \n");
Console.WriteLine("<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>\n\n");

// Get input from the user.
Console.Write("Enter your name: ");
string name = Console.ReadLine(); // Using String DataType.

Console.Write("Enter your age: ");
int age = int.Parse(Console.ReadLine());// Using int DataType.

Console.Write("Enter your salary: ");
double salary = double.Parse(Console.ReadLine());// Using double DataType.


Console.Write("Are you married? (true/false): ");
bool isMarried = bool.Parse(Console.ReadLine());// Using bool DataType.

// Display the user's input.
Console.WriteLine("\nUser Details:");
Console.WriteLine("Name: " + name);
Console.WriteLine("Age: " + age);
Console.WriteLine("Salary: " + salary.ToString("C")); // "C" Display salary as currency(gives a comma seperation).
Console.WriteLine("Marital Status: " + (isMarried ? "Married" : "Single")); //Tertiary Operators are used.


//Exit Notification.
Console.WriteLine("\nPress any to Exit");
//Wait for key.
Console.ReadKey();


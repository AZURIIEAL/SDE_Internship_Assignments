/*
                                 ASSIGNMENT NO 3 (06/07/2023)
________________________________________________________________________________
Write a program to display the below details of a given input string:
Length of the string
Index of a particular character
Reverse of the string
Append Hai at the beginning of the given string
Last character of the string
Replace ‘a’ by ‘_’
Calculate occurrence of given character in a string.
*/

//Rewrite the above program using stringbuilder

/*
 * Write a program to do the below datetime calculation
Print the current date and time in different formats
Find the difference between two dates
Display Day, Month, Year of a given Date
To a given Date, add 10 days

 */

//Single Calculate  method, Calculate out add, out sub, out mult, out div
//_________________________________________________________________________________


//We will be using properties like .length() ,.Reverse() etc instead of using -1 or manually reversing arrays.

using System.Text;

class Program
    //PART 1
{//__________________________________________________________________________________________________________________________________________
    //Length of the string.
    static int GetStringLength(string input)
    {
        //We can use .Length() property.
        return input.Length;
    }

    //Index of a particular character.
    static int GetCharacterIndex(string input, char character)
    {
        //We can use IndexOf Property.
        return input.IndexOf(character);
    }

    //Reverse of the string
    static string ReverseString(string input)
    {
        
        char[] charArray = input.ToCharArray(); //Fisrt store the char into an array so that we can index later.
        Array.Reverse(charArray); //Now we can use reverse it using .Reverse property.
        return new string(charArray); //Return the value as a new string.
    }

    //Append Hai at the beginning of the given string
    static string AppendHai(string input)
    {
        //String concatenation.
        return "Hai " + input;
    }

   //Last character of the string
    static char GetLastCharacter(string input)
    {
        //The return type is char
        return input[input.Length - 1];
    }

    //Replace any charachters.
    static string ReplaceCharacter(string input, char oldChar, char newChar)
    {
        return input.Replace(oldChar, newChar); //using .Replace property we will replace the oldchar variable with newchar variable in input.
    }

    //Charachter occurence
    static int CountCharacterOccurrence(string input, char character)
    {
        int count = 0; //Setting the intial count as 0.
        foreach (char c in input)
        {
            if (c == character)
                count++; //for each value in string the count wil increase.
        }
        return count;
    }

    //_________________________________________________________________________________________________________________________________

    //PART 2
    //We can use METHOD OVERLOADING.
    //Just replace String with string builder
    //Everything else is same (logic etc)
    static int GetStringLength(StringBuilder input)
    {
        return input.Length;
    }

    static int GetCharacterIndex(StringBuilder input, char character)
    {
        return input.ToString().IndexOf(character);
    }
    //NOTE : I have some doubts regarding the string builder area so im just going to convert it into string for now
    static string ReverseString(StringBuilder input)
    {
        char[] charArray = input.ToString().ToCharArray();
        Array.Reverse(charArray);
        return new string(charArray);
    }

    static StringBuilder AppendHai(StringBuilder input)
    {
        return input.Insert(0, "Hai ");
    }

    static char GetLastCharacter(StringBuilder input)
    {
        return input[input.Length - 1];
    }

    static StringBuilder ReplaceCharacter(StringBuilder input, char oldChar, char newChar)
    {
        return input.Replace(oldChar, newChar);
    }

    static int CountCharacterOccurrence(StringBuilder input, char character)
    {
        int count = 0;
        for (int i = 0; i < input.Length; i++)
        {
            if (input[i] == character)
                count++;
        }
        return count;
    }

    //__________________________________________________________________________________________________________________________________
    //PART 3
    //Making a funtion to print current time.
    static void PrintCurrentDateTime()
    {
        DateTime currentDateTime = DateTime.Now; //Declare a variable currentDateTime  and use .Now property to capture it.
        Console.WriteLine("Current Date and Time:");
        Console.WriteLine("   Format 1: " + currentDateTime.ToString("MM/dd/yyyy HH:mm:ss")); //Select different types from the drop down
        Console.WriteLine("   Format 2: " + currentDateTime.ToString("yyyy-MM-ddTHH:mm:ss")); //Select different types from the drop down
    }

    //Difference between twodates.
    static TimeSpan CalculateDateDifference(DateTime date1, DateTime date2) //Need to use timespan(readonly struct)
    {
        return date2 - date1;
    }

    //Nothing much just access the object and then use.D , .Months .Year properties to specifically acces the data. 
    static void DisplayDateDetails(DateTime date)
    {
        Console.WriteLine("\nGiven Date: " + date.ToString("MM/dd/yyyy"));
        Console.WriteLine("   Day: " + date.Day);
        Console.WriteLine("   Month: " + date.Month);
        Console.WriteLine("   Year: " + date.Year);
    }

    // method to add days to date.
    static DateTime AddDaysToDate(DateTime date, int days)
    {
        return date.AddDays(days);
    }

    //__________________________________________________________________________________________________________________________________
    //PART 4
    
    static int Calculate(int a, int b, out int mul, out int sub, out float div)
    {
        mul = a * b;
        sub = a - b;
        div = a / b;
        return a + b;
    }

    //__________________________________________________________________________________________________________________________________
    //Main Function.
    static void Main(string[] args)
    {
        Console.WriteLine("Enter the string you want to check the questions on : ");
        string inputString = Console.ReadLine();
        Console.WriteLine("Give the Charachter for which you want to find the index and occurence of:");
        char character = Convert.ToChar(Console.ReadLine());

        //Calling the above functions according to need.

        Console.WriteLine("Length of the string: " + GetStringLength(inputString));
        Console.WriteLine("Index of character '{0}': " + GetCharacterIndex(inputString, character), character);
        Console.WriteLine("Reverse of the string: " + ReverseString(inputString));
        Console.WriteLine("String with 'Hai' appended at the beginning: " + AppendHai(inputString));
        Console.WriteLine("Last character of the string: " + GetLastCharacter(inputString));
        Console.WriteLine("String with 'a' replaced by '_': " + ReplaceCharacter(inputString, 'a', '_'));
        Console.WriteLine("Occurrence of character '{0}': " + CountCharacterOccurrence(inputString, character), character);
        Console.ReadLine();

        //Now for string builder.
        //Create a new Stringbuilder object.
  
        StringBuilder sb = new StringBuilder(inputString);
        //Here due to the parameters ,Method Overloading will occur and the methods which uses StringBuilder will be automatically called.
        Console.WriteLine("Length of the string: " + GetStringLength(sb));
        Console.WriteLine("Index of character '{0}': " + GetCharacterIndex(sb, character), character);
        Console.WriteLine("Reverse of the string: " + ReverseString(sb));
        Console.WriteLine("String with 'Hai' appended at the beginning: " + AppendHai(sb));
        Console.WriteLine("Last character of the string: " + GetLastCharacter(sb));
        Console.WriteLine("String with 'a' replaced by '_': " + ReplaceCharacter(sb, 'a', '_'));
        Console.WriteLine("Occurrence of character '{0}': " + CountCharacterOccurrence(sb, character), character);
        Console.ReadLine();

        // Print the current date and time in different formats
        PrintCurrentDateTime();

        // Find the difference between two dates
        //Chnage the dates herer.s
        DateTime date1 = new DateTime(2023, 1, 1);
        DateTime date2 = new DateTime(2023, 12, 31);
        TimeSpan difference = CalculateDateDifference(date1, date2);
        Console.WriteLine("\nDifference between two dates: " + difference.TotalDays + " days");

        // Display Day, Month, Year of a given Date
        DateTime givenDate = new DateTime(2023, 7, 6);
        DisplayDateDetails(givenDate);

        // Add 10 days to a given Date
        DateTime initialDate = new DateTime(2023, 7, 6);
        DateTime modifiedDate = AddDaysToDate(initialDate, 10);
        Console.WriteLine("\nModified Date (after adding 10 days): " + modifiedDate.ToString("MM/dd/yyyy"));
        int mul, sub;
        float div;
        Console.WriteLine(Calculate(12, 13,out mul,out sub ,out div));
        Console.WriteLine($"The Multiplcation value is{mul} \nThe Subtraction value is{sub}\nThe division value is{div} ");

    }
   
}









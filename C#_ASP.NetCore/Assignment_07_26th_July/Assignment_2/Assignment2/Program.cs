using Assignment2;

class Program
{
    // Method to get sports name corresponding to the input character
    static string GetSportsName(char input)
    {
        switch (input)
        {
            case 'c':
                return "Cricket";
            case 'f':
                return "Football";
            case 'h':
                return "Hockey";
            case 't':
                return "Tennis";
            case 'b':
                return "Badminton";
            default:
                //Specifying the message which we want to convey ().
                throw new InvalidUserInputException("Invalid input! Please enter a valid character (c, f, h, t, or b).");
        }

    }
    //SVM driver function
    static void Main(string[] args)
    {
        Console.WriteLine("Enter a character (c, f, h, t, or b) to get the corresponding sports name:");
        char userInput = Console.ReadKey().KeyChar;


        //Try Catch block for exception handling.
        try
        {
            string sportsName = GetSportsName(userInput);
            Console.WriteLine($"\nSports Name: {sportsName}");
        }
        catch (InvalidUserInputException ex)
        {
            Console.WriteLine($"\nError: {ex.Message}");
        }
    }
}

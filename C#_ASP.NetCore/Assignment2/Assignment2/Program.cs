/*
 Assignment No : 2 (A set of tasks)
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1.Print first 20 numbers using for loop
2.Print odd numbers less than 50 using while loop
3.Large among 3 numbers
4.Reverse of a number
5.Sum of the digits of a number
6.Sum of the squares of the digits of a number
7.Check prime number
8.Print all prime numbers below 100
9.Fibonacci series
10.Check palindrome 
11.Tax calculation program, input the amount and display the tax
12.Input a character from console and display the sports name corresponding to it
13.Write a program to print the below pattern:
                                                *
                                                **
                                                ***
                                                ****
                                                *****
*/

//I'm Planning to proceed in a menu like interface in the console using the switch and goto(flagging) methods.


public class NumberOperations
{

    // 1. Print first 20 numbers using for loop
    public static void PrintFirst20Numbers()
    {
        for (int i = 1; i <= 20; i++)
        {
            Console.Write(i + " ");
        }
        Console.WriteLine();
    }

    // 2. Print odd numbers less than 50 using while loop
    public static void PrintOddNumbersLessThan50()
    {
        int number = 1;
        while (number < 50)
        {
            //We can aslo use for loop with i starting from 1 and the i+2.
            Console.Write(number + " ");
            number += 2;
        }
        Console.WriteLine();

    }

    // 3. Large among of 3 numbers
    // We can also declare 3 variables and then compare 2 of them and then compare it with the third..Same logic is used here using Math.Max.
    public static int GetLargestOfThreeNumbers(int num1, int num2, int num3)
    {
        //The method is called two times(compares 2 at a time).
        return Math.Max(Math.Max(num1, num2), num3);
    }

    // 4. Reverse of a number
    public static int ReverseNumber(int number)
    {
        int reversedNumber = 0; //we need this to store the reversed number.
        while (number > 0) //when the given number is greater than zero.
        {
            int digit = number % 10; //To take out the remainder using modulus.
            reversedNumber = reversedNumber * 10 + digit; //adding the number to the variable and setting *10 to shift the place for the next time a number comes.
            number /= 10; //chnaging the number ie..128 becomes 12(the 8 would be taken out by %) and then in the next iteration occurs in 12.
        }
        return reversedNumber;
    }

    // 5. Sum of the digits of a number.
    public static int SumOfDigits(int number)
    {
        int sum = 0; //variable to save the value.
        while (number > 0)
        {
            int digit = number % 10;// % to take out each digits.
            sum += digit; //Updating the sum ie return value.
            number /= 10; //updating the value for us to work on.
        }
        return sum;
    }

    // 6. Sum of the squares of the digits of a number
    public static int SumOfSquaresOfDigits(int number)
    {
        int sum = 0;
        while (number > 0)
        {
            //Almost same logic as sum of digits but,incase of the above function it is >> sum = sum+ digit ...we should use sum = sum + (digit * digit) in case of square.
            int digit = number % 10;
            sum += digit * digit;
            number /= 10;
        }
        return sum;
    }

    // 7. Check prime number
    public static bool IsPrime(int number)
    {
        //Here we will return a bool value.
        if (number < 2)
            return false; //As there are no prime numbers less than 2.

        for (int i = 2; i <= Math.Sqrt(number); i++)
        {
            //Normally we would do (i=2; i<number; i++) or (i=2; i<number/2 ; i++).
            //Instead of checking till number or number/2, we can check till square root of number because a larger factor of number must be a multiple of a smaller factor that has been already checked.
            if (number % i == 0)
                return false;
        }
        return true;
    }

    // 8. Print all prime numbers below 100
    public static void PrintPrimesBelow100()
    {
        for (int i = 2; i < 100; i++)
        {
            if (IsPrime(i)) // We can use the above made function and resuse it here😆
                Console.Write(i + " ");
        }
        Console.WriteLine();
    }

    // 9. Fibonacci series
    public static void FibonacciSeries(int count)
    {
        int num1 = 0, num2 = 1, next;
        Console.Write(num1 + " " + num2 + " ");

        for (int i = 2; i < count; i++)
        {
            next = num1 + num2;
            Console.Write(next + " ");
            num1 = num2;
            num2 = next;
        }
        Console.WriteLine();
    }

    // 10. Check palindrome
    //Normally in case of number we can use %10 and some logic to find the palindrome,in case of string we can use CharAt() and a for loop in i-- to access from behind and then compare.
    //but as there is a method to check if a number is palindrome or not we can use IsPalindrome().
    public static bool IsPalindrome(int number)
    {
        //Console.WriteLine("Do you want to find the palindrome of a string or number ?");
        return number == ReverseNumber(number);
    }

    public static bool IsPalindrome(string str)
    {
        return str.SequenceEqual(str.Reverse());
    }
    public static void DisplayTheTax(float amount)
    {
        // Calculate the tax amount based on the given tax rates
        float tax = 0;
        float taxtopay = 0;

        if (amount < 10000)
        {
            tax = 5;
            taxtopay = amount*5/100;
        }
        else if (amount >= 10000 && amount < 15000)
        {
            tax = 7.5f;
            taxtopay = amount * 5 / 100;
        }
        else if (amount >= 15000 && amount < 20000)
        {
            tax = 10;
            taxtopay = amount * 5 / 100;
        }
        else if (amount >= 20000 && amount < 25000)
        {
            tax = 12.5f;
            taxtopay = amount * 5 / 100;
        }
        else if (amount >= 25000)
        {
            tax = 15;
            taxtopay = amount * 5 / 100;
        }
        // Display the calculated tax amount
        Console.WriteLine("Your Tax Bracket is " + tax+"%");
        Console.WriteLine("Tax amount:" + taxtopay);
    }

    public static void SportsChar(string ch)
    {
    flag1:
        switch (ch)
        {
            case "c":
                Console.WriteLine("It is Cricket");
                break;

            case "f":
                Console.WriteLine("It is Football");
                break;
            case "h":
                Console.WriteLine("It is Hockey");
                break;
            case "t":
                Console.WriteLine("It is Tennis");
                break;
            case "b":
                Console.WriteLine("It is Badminton");
                break;

            default:
                Console.WriteLine("Invalid Input");
                Console.WriteLine("Press Any Key to try again");
                Console.ReadKey();
                goto flag1; //Goto function to run again

        }
    }

    public static void PatternPrint(int numLayers , string design)
    {
            // Print the pattern
            for (int i = 1; i <= numLayers; i++)
            {
                for (int j = 1; j <= i; j++)
                {
                    Console.Write(design);
                }
                Console.WriteLine();
            }

        }

    //We will need a method for a menu section
    public static void PrintMenu()
    {
        Console.WriteLine("    ___              _                                  __     ___ \r\n   /   |  __________(_)___ _____  ____ ___  ___  ____  / /_   |__ \\\r\n  / /| | / ___/ ___/ / __ `/ __ \\/ __ `__ \\/ _ \\/ __ \\/ __/   __/ /\r\n / ___ |(__  |__  ) / /_/ / / / / / / / / /  __/ / / / /_    / __/ \r\n/_/  |_/____/____/_/\\__, /_/ /_/_/ /_/ /_/\\___/_/ /_/\\__/   /____/ \r\n                   /____/                                          ");
        Console.WriteLine("____________________________________________________________________________");
        Console.WriteLine("____________________________________________________________________________");
        Console.WriteLine(
            "1.Print first 20 numbers using for loop\r\n" +
            "2.Print odd numbers less than 50 using while loop\r\n" +
            "3.Large among 3 numbers\r\n" +
            "4.Reverse of a number\r\n" +
            "5.Sum of the digits of a number\r\n" +
            "6.Sum of the squares of the digits of a number\r\n" +
            "7.Check prime number\r\n" +
            "8.Print all prime numbers below 100\r\n" +
            "9.Fibonacci series\r\n" +
            "10.Check palindrome \r\n" +
            "11.Tax calculation program\r\n" +
            "12.Sports Name\r\n" +
            "13.Pattern Printing\r\n");
        Console.WriteLine("____________________________________________________________________________\n");
        Console.WriteLine("Choose the program you want to run or 0 for exiting: ");
    }

    //Also a method for to act as the driver
    public static void ExecuteOperation(int choice)
    {
        int number;
        
        switch (choice)
        {
            case 1:
                Console.Clear();
                PrintFirst20Numbers();
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 2:
                Console.Clear();
                PrintOddNumbersLessThan50();
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 3:
                Console.Clear();
                Console.WriteLine("Enter the First number:");
                int num1 = Convert.ToInt32(Console.ReadLine());

                Console.WriteLine("Enter the Second number:");
                int num2 = Convert.ToInt32(Console.ReadLine());

                Console.WriteLine("Enter the Third number:");
                int num3 = Convert.ToInt32(Console.ReadLine());

                int largest = GetLargestOfThreeNumbers(num1, num2, num3);
                Console.WriteLine("Largest number: " + largest);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 4:
                Console.Clear();
                Console.WriteLine("Enter a number:");
                number = Convert.ToInt32(Console.ReadLine());
                int reversed = ReverseNumber(number);
                Console.WriteLine("Reversed number: " + reversed);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 5:
                Console.Clear();
                Console.WriteLine("Enter a number:");
                number = Convert.ToInt32(Console.ReadLine());
                int sumOfDigits = SumOfDigits(number);
                Console.WriteLine("Sum of digits: " + sumOfDigits);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 6:
                Console.Clear();
                Console.WriteLine("Enter a number:");
                number = Convert.ToInt32(Console.ReadLine());
                int sumOfSquares = SumOfSquaresOfDigits(number);
                Console.WriteLine("Sum of squares of digits: " + sumOfSquares);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 7:
                Console.Clear();
                Console.WriteLine("Enter a number:");
                number = Convert.ToInt32(Console.ReadLine());
                bool isPrime = IsPrime(number);
                Console.WriteLine(number + " is prime: " + isPrime);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 8:
                Console.Clear();
                PrintPrimesBelow100();
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 9:
                Console.Clear();
                Console.WriteLine("Enter the count for Fibonacci series:");
                int count = Convert.ToInt32(Console.ReadLine());
                FibonacciSeries(count);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 10:
                Console.Clear();
                Console.WriteLine("Enter a number:");
                number = Convert.ToInt32(Console.ReadLine());
                bool isPalindrome = IsPalindrome(number);
                Console.WriteLine(number + " is a palindrome: " + isPalindrome);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 11:
                Console.Clear();
                Console.WriteLine("Enter an amount:");
                float amount = Convert.ToInt32(Console.ReadLine());
                DisplayTheTax(amount);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;


            case 12:
                Console.Clear();
                Console.WriteLine("Enter a charachter: c,f,h,t,b:");
                string ch = Console.ReadLine();
                SportsChar(ch);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break; 
            case 13:
                Console.Clear();
                // Prompt the user to enter the number of layers
                Console.Write("Enter the number of layers: ");
                int numLayers = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter the design you want :");
                string design = Console.ReadLine();
                PatternPrint(numLayers, design);
                Console.WriteLine("\nEnter any key to go back to Menu");
                Console.ReadKey();
                Console.Clear();
                break;

            case 0:
                Environment.Exit(0);
                break;
            default:
                Console.WriteLine("\n*** Invalid choice ***");
                Console.WriteLine("\nEnter any key to go Try Again");
                Console.ReadKey();
                Console.Clear();
                break;
        }
    }
}
public class Program
{
    //Main Method to manage the overall running of the programme.
    public static void Main()
    {
        while (true)
        {
            NumberOperations.PrintMenu();
            Console.WriteLine("Enter your choice => ");
            int choice = Convert.ToInt32(Console.ReadLine());
            NumberOperations.ExecuteOperation(choice);
            Console.WriteLine();
        }
    }
}






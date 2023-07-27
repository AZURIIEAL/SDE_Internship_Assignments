
using System.Text.RegularExpressions;

public static class StringExtensions
{
    //The this keyword in front of the object type in the WordCount method marks the WordCount method as an extension method. 
    public static int WordCount(this string input, string word)
    {
        if (string.IsNullOrWhiteSpace(input) || string.IsNullOrWhiteSpace(word))
        {
            return 0;
        }

        // Use regular expression to find word boundaries and count occurrences
        string pattern = @"\b" + Regex.Escape(word) + @"\b";
        return Regex.Matches(input, pattern, RegexOptions.IgnoreCase).Count;
        //we use the constructed pattern to perform a case-insensitive search in the input string using Regex.Matches()  and then count it at last using the .count .
    }
}

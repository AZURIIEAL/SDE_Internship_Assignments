
// Usage
class Program
{
    static void Main()
    {
        string text = "Abin went to office today,abin came back fast";
        string wordToFind = "Abin";
        //Calling the .method
        int wordCount = text.WordCount(wordToFind);
        Console.WriteLine($"Occurrences of '{wordToFind}': {wordCount}");
    }
}





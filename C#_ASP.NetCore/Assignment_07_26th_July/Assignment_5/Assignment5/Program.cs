class Program
{
    static void Main()
    {
        int[] originalArray = { 1, 2, 3, 4, 5 };//Array  to be iterated on

        List<int> multipliedList = new List<int>(); //New list

        foreach (int num in originalArray)
        {
            int multipliedNum = num * 2;
            multipliedList.Add(multipliedNum);
        }

        Console.WriteLine( originalArray);
        Console.WriteLine( multipliedList);
    }
}

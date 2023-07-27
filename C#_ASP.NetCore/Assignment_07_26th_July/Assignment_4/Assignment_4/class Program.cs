using Assignment_4;

class Program
{
    static void Main()
    {
        //In place of T we can use in Int , double or string.
        MyGenericComparer<int> intComparer = new MyGenericComparer<int>();//Object decleration.
        int largestInt = intComparer.Compare(10, 5);//Function .
        Console.WriteLine("The largest integer is: " + largestInt);

        MyGenericComparer<double> doubleComparer = new MyGenericComparer<double>(); //Object decleration.
        double largestDouble = doubleComparer.Compare(3.14, 2.71);//Function .
        Console.WriteLine("The largest double is: " + largestDouble);

        MyGenericComparer<string> stringComparer = new MyGenericComparer<string>(); //Object decleration.
        string largestString = stringComparer.Compare("apple", "orange");//Function .
        Console.WriteLine("The largest string is: " + largestString);
    }
}
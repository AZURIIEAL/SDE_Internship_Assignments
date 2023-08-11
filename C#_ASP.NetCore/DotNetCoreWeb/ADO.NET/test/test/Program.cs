

delegate void calculator(int x, int y);

class Program
{
    public  void Add(int a , int b)
    {
        Console.WriteLine(a + b);
    }
    public static void Mul(int a , int b)
    {
        Console.WriteLine(a * b);
    }

    static void Main(string[] args)
    {
        Program p = new Program();
        calculator calc = new calculator(p.Add);
        calc.Invoke(67,78);
        calc(1,2);
    }
}
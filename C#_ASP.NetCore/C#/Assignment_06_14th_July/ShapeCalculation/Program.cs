//Create an abstract class Shape with name shape and a method called 'NoOfSides' on int

public abstract class Shape
{
    //Declare abstract properties
    public int NoOfSides { get; set; }

    //Declare the ctor
    public Shape(int noOfSides)
    {
        NoOfSides = noOfSides;
    }
    //Declare the void function/method
    public void DisplayNoOfSides()
    {
        Console.WriteLine("\nNumber of Sides: " + NoOfSides);
    }
    //Declare the Abstract method.
    public abstract double CalculateArea();

}
//Create the next class called Triangle and make it inherit 
public class Triangle : Shape
{
    //declaring the props.
    public int SideLength1 { get; set; }
    public int SideLength2 { get; set; }
    public int SideLength3 { get; set;}
    //Setting up the ctor for the inherited class
    public Triangle(int noOfSides, int sideLength1, int sideLength2, int sideLength3) : base(noOfSides)
    {
        SideLength1 = sideLength1;
        SideLength2 = sideLength2;
        SideLength3 = sideLength3;
    }

    public override double CalculateArea() //Overriding Calculate area method.
    {
        // Using Heron's formula to calculate the area of a triangle
        double semiPerimeter = (SideLength1 + SideLength2 + SideLength3) / 2;
        double area = Math.Sqrt(semiPerimeter * (semiPerimeter - SideLength1) * (semiPerimeter - SideLength2) * (semiPerimeter - SideLength3));
        return Math.Round(area, 2);
    }
}
public class Square : Shape //inheriting the abstract class.
{
    //Setting the props,we only need one cause its a square.
    public int Length { get; set; }

    //declaring the ctor
    public Square(int noOfSides, int length): base(noOfSides)
    {
        Length = length;
    }

    //abstract method by overriding
    public override double CalculateArea()
    {
        return Length * Length;
    }
}

public class Rectangle : Shape //inheriting the abstract class.
{
    //declaring the props
    public int Length { get; set; }
    public int Breadth { get; set; }


    //Declaring the ctor
    public Rectangle(int noOfSides, int length, int breadth): base(noOfSides)
    {
        Length = length;
        Breadth = breadth;
    }

    //overrride
    public override double CalculateArea()
    {
        return Length * Breadth;
    }
}

public class Program //Driver class
{
    public static void Main(string[] args) //svm
    {
        Shape triangle = new Triangle(3, 5, 6, 7);
        triangle.DisplayNoOfSides();
        Console.WriteLine("The Area Of Triangle is: " + triangle.CalculateArea());

        Shape square = new Square(4, 5);
        square.DisplayNoOfSides();
        Console.WriteLine("The Area Of Square is: " + square.CalculateArea());

        Shape rectangle = new Rectangle(4, 6, 8);
        rectangle.DisplayNoOfSides();
        Console.WriteLine("The Area Of rectangle is: " + rectangle.CalculateArea());
    }
}



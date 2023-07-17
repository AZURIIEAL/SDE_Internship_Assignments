//creating an abstract class.
public abstract class Shape
{
    //decalare the properties
    public string Name { get; set; }
    public string Type { get; set; }
    public int NoOfSides { get; set; }

    //Create a ctor
    public Shape(int noOfSides)
    {
        NoOfSides = noOfSides;
    }

    //A function to display the number of sides.
    public void DisplayNoOfSides()
    {
        Console.WriteLine("Number of Sides: " + NoOfSides);
    }

    //Abstract method 
    public abstract double CalculateArea();
}

public class Triangle : Shape //inheriting the abstract class.
{
    public int SideLength1 { get; set; }
    public int SideLength2 { get; set; }
    public int SideLength3 { get; set; }

    public Triangle(int noOfSides, int sideLength1, int sideLength2, int sideLength3): base(noOfSides)
    {
        SideLength1 = sideLength1;
        SideLength2 = sideLength2;
        SideLength3 = sideLength3;
    }

    public override double CalculateArea()
    {
        // Using Heron's formula to calculate the area of a triangle
        double semiPerimeter = (SideLength1 + SideLength2 + SideLength3) / 2.0;
        double area = Math.Sqrt(semiPerimeter * (semiPerimeter - SideLength1) * (semiPerimeter - SideLength2) * (semiPerimeter - SideLength3));
        return area;
    }
}

public class Square : Shape //inheriting the abstract class.
{
    public int Length { get; set; }

    public Square(int noOfSides, int length)
        : base(noOfSides)
    {
        Length = length;
    }

    public override double CalculateArea()
    {
        return Length * Length;
    }
}

public class Rectangle : Shape //inheriting the abstract class.
{
    public int Length { get; set; }
    public int Breadth { get; set; }

    public Rectangle(int noOfSides, int length, int breadth)
        : base(noOfSides)
    {
        Length = length;
        Breadth = breadth;
    }

    public override double CalculateArea()
    {
        return Length * Breadth;
    }
}

public class Program //Driver class
{
    public static void Main(string[] args) //svm
    {
        Triangle triangle = new Triangle(3, 5, 6, 7);
        triangle.Name = "Triangle";
        triangle.Type = "Polygon";
        triangle.DisplayNoOfSides();
        Console.WriteLine("Area: " + triangle.CalculateArea());

        Square square = new Square(4, 5);
        square.Name = "Square";
        square.Type = "Polygon";
        square.DisplayNoOfSides();
        Console.WriteLine("Area: " + square.CalculateArea());

        Rectangle rectangle = new Rectangle(4, 6, 8);
        rectangle.Name = "Rectangle";
        rectangle.Type = "Polygon";
        rectangle.DisplayNoOfSides();
        Console.WriteLine("Area: " + rectangle.CalculateArea());
    }
}

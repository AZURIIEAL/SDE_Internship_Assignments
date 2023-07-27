
namespace Assignment_4
{
    //We can compare int,string,or something else so we wil use an interface called IComparable
    public class MyGenericComparer<T> where T : IComparable<T>
    {
        public T Compare(T val1, T val2)
        {
            //If val1 is greater than val2, CompareTo will return a positive integer value. If val1 is less than val2, CompareTo will return a negative integer value. If val1 is equal to val2, CompareTo will return zero.
            //CompareTo is the part of the IComaprable interface that allows us to compare between differnt objects of the same type.
            return val1.CompareTo(val2) >= 0 ? val1 : val2;
        }
    }
   
}

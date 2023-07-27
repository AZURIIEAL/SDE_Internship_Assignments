
namespace Assignment2
{
    // Custom exception class for invalid user input.
    public class InvalidUserInputException : Exception //Inheriting from exception class.
    {
        //Now setting up the Method.
        public InvalidUserInputException(string message) : base(message) //We are addding a base clause because we need to revert a message back.
        {
        }
    }

}

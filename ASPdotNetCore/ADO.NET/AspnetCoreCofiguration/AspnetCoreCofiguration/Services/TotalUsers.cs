using Newtonsoft.Json.Linq;
using System;

namespace Configuation.Services
{
    public class TotalUsers
    {
        /*This method Tusers() returns the total number of users registered in the application which is just a random number between 100 and max value of Int.*/
        public long TUsers()
        {
            Random rnd = new Random();
            return rnd.Next(100, int.MaxValue);
        }
    }
}
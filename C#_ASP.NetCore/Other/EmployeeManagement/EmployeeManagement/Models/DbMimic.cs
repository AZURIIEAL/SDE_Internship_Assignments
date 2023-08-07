namespace EmployeeManagement.Models
{
    //Should declare this class as static as we are trying to imitate a database.
    public static class DbMimic
    {
        //Declaring a list to hold the entries that will be stored here in runtime.
         private static List<Employee> allemployees = new List<Employee>();

        //Now declaring a method to create entries-- the CREATE part of CRUD
        public static void Create(Employee employee)
        {
            allemployees.Add(employee); 
        }
    }
}

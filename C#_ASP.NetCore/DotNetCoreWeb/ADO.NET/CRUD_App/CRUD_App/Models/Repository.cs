namespace CRUD_App.Models
{
    //We willbe needing a static class as we will mimic the features of a database here,and we want the data to be constant through out.
    public static class Repository
    {
        //In the static class there is a private field called allEmployees which is of type List .This field will contain all emlpoyee which are submitted from the form.
        private static List<Employee> allEmpoyees = new List<Employee>();
        public static IEnumerable<Employee> AllEmpoyees //a property to get the allEmployes list.
        {
            get { return allEmpoyees; }
        }
        public static void Create(Employee employee) //a method to add employees.
        {
            allEmpoyees.Add(employee);
        }
    }
}

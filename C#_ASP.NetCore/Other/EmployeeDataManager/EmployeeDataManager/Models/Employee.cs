namespace EmployeeDataManager.Models
{ //This employee class with properties would be refernced my DbMimic class
    public class Employee
    {
        public int Id { get; private set; } //ReadOnly property
        public string Name { get; set; } = string.Empty;
        public double Salary { get; set; }
        public string Department { get; set; } = string.Empty;
        public Char Gender { get; set; }
        public Char EmployeeType { get; set; } 


        public void SetId()
        {
            Id = DbMimic.GetNewEmployeeId();
        }
     
    }
}

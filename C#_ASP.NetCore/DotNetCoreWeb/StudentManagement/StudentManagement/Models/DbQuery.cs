using Microsoft.Data.SqlClient;

namespace StudentManagement.Models
{
    public class DbQuery
    {
        public void AddStudent(Student student)
        {
            string connectionString = "server=localhost, 1401;database=testdatabase;user id=sa;password=Pass@word;"+"TrustServerCertificate=true";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string query = "AddStudent";
            SqlCommand cmd = new SqlCommand(query, con);
            //As we are using a stored procedutre we need to specify that too.
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter paramFirstName = new SqlParameter();
            paramFirstName.Value = student.FirstName;
            paramFirstName.ParameterName = student.FirstName;






        }
    }
}

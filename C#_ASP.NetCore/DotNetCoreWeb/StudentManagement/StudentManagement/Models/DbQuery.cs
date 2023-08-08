using Microsoft.Data.SqlClient;

namespace StudentManagement.Models
{
    public class DbQuery
    {
        public void AddStudent(Student student)
        {

            string connectionString = "Server=localhost, 1401;Database=StudentData;User Id=sa;Password=Pass@word;TrustServerCertificate=true";

            using SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string query = "AddStudent";
            using SqlCommand cmd = new SqlCommand(query, con);
            //As we are using a stored procedutre we need to specify that too.
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter paramFirstName = new SqlParameter();
            paramFirstName.ParameterName = "FirstName";
            paramFirstName.Value = student.FirstName;
            paramFirstName.SqlDbType = System.Data.SqlDbType.VarChar;
            paramFirstName.Size = 255;
            cmd.Parameters.Add(paramFirstName);

            SqlParameter paramLasttName = new SqlParameter();
            paramLasttName.ParameterName = "LastName";
            paramLasttName.Value = student.LastName;
            paramLasttName.SqlDbType = System.Data.SqlDbType.VarChar;
            paramLasttName.Size = 255;
            cmd.Parameters.Add(paramLasttName);

            SqlParameter paramAddress = new SqlParameter();
            paramAddress.ParameterName = "Address";
            paramAddress.Value = student.Address;
            paramAddress.SqlDbType = System.Data.SqlDbType.VarChar;
            cmd.Parameters.Add(paramAddress);

            SqlParameter paramEmail = new SqlParameter();
            paramEmail.ParameterName = "Email";
            paramEmail.Value = student.Email;
            paramEmail.SqlDbType = System.Data.SqlDbType.VarChar;
            cmd.Parameters.Add(paramEmail);
            cmd.ExecuteNonQuery();
        }
    }
}

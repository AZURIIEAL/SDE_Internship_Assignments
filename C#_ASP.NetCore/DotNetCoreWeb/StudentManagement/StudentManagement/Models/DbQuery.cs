using Microsoft.Data.SqlClient;

namespace StudentManagement.Models
{
    public class DbQuery
    {
        string connectionString = "Server=localhost, 1401;Database=StudentData;User Id=sa;Password=Pass@word;TrustServerCertificate=true";
        public void AddStudent(Student student)
        {

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

        public Student FindStudentById(int id)
        {
            using SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string query = "GetStudentById";
            using SqlCommand cmd = new SqlCommand(query, con);
            //As we are using a stored procedutre we need to specify that too.
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter paramId = new SqlParameter();
            paramId.ParameterName = "id";
            paramId.Value = id;
            paramId.SqlDbType = System.Data.SqlDbType.Int;
            cmd.Parameters.Add(paramId);
            using SqlDataReader fromDbReturnData = cmd.ExecuteReader();

            Student returnObj = new Student();
            if (fromDbReturnData.Read())
            {
                returnObj.FirstName = fromDbReturnData["FirstName"].ToString();
                returnObj.LastName = fromDbReturnData["LastName"].ToString();
                returnObj.Address = fromDbReturnData["Address"].ToString();
                returnObj.Email = fromDbReturnData["Email"].ToString();
            }

            return returnObj;
        }

        public void UpdateStudent(int id ,Student student)
        {
            using SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string query = "UpdateStudent";
            using SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@FirstName", student.FirstName);
            cmd.Parameters.AddWithValue("@LastName", student.LastName);
            cmd.Parameters.AddWithValue("@Address", student.Address);
            cmd.Parameters.AddWithValue("@Email", student.Email);

            cmd.ExecuteNonQuery();
        }

        public void DeleteStudent(int id)
        {
            using SqlConnection con = new SqlConnection(connectionString);
            con.Open();
 
            string query = "DeleteStudent";
            using SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();


        }
    }
}

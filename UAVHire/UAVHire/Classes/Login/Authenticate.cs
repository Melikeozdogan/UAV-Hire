using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using UAVHire.Classes.Database;
using System.Security.Cryptography;
using System.Text;


namespace UAVHire.Classes.Login
{
    public class Authenticate
    {

        DbConnect DbConnect = new DbConnect();

        public bool AuthenticateUser(string username, string password)
        {
            try
            {
                username = username.Trim();
                password = password.Trim();

                Models.Login user = new Models.Login();
                var conn = DbConnect.Connect();
                conn.Open();
                var command = new SqlCommand("sp_GetLoginControl", conn);
                command.Parameters.AddWithValue("@username", username);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(command);
                DataSet data = new DataSet();
                sda.Fill(data);

                if (data.Tables.Count > 0 && data.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in data.Tables[0].Rows)
                    {
                        user.Login_Id = Convert.ToInt32(row["Login_Id"]);
                        user.Username = row["Username"].ToString();
                        user.Name_Surname = row["Name_Surname"].ToString();
                        user.Email = row["Email"].ToString();
                        user.Password = row["Password"].ToString();
                        user.Role_Id = Convert.ToInt32(row["Role_Id"]);
                        user.Active = Convert.ToBoolean(row["Active"]);
                        user.Salt = row["Salt"].ToString();


                    }

                    conn.Close();
                    return VerifyPassword(password , user.Salt , user.Password);


                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {

                return false;
            }






        }




        public bool Register(string name, string email, string username, string password)
        {
            try
            {
                name = name.Trim();
                email = email.Trim();
                username = username.Trim();
                password = password.Trim();
                string salt = GenerateSalt();

                password = HashPassword(password,salt);

                Models.Login user = new Models.Login();
                var conn = DbConnect.Connect();
                conn.Open();
                var command = new SqlCommand("sp_AddUsers", conn);
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);
                command.Parameters.AddWithValue("@salt", salt);
                command.CommandType = CommandType.StoredProcedure;
                int rowsAffected = command.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch
            {
                return false;
            }
        }



        public bool VerifyPassword(string password , string Salt , string dbpasswprd)
        {
            // Kullanıcının girdiği şifreyi ve tuzlama değerini kullanarak hash'le
            using (var sha256 = SHA256.Create())
            {
                var inputBytes = Encoding.UTF8.GetBytes(password + Salt);
                var hashedBytes = sha256.ComputeHash(inputBytes);
                var hashedPassword = Convert.ToBase64String(hashedBytes);
                // Hesaplanan hash değeri, kaydedilmiş hash değeriyle karşılaştırılır
                return hashedPassword == dbpasswprd;
            }
        }

        // Şifreyi ve tuzlama değerini kullanarak hashleme işlemi
        public  string HashPassword(string password, string salt)
        {
            using (var sha256 = SHA256.Create())
            {
                var inputBytes = Encoding.UTF8.GetBytes(password + salt);
                var hashedBytes = sha256.ComputeHash(inputBytes);
                // Hash değeri Base64 formatına dönüştürülerek saklanır
                return Convert.ToBase64String(hashedBytes);
            }
        }

        // Her kullanıcı için benzersiz bir tuzlama değeri oluşturma işlemi
        public static string GenerateSalt()
        {
            byte[] randomBytes = new byte[32];
            // Kriptografik olarak güvenli rastgele veri oluştur
            using (var rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(randomBytes);
            }
            // Oluşturulan rastgele veri Base64 formatına dönüştürülerek saklanır
            return Convert.ToBase64String(randomBytes);
        }



    }
}
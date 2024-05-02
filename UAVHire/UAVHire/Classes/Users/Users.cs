using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using UAVHire.Classes.Database;

namespace UAVHire.Classes.Users
{
    public class Users
    {

        DbConnect dbConnect = new DbConnect();

        public Models.Login GetLoginById(int id)
        {
            try
            {
                var con = dbConnect.Connect();
                con.Open();
                var command1 = new SqlCommand("sp_GetLoginById", con);
                command1.Parameters.AddWithValue("@Login_Id", id);
                command1.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter sda = new SqlDataAdapter(command1);
                DataSet loginDataSet = new DataSet();
                sda.Fill(loginDataSet);

               Models.Login login1 = new Models.Login();


                if (loginDataSet.Tables.Count > 0 && loginDataSet.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in loginDataSet.Tables[0].Rows)
                    {

                        login1.Login_Id = Convert.ToInt32(row["Login_Id"]);
                        login1.Name_Surname = row["Name_Surname"].ToString();
                        login1.Username = row["UserName"].ToString();
                        login1.Email = row["Registration_Number"].ToString();
                        login1.Password = row["Password"].ToString();
                        login1.Active = Convert.ToBoolean(row["active"]);
                        login1.Role_Id = Convert.ToInt32(row["Role_Id"]);
                        
                                            }
                }
                con.Close();
                return login1;
            }
            catch {
                return null;
            }

        }

    }
}
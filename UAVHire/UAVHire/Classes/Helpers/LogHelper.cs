using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using UAVHire.Classes.Database;
using UAVHire.Models;


namespace UAVHire.Classes.Helpers
{
    public class LogHelper
    {

        DbConnect dbConnect = new DbConnect();
        public void SaveLog(int UserId, string username, string Application, string ApplicationPage, string Note, string Ip)
        {
            var conn = dbConnect.Connect();
            conn.Open();
            var command = new SqlCommand("sp_SaveLog", conn);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@UserId", UserId);
            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@Application", Application);
            command.Parameters.AddWithValue("@ApplicationPage", ApplicationPage);
            command.Parameters.AddWithValue("@Note", Note);
            command.Parameters.AddWithValue("@Date", DateTime.Now);
            command.Parameters.AddWithValue("@Ip", Ip);

            int rowsAffected = command.ExecuteNonQuery();
            conn.Close();


        }

        public List<HireLog> Logs()
        {
            var list = new List<HireLog>();
            var conn = dbConnect.Connect();
            conn.Open();
            var command = new SqlCommand("sp_GetLog", conn);
            command.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataSet loginDataSet = new DataSet();
            sda.Fill(loginDataSet);



            if (loginDataSet.Tables.Count > 0 && loginDataSet.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow row in loginDataSet.Tables[0].Rows)
                {
                    Models.HireLog login1 = new Models.HireLog();

                    login1.Log_ID = Convert.ToInt32(row["Log_ID"]);
                    login1.UserId = Convert.ToInt32(row["UserId"]);
                    login1.Username = row["Username"].ToString();
                    login1.Application = row["Application"].ToString();
                    login1.ApplicationPage = row["ApplicationPage"].ToString();
                    login1.Note = row["Note"].ToString();
                    login1.Date = DateTime.Parse(row["Date"].ToString());
                    login1.Ip = row["Ip"].ToString();
                    list.Add(login1);
                }
            }

            return list;
        }


    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace UAVHire.Classes.Database
{
    public class DbConnect
    {
        public SqlConnection Connect()
        {
            string ADconnect = ConfigurationManager.ConnectionStrings["Storoge"].ConnectionString;
            var conn = new SqlConnection(ADconnect);
            return conn;
        }
    }
}
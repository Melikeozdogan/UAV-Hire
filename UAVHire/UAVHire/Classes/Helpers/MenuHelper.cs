using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using UAVHire.Classes.Database;
using UAVHire.Classes.Users;
using System.Web.UI.WebControls;

namespace UAVHire.Classes.Helpers
{
    public class MenuHelper
    {
        DbConnect dBConnect = new DbConnect();
        Users.Users users = new Users.Users();
        

        public List<Menu> MenuList(int userid)
        {
            List<Menu> menus = new List<Menu>();
            try
            {

                Models.Login user = users.GetLoginById(userid);
                int role = -1;
                role = user.Role_Id;
                


                var conn = dBConnect.Connect();
                conn.Open();
                var command = new SqlCommand("sp_GetMenu", conn);
                command.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(command);
                DataSet data = new DataSet();
                sda.Fill(data);

                if (data.Tables.Count > 0 && data.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in data.Tables[0].Rows)
                    {
                        Menu menu = new Menu();

                        if (Convert.ToInt32(row["RoleID"]) == role)
                        {

                            menu.Menu_Id = Convert.ToInt32(row["Menu_Id"]);
                            menu.MenuName = row["MenuName"].ToString();
                            menu.MenuController = row["MenuController"].ToString();
                            menu.MenuAction = row["MenuAction"].ToString();
                            menu.RoleID = Convert.ToInt32(row["RoleID"]);
                            menu.Active = Convert.ToBoolean(row["Active"]);
                            menu.Icons = row["Icons"].ToString();
                            menus.Add(menu);
                        }
                    }
                }
                conn.Close();





                return menus;


            }
            catch (Exception ex)
            {
                
                return menus;
            }








        }
        // burası düzenlenecek ve layouta eklenecek
        public bool ModuleAuthority(int userid, int menuid)
        {
            try
            {
                bool aut = false;
                //[sp_Get_UserRole]
                //sp_GetMenuRole

                var conn = dBConnect.Connect();
                conn.Open();
                var command = new SqlCommand("sp_GetMenuRole", conn);
                command.Parameters.AddWithValue("@MenuId", menuid);
                command.CommandType = CommandType.StoredProcedure;

                int menu = 0;

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        menu = Convert.ToInt32(reader["RoleID"]);
                    }
                }


                command = new SqlCommand("sp_Get_UserRole", conn);
                command.Parameters.AddWithValue("@LoginId", userid);
                command.CommandType = CommandType.StoredProcedure;

                int user = 0;

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        user = Convert.ToInt32(reader["Role_Id"]);
                    }
                }

                command = new SqlCommand("sp_ActiveLogin", conn);
                command.Parameters.AddWithValue("@LoginId", userid);
                command.CommandType = CommandType.StoredProcedure;

                int active = 0;

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        active = Convert.ToInt32(reader["Active"]);
                    }
                }



                if (user == menu && active == 1) aut = true;


                return aut;
            }
            catch (Exception ex)
            {
                
                return false;
            }
        }
    }

    public class Menu
    {
        public int Menu_Id { get; set; }
        public string MenuName { get; set; }
        public string MenuController { get; set; }
        public string MenuAction { get; set; }
        public int RoleID { get; set; }
        public bool Active { get; set; }
        public string Icons { get; set; }
    }
}

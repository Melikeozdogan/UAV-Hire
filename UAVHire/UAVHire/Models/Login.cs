using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UAVHire.Models
{
    public class Login
    {
        public int Login_Id { get; set; }
        public string Username { get; set; }
        public string Name_Surname { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int Role_Id { get; set; }
        public bool Active { get; set; }
        public string Salt { get; set; }


    }
}
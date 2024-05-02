using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UAVHire.Models
{
    public class Hire
    {

        public int Hire_Id { get; set; }
        public int UAV_Id { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime FinishDate { get; set; }
        public int Login_Id { get; set; }

      
    }
}
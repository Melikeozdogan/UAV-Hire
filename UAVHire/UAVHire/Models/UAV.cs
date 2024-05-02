using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace UAVHire.Models
{
    public class UAV
    {


        public int UAV_Id { get; set; }
        public string SerialNumber { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public int Weight { get; set; }
        public int Category_Id { get; set; }
        public int Communication_Range { get; set; }
        public int Load_Capacity { get; set; }
        public int StayInTheAir { get; set; }
        public int Height { get; set; }
        public int MaximumTakeoffWeight { get; set; }

    }

    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
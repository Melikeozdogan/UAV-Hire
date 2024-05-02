using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UAVHire.Models
{
    public class HireLog
    {
        public int Log_ID { get; set; }
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Application { get; set; }
        public string ApplicationPage { get; set; }
        public string Note { get; set; }
        public DateTime Date { get; set; }
        public string Ip { get; set; }
    }
}
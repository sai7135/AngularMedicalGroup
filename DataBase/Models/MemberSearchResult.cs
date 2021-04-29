using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class MemberSearchResult
    {
        public string memberID { get; set; }
        public string name { get; set; }
        public string gender { get; set; }
        public string HealthPlanCode { get; set; }
        public DateTime dob { get; set; }
        public int age { get; set; }
        public DateTime? benefitFrom { get; set; }
        public DateTime? benefitTo { get; set; }
    }
}

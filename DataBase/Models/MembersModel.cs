using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class MembersModel
    {
        public string memberId { get; set; }
        public bool autogenmemid { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string middleName { get; set; }
        public string gender { get; set; }
        public string suffixName { get; set; }
        public string BirthDate { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zip { get; set; }
        public string country { get; set; }
        public string hp { get; set; }
        public string hpcode { get; set; }
        public string hpfromdate { get; set; }
        public string hptoDate { get; set; }
        public string pcpid { get; set; }
        public string organizationName { get; set; }
        public string pcpfromdate { get; set; }
        public string pcptodate { get; set; }
        public string description { get; set; }
    }
}

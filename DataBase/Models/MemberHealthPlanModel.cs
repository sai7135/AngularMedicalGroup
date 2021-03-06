using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class MemberHealthPlanModel
    {
        public string c { get; set; }
        public string HPCode { get; set; }
        public string BenefitCode { get; set; }
        public string MaintannceReason { get; set; }
        public DateTime? BenefitFrom { get; set; }
        public DateTime? BenefitTo { get; set; }
        public string EmpGrp { get; set; }
    }
}

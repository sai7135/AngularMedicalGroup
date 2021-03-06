using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class MemberPCPModel
    {
        public string c { get; set; }
        public string pcpid { get; set; }
        public string pcpName { get; set; }
        public string pcpprimorg { get; set; }
        public string maintanancereason { get; set; }
        public DateTime? pcpfromdt { get; set; }
        public DateTime? pcptodt { get; set; }
    }
}

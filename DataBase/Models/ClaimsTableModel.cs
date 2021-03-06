using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class ClaimsTableModel
    {
        public string fileID { get; set; }
        public string clmid { get; set; }
        public string memberid { get; set; }
        public string membername { get; set; }
        public string dob { get; set; }
        public string renderingprovider { get; set; }
        public string claimNo { get; set; }
        public string dcn { get; set; }
        public string billedamount { get; set; }
        public string tradingPartner { get; set; }
        public string uploadDate { get; set; }
    }
}

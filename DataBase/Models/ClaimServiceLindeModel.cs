using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class ClaimServiceLindeModel
    {
        public int ClmSrvid { get; set; }
        public DateTime SrvFrmdt { get; set; }
        public DateTime SrvTodt { get; set; }
        public string Pos { get; set; }
        public string ProcCode { get; set; }
        public string Modfi1 { get; set; }
        public string Modfi2 { get; set; }
        public string Modfi3 { get; set; }
        public string Modfi4 { get; set; }
        public string DiaPoint1 { get; set; }
        public string DiaPoint2 { get; set; }
        public string DiaPoint3 { get; set; }
        public string DiaPoint4 { get; set; }
        public string BilledCharg { get; set; }
        public string Quantity { get; set; }
        public string UnitType { get; set; }
        public bool Emg { get; set; }
        public bool EPSDT { get; set; }
        public bool FamPlan { get; set; }
        public string NDC { get; set; }
    }
}

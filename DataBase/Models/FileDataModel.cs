using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class FileDataModel
    {
        public long Fileid { get; set; }
        public string TP { get; set; }
        public DateTime UploadDate { get; set; }
        public string UploadedBy { get; set; }
        public int ClaimCount { get;set;}
        public int Pending { get; set; }
        public int Postinginproc { get; set; }
        public int Posted { get; set; }
        public int Failed { get; set; }
        public decimal BilledAmount { get; set; }
        public string Format { get; set; }
    }
}

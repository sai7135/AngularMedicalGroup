using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class FileDataSearchModel
    {
        public string FileId { get; set; }
        public string FileError { get; set; }
        public string TP { get; set; }
        public DateTime UploadFrom { get; set; }
        public DateTime UploadTo { get; set; }
        public string Format { get; set; }
        public string UploadedBy { get; set; }
        public string UsageIndicator { get; set; }
        public string FileName { get; set; }
    }
}

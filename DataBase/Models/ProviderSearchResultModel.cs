using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class ProviderSearchResultModel
    {
        public string Pcpid { get; set; }
        public string ProviderNpi { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Taxid { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string ContractType { get; set; }
        public string OrganizationName { get; set; }
        public string ContractFromDate { get; set; }
        public string ContractToDate { get; set; }

    }
}

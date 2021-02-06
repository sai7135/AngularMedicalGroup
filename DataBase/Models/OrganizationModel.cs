using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class OrganizationModel
    {
        public string organizationID { get; set; }
        public string category { get; set; }
        public string organizationName { get; set; }
        public string organizationLongName { get; set; }
        public string accountingSystemName { get; set; }
        public string taxID { get; set; }
        public string organizationNPI { get; set; }
        public string ssn { get; set; }
        public string taxonomyCode { get; set; }
        public string capitationAccount { get; set; }
        public string claimsAccount { get; set; }
        public bool autoGenerateERA { get; set; }
        public AddressModel payToAddress { get; set; }
        public AddressModel billingAddress { get; set; }
    }
}

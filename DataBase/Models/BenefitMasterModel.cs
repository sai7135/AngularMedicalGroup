using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class BenefitMasterModel
    {
        [Display(Name ="healthPlanCode")]
        public string healthPlanCode { get; set; }
        [Display(Name ="employerGroup")]
        public string employerGroup { get; set; }
        [Display(Name ="benefitCode")]
        public string benefitCode { get; set; }
        [Display(Name = "description")]
        public string description { get; set; }
        [Display(Name = "dateRange")]
        public DateRange dateRange { get; set; }
        [Display(Name = "lineOfbusiness")]
        public LineOfBussiness lineOfbusiness { get; set; }
        [Display(Name = "set")]
        public Set set { get; set; }
        [Display(Name = "memberFamilyLimit")]
        public MemberFamilyLimit memberFamilyLimit { get; set; }
        [Display(Name = "note")]
        public Note note { get; set; }
    }
    public class Note
    {
        public string note;
    }
    public class MemberFamilyLimit
    {
        public HMOinit HMO { get; set; }
        public PPOinit PPO { get; set; }
    }
    public class HMOinit
    {
        public string oopMaximumMember { get; set; }
        public string oopMaximumSubscriber { get; set; }
        public string deductableForMember { get; set; }
        public string deductableForSubscriber { get; set; }
    }
    public class PPOinit
    {
        public string inoopMaximumMember { get; set; }
        public string inoopMaximumSubscriber { get; set; }
        public string indeductableForMember { get; set; }
        public string indeductableForSubscriber { get; set; }
        public string outoopMaximumMember { get; set; }
        public string outoopMaximumSubscriber { get; set; }
        public string outoopdeductableMember { get; set; }
        public string outoopdeductableSubscriber { get; set; }
        public string oopMaximumCombinedMember { get; set; }
        public string oopMaximumCombinedSubscriber { get; set; }
        public string deductableCombinedMember { get; set; }
        public string deductableCombinedSubscriber { get; set; }
    }
    public class Set
    {
        public string financialResponsibility { get; set; }
    }
    public class LineOfBussiness
    {
        public string lineOfbusiness { get; set; }
    }
    public class DateRange
    {
        public string effectiveFromDate { get; set; }
        public string toDate { get; set; }
        public string accumuilation { get; set; }
    }
}
                                                           
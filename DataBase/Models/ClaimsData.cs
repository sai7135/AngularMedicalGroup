using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class ClaimsData
    {
        public long claimid { get; set; }
        public long Fileid { get; set; }
        public string PatientLast { get; set; }
        public string PatientFirst { get; set; }
        public string PatientGender { get; set; }
        public DateTime? PatientDob { get; set; }
        public string OtherPatientId { get; set; }
        public string PatientDateOfDeath { get; set; }
        public string SubscriberHealthPlan { get; set; }
        public string SubscriberHealthPlanID { get; set; }
        public string SubscriberLast { get; set; }
        public string SubscriberFirst { get; set; }
        public string SubscriberGender { get; set; }
        public DateTime? SubscriberDOB { get; set; }
        public string MemberID { get; set; }
        public string ExtAuthRef { get; set; }
        public string SubscriberGroupName { get; set; }
        public string SubscriberGroup { get; set; }
        public string Auth { get; set; }
        public string PatRel { get; set; }
        public string BillProvLast { get; set; }
        public string BillProvFirst { get; set; }
        public string BillingProvId { get; set; }
        public string BillingProvAddres1 { get; set; }
        public string BillingProvAddres2 { get; set; }
        public string BillingProvCity { get; set; }
        public string BillingProvStat { get; set; }
        public string BillingProvZip { get; set; }
        public string BillingProviderNpi { get; set; }
        public string BillingProvTaxid { get; set; }
        public string PtoAisOrgInd { get; set; }
        public string PtoALast { get; set; }
        public string PtoAFirst { get; set; }
        public string PtoAAddress1 { get; set; }
        public string PtoAAddress2 { get; set; }
        public string PtoAAdressCity { get; set; }
        public string PtoAAdressStat { get; set; }
        public string PtoAAdressZip { get; set; }
        public string RendProvLast { get; set; }
        public string RendProvFirst { get; set; }
        public string RendProvNpi { get; set; }
        public string RendProvOth { get; set; }
        public string RefProvLast { get; set; }
        public string RefProvFirst { get; set; }
        public string RefProvNpi { get; set; }
        public string RefProvNpiOth { get; set; }
        public string FacilityType { get; set; }
        public string FacilityOrganizationName { get; set; }
        public string FacilityAddress1 { get; set; }
        public string FacilityAddress2 { get; set; }
        public string FacilityCity { get; set; }
        public string FacilityState { get; set; }
        public string FacilityZip { get; set; }
        public string FacilityNPI { get; set; }
        public string FacilityOthProvID { get; set; }
        public string GenralPatAccuntNo { get; set; }
        public string GenralClaimFreq { get; set; }
        public string GenralOriginalRef { get; set; }
        public bool GenralOriginalClaim { get; set; }
        public bool AnotherPartyResponsible { get; set; }
        public bool EmpRelated { get; set; }
        public bool OthAcc { get; set; }
        public bool AutoAcc { get; set; }
        public DateTime? AccidentDate { get; set; }
        public string GenralState { get; set; }
        public string GenralCountry { get; set; }
        public DateTime? LastSeenDate { get; set; }
        public DateTime? DischargeDate { get; set; }
        public DateTime? IllnessDate { get; set; }
        public DateTime? LastWorkedDate { get; set; }
        public DateTime? ReturnToWorkDate { get; set; }
        public DateTime? AdmissionDate { get; set; }
        public DateTime? SimilarSymptomsDate { get; set; }
        public DateTime? RecevedDate { get; set; }
        public string DiagCode1 { get; set; }
        public string DiagCode2 { get; set; }
        public string DiagCode3 { get; set; }
        public string DiagCode4 { get; set; }
        public string DiagCode5 { get; set; }
        public string DiagCode6 { get; set; }
        public string DiagCode7 { get; set; }
        public string DiagCode8 { get; set; }
        public string DiagCode9 { get; set; }

        public string DiagCode10 { get; set; }

        public string DiagCode11 { get; set; }
        public string DiagCode12 { get; set; }
        public string AmbPatWeight { get; set; }
        public string ReasonCode { get; set; }
        public string TransportDistance { get; set; }
        public string POS { get; set; }
        public string AmbPikAdd1 { get; set; }
        public string AmbPikAdd2 { get; set; }
        public string AmbPikCity { get; set; }
        public string AmbPikSt { get; set; }
        public string AmbPikZip { get; set; }
        public decimal TotalChrg { get; set; }
        public string PatPaid { get; set; }
        public string PayerPaidAmt { get; set; }
        public string AmbDrpAdd1 { get; set; }
        public string AmbDrpAdd2 { get; set; }
        public string AmbDrpCity { get; set; }
        public string AmbDrpSt { get; set; }
        public string AmbDrpZip { get; set; }
        public List<ClaimServiceLindeModel> servicelines { get; set; }
    }
}

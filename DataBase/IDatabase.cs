using Database.Models;
using DataBase.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase
{
    public interface IDatabase
    {
        Task UpdatePCPs(String memberid, String healthplan, MemberPCPModel[] hps);
        Task<MemberPCPModel[]> GetMemberPcps(string memberid,string healthplan);
        Task UpdateHPs(String memberid, String healthplan, MemberHealthPlanModel[] hps);
        Task<MemberHealthPlanModel[]> GetMemberHealthPlans(string MemberId, string heathplan);
        Task<List<MembersModel>> searchMember(MemberSearch ms);
        Task Update(MembersModel model);
        Task<List<MembersModel>> selectMember(string memberid, string healthplan);
        Task<List<ProviderSearchResultModel>> searchProvider(string pcpid,string pcpnpi, string lastName, string firstName, string organizationName, string address1, string address2, string city, string state, string postalCode);
        Task<BenefitMasterModel[]> searchbenefitMaster(string healthplan,string healthplancode);
        Task createMember(MembersModel model);
        Task<PcpAutoFillModel> GetPcpOrganizationName(string pcpid);
        Task<string> SearchBenefitCode(string hpcode,string benefitcode);
        Task<ClaimsTableModel[]> GetAllClaims();
        Task<int> storefiledetails(string filename);
        Task<bool> addProvider(ProviderModel model);
        Task<bool> addOrganization(OrganizationModel model);
        Task<OrganizationModel[]> searchOrganization(string query);
        Task<BenefitMasterModel[]> searchBenefitMaster();
        Task<bool> providersAdd(string path);
        Task InsertClaim(EDIModel model,int fileid);
        void insertbillingporvider(string transactionid, string billingproviderloopid, string billingproviderlastname, string billingprovidernpi, string taxid, string address1, string address2, string city, string state, string postalcode);
        void spinsertsubscriber(string transactionid, string billingproviderloopid, string loopid, string lastname, string firstname, string subscriberid, string address1, string address2, string city, string state, string postalcode,string dob,string gender);
        string spinsertclaim(int fileid,string transactionid, string parentloopid, string claimsenderid, string diagnosiscode1, string diagnosiscode2, string diagnosiscode3, string diagnosiscode4, string diagnosiscode5, string diagnosiscode6, string diagnosiscode7, string diagnosiscode8, string diagnosiscode9, string diagnosiscode10, string diagnosiscode11, string diagnosiscode12);
        void spinsertreferingprovider(string claimid, string lastname, string firstname, string referingprovidernpi);
        void spinsertrenderingprovider(string claimid, string lastname, string firstname, string renderningprovidernpi);
        void spinsertservicefacilitylocation(string claimid, string lastname, string firstname, string organizationnpi, string address1, string address2, string city, string state, string postalcode);
        void spinsertambulancepickup(string claimid, string address1, string address2, string city, string state, string postalcode);
        void spinsertambulancedroplocation(string claimid, string organizationname, string organizationnpi, string address1, string address2, string city, string state, string postalcode);
        void spinsertserviceline(string claimid, string servicelinenumber, string procedurecode, string diagnosiscode, string serviceperiod);
        void spinsertpatient(string transactionid, string subscriberloopid, string loopid, string lastname, string firstname, string patientid, string address1, string address2, string city, string state, string postalcode,string dob,string gender);

        Task AddBenefitMaster(BenefitMasterModel model);
    }
}

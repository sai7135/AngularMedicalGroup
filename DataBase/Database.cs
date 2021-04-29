using DataBase.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Database.Models;

namespace DataBase
{
    public class Database : IDatabase
    {
        public Database()
        {

        }
        public async Task UpdatePCPs(String memberid, String healthplan, MemberPCPModel[] pcps) {
            try
            {
                string memberkeyid = null;
                using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("spRemovePCPs", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@memberid", memberid);
                    cmd.Parameters.AddWithValue("@hp", healthplan);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        foreach (IDataRecord r in reader)
                        {
                            memberkeyid = "" + r["memkeyid"];
                        }
                    }
                }

                foreach (MemberPCPModel pcp in pcps)
                {
                    using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("spinsertMemberPCPtb", con);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@member_key_id", memberkeyid);
                        cmd.Parameters.AddWithValue("@pcpid", pcp.pcpid);
                        cmd.Parameters.AddWithValue("@fromdate", pcp.pcpfromdt == null ? null : TimeZoneInfo.ConvertTimeFromUtc((DateTime)pcp.pcpfromdt, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToShortDateString() == "1/1/0001" ? null : TimeZoneInfo.ConvertTimeFromUtc((DateTime)pcp.pcpfromdt, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToShortDateString());
                        cmd.Parameters.AddWithValue("@todate", pcp.pcptodt == null ? null : TimeZoneInfo.ConvertTimeFromUtc((DateTime)pcp.pcptodt, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToShortDateString() == "1/1/0001" ? null : TimeZoneInfo.ConvertTimeFromUtc((DateTime)pcp.pcptodt, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToShortDateString());
                        cmd.Parameters.AddWithValue("@Org", pcp.pcpprimorg);
                        cmd.Parameters.AddWithValue("@MaintRes", pcp.maintanancereason);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception e)
            {
                throw;
            }
        }
        public async Task<List<FileDataModel>> GetFileData(FileDataSearchModel search)
        {
            try
            {
                using (EDIDatabase db = new EDIDatabase())
                {

                    List<FileDataModel> fd = db.Database.SqlQuery<FileDataModel>("spGetClaimUp '" + search.FileId+"','"+search.FileError+"','"+search.TP+"','"+search.UploadFrom+"','"+search.UploadTo+"','"+search.Format+"','"+search.UploadedBy+"','"+search.UsageIndicator+"','"+search.FileName+"'").ToList();
                    return fd;
                }
            }
            catch (Exception e)
            {
                throw;
            }
        }
        public async Task<List<ClaimsData>> GetClaimData(string claimid) {
            try
            {
                using (EDIDatabase db = new EDIDatabase()) {

                    List<ClaimsData> cd=db.Database.SqlQuery<ClaimsData>("spGetClaimData "+ claimid).ToList();
                    cd[0].servicelines = db.Database.SqlQuery<ClaimServiceLindeModel>("spGetServLines "+claimid).ToList();
                    return cd;
                }
            }
            catch (Exception e) {
                throw;
            }
        }
        public async Task<MemberPCPModel[]> GetMemberPcps(string memberid, string healthplan) {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spgetallpcps", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@memberid", memberid);
                cmd.Parameters.Add("@hp", healthplan);
                List<MemberPCPModel> results = new List<MemberPCPModel>();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        results.Add(new MemberPCPModel()
                        {
                            c = "H",
                            pcpid = "" + r["pcpid"],
                            pcpName = "" + r["pcpName"],
                            pcpprimorg=""+r["organization"],
                            maintanancereason = "" + r["MaintReason"],
                            pcpfromdt = ("" + r["fromdate"]) == "" ? (DateTime?)null : Convert.ToDateTime("" + r["fromdate"]),
                            pcptodt = ("" + r["todate"]) == "" ? (DateTime?)null : Convert.ToDateTime("" + r["todate"])
                        });
                    }
                }
                return results.ToArray();
            }
        }
        public async Task UpdateHPs(String memberid, String healthplan, MemberHealthPlanModel[] hps) {
            try
            {
                string memberkeyid = null;
                using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("spRemoveHps", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@memberid", memberid);
                    cmd.Parameters.AddWithValue("@hp", healthplan);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        foreach (IDataRecord r in reader)
                        {
                            memberkeyid = "" + r["memkeyid"];
                        }
                    }
                }

                foreach (MemberHealthPlanModel hp in hps)
                {
                    using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("spinsertMembersHealthPlantb", con);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@memberkeyid", memberkeyid);
                        cmd.Parameters.AddWithValue("@BenefitCode", hp.BenefitCode);
                        cmd.Parameters.AddWithValue("@fromdate", hp.BenefitFrom==null?null:TimeZoneInfo.ConvertTimeFromUtc((DateTime)hp.BenefitFrom,TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToShortDateString() == "1/1/0001" ?null: TimeZoneInfo.ConvertTimeFromUtc((DateTime)hp.BenefitFrom, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToShortDateString());
                        cmd.Parameters.AddWithValue("@todate", hp.BenefitTo==null?null: TimeZoneInfo.ConvertTimeFromUtc((DateTime)hp.BenefitTo, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToShortDateString()== "1/1/0001"?null: TimeZoneInfo.ConvertTimeFromUtc((DateTime)hp.BenefitTo, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToShortDateString());
                        cmd.Parameters.AddWithValue("@EmpGrp", hp.EmpGrp);
                        cmd.Parameters.AddWithValue("@MaintRes", hp.MaintannceReason);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception e) {
                throw;
            }
        }
        public async Task<MemberHealthPlanModel[]> GetMemberHealthPlans(string MemberId, string heathplan)
        {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spgetallhps", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@memberid", MemberId);
                cmd.Parameters.Add("@hp", heathplan);
                List<MemberHealthPlanModel> results = new List<MemberHealthPlanModel>();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        results.Add(new MemberHealthPlanModel()
                        {
                            c="H",
                            HPCode = heathplan,
                            BenefitCode = "" + r["BenefitCode"],
                            MaintannceReason= ""+r["MaintReason"],
                            BenefitFrom =( "" + r["fromdate"])==""?(DateTime?)null:Convert.ToDateTime("" + r["fromdate"]),
                            BenefitTo =("" + r["todate"])==""? (DateTime?)null : Convert.ToDateTime("" + r["todate"]),
                            EmpGrp= "" + r["EmpGrp"]
                        });
                    }
                }
                return results.ToArray();
            }
        }
        public async Task<List<MembersModel>> searchMember(MemberSearch ms) {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spsearchmember", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@memberid", ms.memberID == null?"" : ms.memberID);
                cmd.Parameters.AddWithValue("@firstName", ms.firstName == null ? "" : ms.firstName);
                cmd.Parameters.AddWithValue("@lastName", ms.lastName == null ? "" : ms.lastName);
                cmd.Parameters.AddWithValue("@dob", ms.dob == null ? "" : ms.dob);
                cmd.Parameters.AddWithValue("@hp", ms.hp == null ? "" : ms.hp);
                List<MembersModel> results = new List<MembersModel>();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows) {
                    foreach(IDataRecord r in reader){
                        results.Add(new MembersModel() {
                            memberId = "" + r["memberID"],
                            hp=""+r["HealthPlanCode"]
                        });
                    }
                }
                return results;
            }
        }
        public async Task Update(MembersModel model)
        {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spaltermember", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@memberid",model.memberId);
                cmd.Parameters.AddWithValue("@firstName", model.firstName);
                cmd.Parameters.AddWithValue("@lastName", model.lastName);
                cmd.Parameters.AddWithValue("@middleName", model.middleName);
                cmd.Parameters.AddWithValue("@suffixName", model.suffixName);
                cmd.Parameters.AddWithValue("@address1", model.address1);
                cmd.Parameters.AddWithValue("@address2", model.address2);
                cmd.Parameters.AddWithValue("@city", model.city);
                cmd.Parameters.AddWithValue("@state", model.state);
                cmd.Parameters.AddWithValue("@postalCode", model.zip);
                cmd.Parameters.AddWithValue("@countryCode", model.country);
                cmd.Parameters.AddWithValue("@gender", model.gender);
                cmd.Parameters.AddWithValue("@dob", model.BirthDate);
                cmd.Parameters.AddWithValue("@hp", model.hp);
                cmd.ExecuteReader();
            }
        }
        public async Task<List<MembersModel>> selectMember(string memberid, string healthplan)
        {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {

                try
                {
                    con.Open();
                SqlCommand cmd = new SqlCommand("spmemberselect", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@memberid",memberid);
                cmd.Parameters.AddWithValue("@healthplan", healthplan);
                SqlDataReader reader = await cmd.ExecuteReaderAsync();
                List<MembersModel> results=new List<MembersModel>();
                
                    if (reader.HasRows)
                    {
                        foreach (IDataRecord r in reader)
                        {
                            results.Add(new MembersModel
                            {
                                memberId = "" + r["memberID"],
                                firstName = "" + r["firstName"],
                                lastName = "" + r["lastName"],
                                middleName = "" + r["middleName"],
                                suffixName = "" + r["suffixName"],
                                address1 = "" + r["address1"],
                                address2 = "" + r["address2"],
                                city = "" + r["city"],
                                state = "" + r["state"],
                                zip = "" + r["postalCode"],
                                country = "" + r["countryCode"],
                                BirthDate = "" + r["dob"],
                                gender = "" + r["gender"],
                                pcpid = "" + r["pcpid"],
                                pcpfromdate = "" + r["pcpfromdate"],
                                pcptodate = "" + r["pcptodate"],
                                pcpMaintRes = "" + r["pcpMaintRes"],
                                organizationName=""+r["organization"],
                                hp = "" + r["HealthPlanCode"],
                                hpcode = "" + r["BenefitCode"],
                                hpfromdate = "" + r["hpfrmdate"],
                                hptoDate = "" + r["hptodate"],
                                hpMaintRes = "" + r["hpMaintRes"]
                            });
                        }
                    }
               
                return results;
                }
                catch (Exception e)
                {
                    throw;
                }
            }
        }
        public async Task<List<ProviderSearchResultModel>> searchProvider(string pcpid,string pcpnpi, string lastName, string firstName, string organizationName, string address1, string address2, string city, string state, string postalCode)
        {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spsearchprovider", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@pcpid", pcpid);
                cmd.Parameters.AddWithValue("@providernpi", pcpnpi);
                cmd.Parameters.AddWithValue("@providerlastname", lastName);
                cmd.Parameters.AddWithValue("@providerfirstname", pcpid);
                cmd.Parameters.AddWithValue("@organizationname", pcpid);
                cmd.Parameters.AddWithValue("@address1", address1);
                cmd.Parameters.AddWithValue("@address2", address2);
                cmd.Parameters.AddWithValue("@city", city);
                cmd.Parameters.AddWithValue("@state", state);
                cmd.Parameters.AddWithValue("@postalcode", postalCode);
                SqlDataReader reader = await cmd.ExecuteReaderAsync();
                List<ProviderSearchResultModel> results = new List<ProviderSearchResultModel>();
                
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        results.Add(new ProviderSearchResultModel {
                            Pcpid=""+r["providerID"],
                            ProviderNpi=""+r["providerNpi"],
                            LastName =""+r["lastName"],
                            FirstName=""+r["firstName"],
                            Taxid=""+r["taxId"],
                            Phone=""+r["phone"],
                            Fax=""+r["fax"],
                            ContractType=""+r["contractType"],
                            OrganizationName=""+r["organizationName"],
                            ContractFromDate =""+r["contractFromDate"],
                            ContractToDate=""+r["contractToDate"]
                        });
                    }
                }
                return results;
            }
        }
        public async Task AddBenefitMaster(BenefitMasterModel model)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("spcrudBeneficiery", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@HealthPlanCode", model.healthPlanCode);
                cmd.Parameters.AddWithValue("@BenefitCode", model.benefitCode);
                cmd.Parameters.AddWithValue("@EmployerGroup", model.employerGroup);
                cmd.Parameters.AddWithValue("@Description", model.description);
                cmd.Parameters.AddWithValue("@EffectiveFromDate", model.dateRange.effectiveFromDate);
                cmd.Parameters.AddWithValue("@EffectiveToDate", model.dateRange.toDate);
                cmd.Parameters.AddWithValue("@AccumilationPeriod", model.dateRange.accumuilation);
                cmd.Parameters.AddWithValue("@LineOfBusiness", model.lineOfbusiness.lineOfbusiness);
                cmd.Parameters.AddWithValue("@FinancialResponcibilitySet", model.set.financialResponsibility);
                cmd.Parameters.AddWithValue("@OOPMaximumMember", model.memberFamilyLimit.HMO.oopMaximumMember);
                cmd.Parameters.AddWithValue("@OOPMaximumSubscriber", model.memberFamilyLimit.HMO.oopMaximumSubscriber);
                cmd.Parameters.AddWithValue("@DeductableForMember", model.memberFamilyLimit.HMO.deductableForMember);
                cmd.Parameters.AddWithValue("@DeductableForSubscriber", model.memberFamilyLimit.HMO.deductableForSubscriber);
                cmd.Parameters.AddWithValue("@InNetworkOOPMaximumMember", model.memberFamilyLimit.PPO.inoopMaximumMember);
                cmd.Parameters.AddWithValue("@InNetworkOOPMaximumSubscriber", model.memberFamilyLimit.PPO.inoopMaximumSubscriber);
                cmd.Parameters.AddWithValue("@InNetworkDeductableForMember", model.memberFamilyLimit.PPO.indeductableForMember);
                cmd.Parameters.AddWithValue("@InNetworkDeductableForSubscriber", model.memberFamilyLimit.PPO.indeductableForSubscriber);
                cmd.Parameters.AddWithValue("@OutNetworkOOPMaximumMember", model.memberFamilyLimit.PPO.outoopMaximumMember);
                cmd.Parameters.AddWithValue("@OutNetworkOOPMaximumSubscriber", model.memberFamilyLimit.PPO.outoopMaximumSubscriber);
                cmd.Parameters.AddWithValue("@OutNetworkDeductableForMember", model.memberFamilyLimit.PPO.outoopdeductableMember);
                cmd.Parameters.AddWithValue("@OutNetworkDeductableForSusbscriber", model.memberFamilyLimit.PPO.outoopdeductableSubscriber);
                cmd.Parameters.AddWithValue("@OOPMaximumCombinedMember", model.memberFamilyLimit.PPO.oopMaximumCombinedMember);
                cmd.Parameters.AddWithValue("@OOPMaximumCombinedSubscriber", model.memberFamilyLimit.PPO.oopMaximumCombinedSubscriber);
                cmd.Parameters.AddWithValue("@DeductableCombinedMember", model.memberFamilyLimit.PPO.deductableCombinedMember);
                cmd.Parameters.AddWithValue("@DeductableCombinedSubscriber", model.memberFamilyLimit.PPO.deductableCombinedSubscriber);
                cmd.Parameters.AddWithValue("@note", model.note.note);
                cmd.Parameters.AddWithValue("@operation", "c");
                cmd.ExecuteReader();
            }
            finally
            {
                con.Close();
            }
        }
       
        public async Task<BenefitMasterModel[]> searchbenefitMaster(string healthplan, string healthplancode)
        {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spsearchbenefitmaster", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@hp", healthplan);
                cmd.Parameters.AddWithValue("@hpCode", healthplancode);
                SqlDataReader reader = cmd.ExecuteReader();
                List<BenefitMasterModel> benefitmasterlist = new List<BenefitMasterModel>();
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        benefitmasterlist.Add(new BenefitMasterModel() {
                            healthPlanCode = ""+r["HealthPlanCode"],
                            benefitCode=""+r["BenefitCode"],
                            description=""+r["Description"]
                        });
                    }
                }
                return benefitmasterlist.ToArray();
            }
        }
        public async Task createMember(MembersModel model)
        {
            string memberkeyid=null;
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spcreatemembers", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@memberID", model.memberId);
                cmd.Parameters.AddWithValue("@lastName", model.lastName);
                cmd.Parameters.AddWithValue("@HealthPlanCode", model.hp);
                cmd.Parameters.AddWithValue("@firstName", model.firstName);
                cmd.Parameters.AddWithValue("@middleName", model.middleName);
                cmd.Parameters.AddWithValue("@suffixName", model.suffixName);
                cmd.Parameters.AddWithValue("@address1", model.address1);
                cmd.Parameters.AddWithValue("@address2", model.address2);
                cmd.Parameters.AddWithValue("@city", model.city);
                cmd.Parameters.AddWithValue("@state", model.state);
                cmd.Parameters.AddWithValue("@postalCode", model.zip);
                cmd.Parameters.AddWithValue("@countryCode", model.country);
                cmd.Parameters.AddWithValue("@dob", model.BirthDate);
                cmd.Parameters.AddWithValue("@gender", model.gender);
                SqlDataReader reader = cmd.ExecuteReader();
                
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        memberkeyid = "" + r["member_key_id"];
                    }
                }
            }
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spinsertMembersHealthPlantb", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@memberkeyid", memberkeyid);
                cmd.Parameters.AddWithValue("@BenefitCode", model.hpcode);
                cmd.Parameters.AddWithValue("@fromdate", model.hpfromdate);
                cmd.Parameters.AddWithValue("@todate", model.hptoDate);
                cmd.Parameters.AddWithValue("@EmpGrp", model.empGrp);
                cmd.Parameters.AddWithValue("@MaintRes", model.hpMaintRes);
                cmd.ExecuteNonQuery();
            }
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spinsertMemberPCPtb",con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@member_key_id", memberkeyid);
                cmd.Parameters.AddWithValue("@pcpid",model.pcpid);
                cmd.Parameters.AddWithValue("@fromdate",model.pcpfromdate);
                cmd.Parameters.AddWithValue("@todate",model.pcptodate);
                cmd.Parameters.AddWithValue("@MaintRes", model.pcpMaintRes);
                cmd.Parameters.AddWithValue("@Org", model.organizationName);
                cmd.ExecuteNonQuery();
            }
        }
        public async Task<bool> addProvider(ProviderModel data)
        {

            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("spAddProvider", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@providerNpi", data.basicinformation.npi);
                cmd.Parameters.AddWithValue("@providerID", data.basicinformation.providerid);
                cmd.Parameters.AddWithValue("@category", data.basicinformation.category);
                cmd.Parameters.AddWithValue("@providerType", data.basicinformation.providertype);
                cmd.Parameters.AddWithValue("@primarySpeciality", data.basicinformation.primaryspeciality);
                cmd.Parameters.AddWithValue("@preferedSpeciality", data.basicinformation.preferedspeciality);
                cmd.Parameters.AddWithValue("@referAnyMember", data.basicinformation.referanymember);
                cmd.Parameters.AddWithValue("@title", data.basicinformation.nameTitle);
                cmd.Parameters.AddWithValue("@lastName", data.basicinformation.nameLast);
                cmd.Parameters.AddWithValue("@firstName", data.basicinformation.nameFirst);
                cmd.Parameters.AddWithValue("@middle", data.basicinformation.nameMiddle);
                cmd.Parameters.AddWithValue("@suffix", data.basicinformation.nameSuffix);
                cmd.Parameters.AddWithValue("@profSuffix", data.basicinformation.nameProfSuffix);
                cmd.Parameters.AddWithValue("@middleName", data.basicinformation.nameMiddleName);
                cmd.Parameters.AddWithValue("@gender", data.basicinformation.personalGender);
                cmd.Parameters.AddWithValue("@dob", data.basicinformation.personalDateOfBirth);
                cmd.Parameters.AddWithValue("@citizenship", data.basicinformation.personalCitezenship);
                cmd.Parameters.AddWithValue("@birthCity", data.basicinformation.personalBirthCity);
                cmd.Parameters.AddWithValue("@birthState", data.basicinformation.personalBirthState);
                cmd.Parameters.AddWithValue("@birthCountry", data.basicinformation.personalBirthCountry);
                cmd.Parameters.AddWithValue("@contractType", data.providerInformation.contractType);
                cmd.Parameters.AddWithValue("@fromDate", data.providerInformation.fromDate);
                cmd.Parameters.AddWithValue("@contractTermedDate", data.providerInformation.toDate);
                cmd.Parameters.AddWithValue("@paymentType", data.providerInformation.paymentType);
                cmd.Parameters.AddWithValue("@account", data.providerInformation.account);
                cmd.Parameters.AddWithValue("@carrierlocality", data.providerInformation.carrierlocality);
                cmd.Parameters.AddWithValue("@cliaCertified", data.clia.certified);
                cmd.Parameters.AddWithValue("@clia1Waivable", data.clia.waivable1);
                cmd.Parameters.AddWithValue("@clia2Waivable", data.clia.waivable2);
                cmd.Parameters.AddWithValue("@authorizationValidForDays", data.authConfiguration.validfrom);
                cmd.Parameters.AddWithValue("@allowedVisits", data.authConfiguration.allowedVisits);
                cmd.Parameters.AddWithValue("@acceptPatients", data.authConfiguration.acceptPatient);
                cmd.Parameters.AddWithValue("@allowedAsRefferingToProvider", data.authConfiguration.allowasReferingProvider);
                cmd.Parameters.AddWithValue("@practiceType", data.primaryLocation.practiceType);
                cmd.Parameters.AddWithValue("@name", data.primaryLocation.name);
                cmd.Parameters.AddWithValue("@address1", data.primaryLocation.address1);
                cmd.Parameters.AddWithValue("@address2", data.primaryLocation.address2);
                cmd.Parameters.AddWithValue("@aptNo", data.primaryLocation.aptno);
                cmd.Parameters.AddWithValue("@city", data.primaryLocation.city);
                cmd.Parameters.AddWithValue("@state", data.primaryLocation.state);
                cmd.Parameters.AddWithValue("@doctorCountry", data.primaryLocation.countryid);
                cmd.Parameters.AddWithValue("@country", data.primaryLocation.country);
                cmd.Parameters.AddWithValue("@zip", data.primaryLocation.zip);
                cmd.Parameters.AddWithValue("@phone", data.primaryLocation.phone);
                cmd.Parameters.AddWithValue("@fax", data.primaryLocation.fax);
                cmd.Parameters.AddWithValue("@contractTemplate", data.contactStatus.contractTemplate);
                cmd.Parameters.AddWithValue("@contractFromDate", data.contactStatus.fromDate);
                cmd.Parameters.AddWithValue("@contractToDate", data.contactStatus.toDate);
                cmd.Parameters.AddWithValue("@parentPayorFacility1", data.appointmentStatus.parentPayorFacility1);
                cmd.Parameters.AddWithValue("@parentPayorFacility2", data.appointmentStatus.parentPayorFacility2);
                cmd.Parameters.AddWithValue("@appType", data.appointmentStatus.appType);
                cmd.Parameters.AddWithValue("@operation", 'c');

                SqlDataReader reader1 = await cmd.ExecuteReaderAsync();
                bool success = await AddOrganizationProvider(data);

                return reader1.Read();
            }
            finally
            {
                con.Close();
            }
        }

        public async Task<bool> AddOrganizationProvider(ProviderModel data)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("spaddorganizationtoprovider", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                bool success = true;
                foreach (OrganizationInformation each in data.organizationInformation)
                {
                    cmd.Parameters.AddWithValue("@providerId", data.basicinformation.providerid);
                    cmd.Parameters.AddWithValue("@organizationId", each.organizationId);
                    cmd.Parameters.AddWithValue("@organizationType", each.organizationType);
                    cmd.Parameters.AddWithValue("@orgEffectiveFrom", each.organizationEffectiveFrom);
                    cmd.Parameters.AddWithValue("@orgEffectiveTo", each.organizationEffectiveTo);
                    SqlDataReader reader = cmd.ExecuteReader();
                    success &= reader.Read();
                    reader.Close();
                }
                return success;
            }
            finally
            {
                con.Close();
            }
        }

        public async Task<bool> addOrganization(OrganizationModel model)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("sporgcrud", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@organizationId", model.organizationID);
                cmd.Parameters.AddWithValue("@category", model.category);
                cmd.Parameters.AddWithValue("@organizationName", model.organizationName);
                cmd.Parameters.AddWithValue("@organizationLongName", model.organizationLongName);
                cmd.Parameters.AddWithValue("@accountingSystemName", model.accountingSystemName);
                cmd.Parameters.AddWithValue("@taxId", model.taxID);
                cmd.Parameters.AddWithValue("@organizationNpi", model.organizationNPI);
                cmd.Parameters.AddWithValue("@ssn", model.ssn);
                cmd.Parameters.AddWithValue("@taxonomyCode", model.taxonomyCode);
                cmd.Parameters.AddWithValue("@capitationAccount", model.capitationAccount);
                cmd.Parameters.AddWithValue("@claimsAccount", model.claimsAccount);
                cmd.Parameters.AddWithValue("@ptoAddress1", model.payToAddress.address1);
                cmd.Parameters.AddWithValue("@ptoAddress2", model.payToAddress.address2);
                cmd.Parameters.AddWithValue("@ptoCity", model.payToAddress.city);
                cmd.Parameters.AddWithValue("@ptoState", model.payToAddress.state);
                cmd.Parameters.AddWithValue("@ptoZip", model.payToAddress.zip);
                cmd.Parameters.AddWithValue("@ptoInternationalZip", model.payToAddress.internationalZip);
                cmd.Parameters.AddWithValue("@ptoCountryDistict", model.payToAddress.countryDistict);
                cmd.Parameters.AddWithValue("@ptoCountry", model.payToAddress.country);
                cmd.Parameters.AddWithValue("@ptoPhone", model.payToAddress.phone);
                cmd.Parameters.AddWithValue("@ptoFax", model.payToAddress.faxNumber);
                cmd.Parameters.AddWithValue("@ptoEmail", model.payToAddress.eMail);
                cmd.Parameters.AddWithValue("@ptoContactPerson", model.payToAddress.contactPerson);
                cmd.Parameters.AddWithValue("@blAddress1", model.billingAddress.address1);
                cmd.Parameters.AddWithValue("@blAddress2", model.billingAddress.address2);
                cmd.Parameters.AddWithValue("@blCity", model.billingAddress.city);
                cmd.Parameters.AddWithValue("@blState", model.billingAddress.state);
                cmd.Parameters.AddWithValue("@blZip", model.billingAddress.zip);
                cmd.Parameters.AddWithValue("@blInternationalZip", model.billingAddress.internationalZip);
                cmd.Parameters.AddWithValue("@blCountryDistict", model.billingAddress.countryDistict);
                cmd.Parameters.AddWithValue("@blCountry", model.billingAddress.country);
                cmd.Parameters.AddWithValue("@blPhone", model.billingAddress.phone);
                cmd.Parameters.AddWithValue("@blFax", model.billingAddress.faxNumber);
                cmd.Parameters.AddWithValue("@blEmail", model.billingAddress.eMail);
                cmd.Parameters.AddWithValue("@blContactPerson", model.billingAddress.contactPerson);
                cmd.Parameters.AddWithValue("@operation", 'c');
                SqlDataReader reader = await cmd.ExecuteReaderAsync();
                return reader.Read();
            }
            finally
            {
                con.Close();
            }
        }
        public async Task<bool> providersAdd(string path)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("spaddbulkproviders", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@path", path);
                SqlDataReader reader = await cmd.ExecuteReaderAsync();
                return reader.Read();
            }
            finally
            {
                con.Close();
            }
        }
        public void insertbillingporvider(string transactionid, string billingproviderloopid, string billingproviderlastname, string billingprovidernpi, string taxid, string address1, string address2, string city, string state, string postalcode)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertbillingprovider", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@transactionid", transactionid);
            cmd.Parameters.AddWithValue("@billingproviderloopid", billingproviderloopid);
            cmd.Parameters.AddWithValue("@billingproviderlastname", billingproviderlastname);
            cmd.Parameters.AddWithValue("@billingprovidernpi", billingprovidernpi);
            cmd.Parameters.AddWithValue("@taxid", taxid);
            cmd.Parameters.AddWithValue("@address1", address1);
            cmd.Parameters.AddWithValue("@address2", address2);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@postalcode", postalcode);
            cmd.ExecuteReader();
            con.Close();
        }
        public void spinsertsubscriber(string transactionid, string billingproviderloopid, string loopid, string lastname, string firstname, string subscriberid, string address1, string address2, string city, string state, string postalcode, string dob, string gender)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertsubscriber", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@transactionid", transactionid);
            cmd.Parameters.AddWithValue("@billingproviderloopid", billingproviderloopid);
            cmd.Parameters.AddWithValue("@loopid", loopid);
            cmd.Parameters.AddWithValue("@lastname", lastname);
            cmd.Parameters.AddWithValue("@firstname", firstname);
            cmd.Parameters.AddWithValue("@subscriberid", subscriberid);
            cmd.Parameters.AddWithValue("@address1", address1);
            cmd.Parameters.AddWithValue("@address2", address2);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@postalcode", postalcode);
            cmd.Parameters.AddWithValue("@dob", dob);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.ExecuteReader();
            con.Close();
        }
        public string spinsertclaim(int fileid,string transactionid, string parentloopid, string claimsenderid, string diagnosiscode1, string diagnosiscode2, string diagnosiscode3, string diagnosiscode4, string diagnosiscode5, string diagnosiscode6, string diagnosiscode7, string diagnosiscode8, string diagnosiscode9, string diagnosiscode10, string diagnosiscode11, string diagnosiscode12)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertclaim", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fileid", fileid);
            cmd.Parameters.AddWithValue("@transactionid", transactionid);
            cmd.Parameters.AddWithValue("@parentloopid", parentloopid);
            cmd.Parameters.AddWithValue("@claimsenderid", claimsenderid);
            cmd.Parameters.AddWithValue("@diagnosiscode1", diagnosiscode1);
            cmd.Parameters.AddWithValue("@diagnosiscode2", diagnosiscode2);
            cmd.Parameters.AddWithValue("@diagnosiscode3", diagnosiscode3);
            cmd.Parameters.AddWithValue("@diagnosiscode4", diagnosiscode4);
            cmd.Parameters.AddWithValue("@diagnosiscode5", diagnosiscode5);
            cmd.Parameters.AddWithValue("@diagnosiscode6", diagnosiscode6);
            cmd.Parameters.AddWithValue("@diagnosiscode7", diagnosiscode7);
            cmd.Parameters.AddWithValue("@diagnosiscode8", diagnosiscode8);
            cmd.Parameters.AddWithValue("@diagnosiscode9", diagnosiscode9);
            cmd.Parameters.AddWithValue("@diagnosiscode10", diagnosiscode10);
            cmd.Parameters.AddWithValue("@diagnosiscode11", diagnosiscode11);
            cmd.Parameters.AddWithValue("@diagnosiscode12", diagnosiscode12);
            SqlDataReader reader = cmd.ExecuteReader();
            string claimid = "-1";
            if (reader.HasRows)
            {
                foreach (IDataRecord r in reader)
                {
                    claimid = "" + r["claimid"];
                }
            }
            con.Close();
            return claimid;
        }

        public void spinsertreferingprovider(string claimid, string lastname, string firstname, string referingprovidernpi)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertreferingprovider", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@claimid", claimid);
            cmd.Parameters.AddWithValue("@lastname", lastname);
            cmd.Parameters.AddWithValue("@firstname", firstname);
            cmd.Parameters.AddWithValue("@referingprovidernpi", referingprovidernpi);
            cmd.ExecuteReader();
            con.Close();
        }
        public void spinsertrenderingprovider(string claimid, string lastname, string firstname, string renderningprovidernpi)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertrenderingprovider", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@claimid", claimid);
            cmd.Parameters.AddWithValue("@lastname", lastname);
            cmd.Parameters.AddWithValue("@firstname", firstname);
            cmd.Parameters.AddWithValue("@renderprovidernpi", renderningprovidernpi);
            cmd.ExecuteReader();
            con.Close();
        }
        public void spinsertservicefacilitylocation(string claimid, string lastname, string firstname, string organizationnpi, string address1, string address2, string city, string state, string postalcode)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertservicefacilitylocation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@claimid", claimid);
            cmd.Parameters.AddWithValue("@lastname", lastname);
            cmd.Parameters.AddWithValue("@firstname", firstname);
            cmd.Parameters.AddWithValue("@organizationnpi", organizationnpi);
            cmd.Parameters.AddWithValue("@address1", address1);
            cmd.Parameters.AddWithValue("@address2", address2);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@postalcode", postalcode);
            cmd.ExecuteReader();
            con.Close();
        }
        public void spinsertambulancepickup(string claimid, string address1, string address2, string city, string state, string postalcode)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertambulancepickup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@claimid", claimid);
            cmd.Parameters.AddWithValue("@address1", address1);
            cmd.Parameters.AddWithValue("@address2", address2);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@postalcode", postalcode);
            cmd.ExecuteReader();
            con.Close();
        }
        public void spinsertambulancedroplocation(string claimid, string organizationname, string organizationnpi, string address1, string address2, string city, string state, string postalcode)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertambulancedroplocation", con);
            cmd.Parameters.AddWithValue("@claimid", claimid);
            cmd.Parameters.AddWithValue("@organizationname", organizationname);
            cmd.Parameters.AddWithValue("@organizationnpi", organizationnpi);
            cmd.Parameters.AddWithValue("@address1", address1);
            cmd.Parameters.AddWithValue("@address2", address2);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@postalcode", postalcode);
            cmd.ExecuteReader();
            con.Close();
        }
        public void spinsertserviceline(string claimid, string servicelinenumber, string procedurecode, string diagnosiscode, string serviceperiod)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertserviceline", con);
            cmd.Parameters.AddWithValue("@claimid", claimid);
            cmd.Parameters.AddWithValue("@servicelinenumber", servicelinenumber);
            cmd.Parameters.AddWithValue("@procedurecode", procedurecode);
            cmd.Parameters.AddWithValue("@diagnosiscode", diagnosiscode);
            cmd.Parameters.AddWithValue("@serviceperiod", serviceperiod);
            cmd.ExecuteReader();
            con.Close();
        }
        public void spinsertpatient(string transactionid, string subscriberloopid, string loopid, string lastname, string firstname, string patientid, string address1, string address2, string city, string state, string postalcode, string dob, string gender)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            SqlCommand cmd = new SqlCommand("spinsertpatient", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@transactionid", transactionid);
            cmd.Parameters.AddWithValue("@subscriberloopid", subscriberloopid);
            cmd.Parameters.AddWithValue("@loopid", loopid);
            cmd.Parameters.AddWithValue("@lastname", lastname);
            cmd.Parameters.AddWithValue("@firstname", firstname);
            cmd.Parameters.AddWithValue("@patientid", patientid);
            cmd.Parameters.AddWithValue("@address1", address1);
            cmd.Parameters.AddWithValue("@address2", address2);
            cmd.Parameters.AddWithValue("@city", city);
            cmd.Parameters.AddWithValue("@state", state);
            cmd.Parameters.AddWithValue("@postalcode", postalcode);
            cmd.Parameters.AddWithValue("@dob", dob);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.ExecuteReader();
            con.Close();
        }
        public async Task<OrganizationModel[]> searchOrganization(string query)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("sporgcrud", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                if (query != "null")
                {
                    cmd.Parameters.AddWithValue("@condition", query);
                }
                cmd.Parameters.AddWithValue("@operation", 'r');
                SqlDataReader reader = cmd.ExecuteReader();
                List<OrganizationModel> list = new List<OrganizationModel>();
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        list.Add(new OrganizationModel()
                        {
                            organizationID = (string)r["organizationId"],
                            category = (string)r["category"],
                            organizationName = (string)r["organizationName"],
                            organizationLongName = (string)r["organizationLongName"],
                            accountingSystemName = (string)r["accountingSystemName"],
                            taxID = (string)r["taxId"],
                            organizationNPI = (string)r["organizationNpi"],
                            ssn = (string)r["ssn"],
                            taxonomyCode = (string)r["taxonomyCode"],
                            capitationAccount = (string)r["capitationAccount"],
                            claimsAccount = (string)r["claimsAccount"],
                            payToAddress = new AddressModel()
                            {
                                address1 = (string)r["ptoAddress1"],
                                address2 = (string)r["ptoAddress2"],
                                city = (string)r["ptoCity"],
                                state = (string)r["ptoState"],
                                zip = (string)r["ptoZip"],
                                internationalZip = (string)r["ptoInternationalZip"],
                                countryDistict = (string)r["ptoCountryDistict"],
                                country = (string)r["ptoCountry"],
                                phone = (string)r["ptoPhone"],
                                faxNumber = (string)r["ptoFax"],
                                eMail = (string)r["ptoEmail"],
                                contactPerson = (string)r["ptoContactPerson"],
                            },
                            billingAddress = new AddressModel()
                            {
                                address1 = (string)r["blAddress1"],
                                address2 = (string)r["blAddress2"],
                                city = (string)r["blCity"],
                                state = (string)r["blState"],
                                zip = (string)r["blZip"],
                                internationalZip = (string)r["blInternationalZip"],
                                countryDistict = (string)r["blCountryDistict"],
                                country = (string)r["blCountry"],
                                phone = (string)r["blPhone"],
                                faxNumber = (string)r["blFax"],
                                eMail = (string)r["blEmail"],
                                contactPerson = (string)r["blContactPerson"]
                            }
                        });
                    }
                }

                return list.ToArray();
            }
            finally
            {
                con.Close();
            }
        }

        public async Task<BenefitMasterModel[]> searchBenefitMaster()
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("spcrudBeneficiery", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@HealthPlanCode","");
                cmd.Parameters.AddWithValue("@BenefitCode","");
                cmd.Parameters.AddWithValue("@EmployerGroup","");
                cmd.Parameters.AddWithValue("@Description","");
                cmd.Parameters.AddWithValue("@FinancialResponcibilitySet","");
                cmd.Parameters.AddWithValue("@note","");
                cmd.Parameters.AddWithValue("@operation","r");
                var reader =await cmd.ExecuteReaderAsync();
                List<BenefitMasterModel> list = new List<BenefitMasterModel>();
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        list.Add(new BenefitMasterModel() {
                            healthPlanCode = (string)r["HealthPlanCode"],
                            benefitCode = (string)r["BenefitCode"],
                            employerGroup = (string)(r["EmployerGroup"]==DBNull.Value?String.Empty:r["EmployerGroup"]),
                            dateRange = new DateRange() {
                                effectiveFromDate = r["EffectiveFromDate"].ToString(),
                                toDate = (r["EffectiveToDate"]==DBNull.Value ? String.Empty : r["EffectiveToDate"]).ToString()
                            },
                            set=new Set() {
                                financialResponsibility=(string)(r["FinancialResponcibilitySet"]==DBNull.Value?String.Empty:r["FinancialResponcibilitySet"])
                            }
                        });
                    }
                }
                return list.ToArray();
            }
            finally
            {
                con.Close();
            }
        }

        public async Task<int> storefiledetails(string filename)
        {
            SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI");
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("spgetfileid", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@filename", filename);
                var reader = await cmd.ExecuteReaderAsync();
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        return int.Parse("" + r["fileid"]);
                    }
                }
                return 0;
            }
            finally
            {
                con.Close();
            }
        }
        public async Task<ClaimsTableModel[]> GetAllClaims()
        {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spgetclaim", con);
                cmd.CommandType = CommandType.StoredProcedure;
                var reader = cmd.ExecuteReader();
                List<ClaimsTableModel> model = new List<ClaimsTableModel>();
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        string dob = "" + r["L2010BA_1_DMG_1_DMG02"];
                        try
                        {
                            model.Add(new ClaimsTableModel
                            {
                                fileID = "" + r["Fileid"],
                                clmid = "" + r["claimid"],
                                memberid = "" + r["L2010BA_1_NM1_1_NM109"],
                                membername = "" + r["L2010BA_1_NM1_1_NM104"] + " " + r["L2010BA_1_NM1_1_NM103"],
                                dob = dob,
                                renderingprovider = "" + r["L2310B_1_NM1_1_NM104"] + " " + r["L2310B_1_NM1_1_NM103"],
                                billedamount = "" + r["L2300_1_CLM_1_CLM02"],
                                uploadDate=""+r["UploadDate"]
                            });
                        }
                        catch (Exception e) {
                            Console.WriteLine(e);
                        }
                    }

                }
                return model.ToArray();
            }
            return new ClaimsTableModel[] {};
        }
        public async Task InsertClaim(EDIModel model,int fileid)
        {   
            foreach(Group group in model.Group)
            {
                if (group.Transaction.Length == group.GE.GE1)
                {
                    foreach (Transaction transaction in group.Transaction)
                    {
                        if(transaction.actualsegmentcount==transaction.SE.SE1)
                        { 
                        using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("spinsertEDIHeader", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Fileid", fileid);
                            cmd.Parameters.AddWithValue("@HeaderID", transaction.ST.ST2);
                            cmd.Parameters.AddWithValue("@L837PTS_1_ST_1_ST01", transaction.ST.ST1);
                            cmd.Parameters.AddWithValue("@L837PTS_1_ST_1_ST02", transaction.ST.ST2);
                            cmd.Parameters.AddWithValue("@L837PTS_1_ST_1_ST03", transaction.ST.ST3);
                            cmd.Parameters.AddWithValue("@L837PTS_1_BHT_1_BHT01", transaction.BHT.BHT1);
                            cmd.Parameters.AddWithValue("@L837PTS_1_BHT_1_BHT02", transaction.BHT.BHT2);
                            cmd.Parameters.AddWithValue("@L837PTS_1_BHT_1_BHT03", transaction.BHT.BHT3);
                            cmd.Parameters.AddWithValue("@L837PTS_1_BHT_1_BHT04", transaction.BHT.BHT4);
                            cmd.Parameters.AddWithValue("@L837PTS_1_BHT_1_BHT05", transaction.BHT.BHT5);
                            cmd.Parameters.AddWithValue("@L837PTS_1_BHT_1_BHT06", transaction.BHT.BHT6);
                            cmd.Parameters.AddWithValue("@L1000A_1_NM1_1_NM101", transaction.submitter.NM1.NM11);
                            cmd.Parameters.AddWithValue("@L1000A_1_NM1_1_NM102", transaction.submitter.NM1.NM12);
                            cmd.Parameters.AddWithValue("@L1000A_1_NM1_1_NM103", transaction.submitter.NM1.NM13);
                            cmd.Parameters.AddWithValue("@L1000A_1_NM1_1_NM104", transaction.submitter.NM1.NM14);
                            cmd.Parameters.AddWithValue("@L1000A_1_NM1_1_NM105", transaction.submitter.NM1.NM15);
                            cmd.Parameters.AddWithValue("@L1000A_1_NM1_1_NM108", transaction.submitter.NM1.NM18);
                            cmd.Parameters.AddWithValue("@L1000A_1_NM1_1_NM109", transaction.submitter.NM1.NM19);
                            for (int i = 0; i < transaction.submitter.PER.Length && i < 2; i++)
                            {
                                cmd.Parameters.AddWithValue($"@L1000A_1_PER_{i + 1}_PER01", transaction.submitter.PER[i].PER1);
                                cmd.Parameters.AddWithValue($"@L1000A_1_PER_{i + 1}_PER02", transaction.submitter.PER[i].PER2);
                                cmd.Parameters.AddWithValue($"@L1000A_1_PER_{i + 1}_PER03", transaction.submitter.PER[i].PER3);
                                cmd.Parameters.AddWithValue($"@L1000A_1_PER_{i + 1}_PER04", transaction.submitter.PER[i].PER4);
                                cmd.Parameters.AddWithValue($"@L1000A_1_PER_{i + 1}_PER05", transaction.submitter.PER[i].PER5);
                                cmd.Parameters.AddWithValue($"@L1000A_1_PER_{i + 1}_PER06", transaction.submitter.PER[i].PER6);
                                cmd.Parameters.AddWithValue($"@L1000A_1_PER_{i + 1}_PER07", transaction.submitter.PER[i].PER7);
                                cmd.Parameters.AddWithValue($"@L1000A_1_PER_{i + 1}_PER08", transaction.submitter.PER[i].PER8);
                            }
                            cmd.Parameters.AddWithValue("@L1000B_1_NM1_1_NM101", transaction.receiver.NM1.NM11);
                            cmd.Parameters.AddWithValue("@L1000B_1_NM1_1_NM102", transaction.receiver.NM1.NM12);
                            cmd.Parameters.AddWithValue("@L1000B_1_NM1_1_NM103", transaction.receiver.NM1.NM13);
                            cmd.Parameters.AddWithValue("@L1000B_1_NM1_1_NM108", transaction.receiver.NM1.NM18);
                            cmd.Parameters.AddWithValue("@L1000B_1_NM1_1_NM109", transaction.receiver.NM1.NM19);
                            await cmd.ExecuteNonQueryAsync();
                        }
                        foreach (BillingProvider billingProvder in transaction.BillingProvider)
                        {
                            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                            {
                                con.Open();
                                SqlCommand cmd = new SqlCommand("spinsertBillingprovider", con);
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@Fileid", fileid);
                                cmd.Parameters.AddWithValue("@HeaderID", transaction.ST.ST2);
                                cmd.Parameters.AddWithValue("@L2000A_1_HL_1_HL01", billingProvder.HL.HL1);
                                cmd.Parameters.AddWithValue("@L2000A_1_HL_1_HL03", billingProvder.HL.HL3);
                                cmd.Parameters.AddWithValue("@L2000A_1_HL_1_HL04", billingProvder.HL.HL4);
                                cmd.Parameters.AddWithValue("@L2000A_1_PRV_1_PRV01", billingProvder.PRV.PRV1);
                                cmd.Parameters.AddWithValue("@L2000A_1_PRV_1_PRV02", billingProvder.PRV.PRV2);
                                cmd.Parameters.AddWithValue("@L2000A_1_PRV_1_PRV03", billingProvder.PRV.PRV3);
                                cmd.Parameters.AddWithValue("@L2000A_1_CUR_1_CUR01", billingProvder.CUR.CUR1);
                                cmd.Parameters.AddWithValue("@L2000A_1_CUR_1_CUR02", billingProvder.CUR.CUR2);
                                cmd.Parameters.AddWithValue("@L2010AA_1_NM1_1_NM101", billingProvder.billingproviderdetails.NM1.NM11);
                                cmd.Parameters.AddWithValue("@L2010AA_1_NM1_1_NM102", billingProvder.billingproviderdetails.NM1.NM12);
                                cmd.Parameters.AddWithValue("@L2010AA_1_NM1_1_NM103", billingProvder.billingproviderdetails.NM1.NM13);
                                cmd.Parameters.AddWithValue("@L2010AA_1_NM1_1_NM104", billingProvder.billingproviderdetails.NM1.NM14);
                                cmd.Parameters.AddWithValue("@L2010AA_1_NM1_1_NM105", billingProvder.billingproviderdetails.NM1.NM15);
                                cmd.Parameters.AddWithValue("@L2010AA_1_NM1_1_NM107", billingProvder.billingproviderdetails.NM1.NM17);
                                cmd.Parameters.AddWithValue("@L2010AA_1_NM1_1_NM108", billingProvder.billingproviderdetails.NM1.NM18);
                                cmd.Parameters.AddWithValue("@L2010AA_1_NM1_1_NM109", billingProvder.billingproviderdetails.NM1.NM19);
                                cmd.Parameters.AddWithValue("@L2010AA_1_N3_1_N301", billingProvder.billingproviderdetails.N3.N31);
                                cmd.Parameters.AddWithValue("@L2010AA_1_N3_1_N302", billingProvder.billingproviderdetails.N3.N32);
                                cmd.Parameters.AddWithValue("@L2010AA_1_N4_1_N401", billingProvder.billingproviderdetails.N4.N41);
                                cmd.Parameters.AddWithValue("@L2010AA_1_N4_1_N402", billingProvder.billingproviderdetails.N4.N42);
                                cmd.Parameters.AddWithValue("@L2010AA_1_N4_1_N403", billingProvder.billingproviderdetails.N4.N43);
                                cmd.Parameters.AddWithValue("@L2010AA_1_N4_1_N404", billingProvder.billingproviderdetails.N4.N44);
                                cmd.Parameters.AddWithValue("@L2010AA_1_N4_1_N407", billingProvder.billingproviderdetails.N4.N47);
                                for (int i = 0; i < billingProvder.billingproviderdetails.REF.Length && i <= 4; i++)
                                {
                                    switch (billingProvder.billingproviderdetails.REF[i].REF1)
                                    {
                                        case "EI":
                                            cmd.Parameters.AddWithValue("@L2010AA_1_REF_1_REF01", billingProvder.billingproviderdetails.REF[i].REF1);
                                            cmd.Parameters.AddWithValue("@L2010AA_1_REF_1_REF02", billingProvder.billingproviderdetails.REF[i].REF2);
                                            break;
                                        case "SY":
                                            cmd.Parameters.AddWithValue("@L2010AA_1_REF_2_REF01", billingProvder.billingproviderdetails.REF[i].REF1);
                                            cmd.Parameters.AddWithValue("@L2010AA_1_REF_2_REF02", billingProvder.billingproviderdetails.REF[i].REF2);
                                            break;
                                        case "0B":
                                            cmd.Parameters.AddWithValue("@L2010AA_1_REF_3_REF01", billingProvder.billingproviderdetails.REF[i].REF1);
                                            cmd.Parameters.AddWithValue("@L2010AA_1_REF_3_REF02", billingProvder.billingproviderdetails.REF[i].REF2);
                                            break;
                                        case "1G":
                                            cmd.Parameters.AddWithValue("@L2010AA_1_REF_4_REF01", billingProvder.billingproviderdetails.REF[i].REF1);
                                            cmd.Parameters.AddWithValue("@L2010AA_1_REF_4_REF02", billingProvder.billingproviderdetails.REF[i].REF2);
                                            break;
                                    }
                                }
                                for (int i = 0; i < billingProvder.billingproviderdetails.PER.Length && i < 2; i++)
                                {
                                    cmd.Parameters.AddWithValue("@L2010AA_1_PER_" + (i + 1) + "_PER01", billingProvder.billingproviderdetails.PER[i].PER1);
                                    cmd.Parameters.AddWithValue("@L2010AA_1_PER_" + (i + 1) + "_PER02", billingProvder.billingproviderdetails.PER[i].PER2);
                                    cmd.Parameters.AddWithValue("@L2010AA_1_PER_" + (i + 1) + "_PER03", billingProvder.billingproviderdetails.PER[i].PER3);
                                    cmd.Parameters.AddWithValue("@L2010AA_1_PER_" + (i + 1) + "_PER04", billingProvder.billingproviderdetails.PER[i].PER4);
                                    cmd.Parameters.AddWithValue("@L2010AA_1_PER_" + (i + 1) + "_PER05", billingProvder.billingproviderdetails.PER[i].PER5);
                                    cmd.Parameters.AddWithValue("@L2010AA_1_PER_" + (i + 1) + "_PER06", billingProvder.billingproviderdetails.PER[i].PER6);
                                    cmd.Parameters.AddWithValue("@L2010AA_1_PER_" + (i + 1) + "_PER07", billingProvder.billingproviderdetails.PER[i].PER7);
                                    cmd.Parameters.AddWithValue("@L2010AA_1_PER_" + (i + 1) + "_PER08", billingProvder.billingproviderdetails.PER[i].PER8);
                                }
                                cmd.Parameters.AddWithValue("@L2010AB_1_NM1_1_NM101", billingProvder.payToAddress.NM1.NM11);
                                cmd.Parameters.AddWithValue("@L2010AB_1_NM1_1_NM102", billingProvder.payToAddress.NM1.NM12);
                                cmd.Parameters.AddWithValue("@L2010AB_1_N3_1_N301", billingProvder.payToAddress.N3.N31);
                                cmd.Parameters.AddWithValue("@L2010AB_1_N3_1_N302", billingProvder.payToAddress.N3.N32);
                                cmd.Parameters.AddWithValue("@L2010AB_1_N4_1_N401", billingProvder.payToAddress.N4.N41);
                                cmd.Parameters.AddWithValue("@L2010AB_1_N4_1_N402", billingProvder.payToAddress.N4.N42);
                                cmd.Parameters.AddWithValue("@L2010AB_1_N4_1_N403", billingProvder.payToAddress.N4.N43);
                                cmd.Parameters.AddWithValue("@L2010AB_1_N4_1_N404", billingProvder.payToAddress.N4.N44);
                                cmd.Parameters.AddWithValue("@L2010AB_1_N4_1_N407", billingProvder.payToAddress.N4.N47);
                                cmd.Parameters.AddWithValue("@L2010AC_1_NM1_1_NM101", billingProvder.payToPlan.NM1.NM11);
                                cmd.Parameters.AddWithValue("@L2010AC_1_NM1_1_NM102", billingProvder.payToPlan.NM1.NM12);
                                cmd.Parameters.AddWithValue("@L2010AC_1_NM1_1_NM103", billingProvder.payToPlan.NM1.NM13);
                                cmd.Parameters.AddWithValue("@L2010AC_1_NM1_1_NM108", billingProvder.payToPlan.NM1.NM18);
                                cmd.Parameters.AddWithValue("@L2010AC_1_NM1_1_NM109", billingProvder.payToPlan.NM1.NM19);
                                cmd.Parameters.AddWithValue("@L2010AC_1_N3_1_N301", billingProvder.payToPlan.N3.N31);
                                cmd.Parameters.AddWithValue("@L2010AC_1_N3_1_N302", billingProvder.payToPlan.N3.N32);
                                cmd.Parameters.AddWithValue("@L2010AC_1_N4_1_N401", billingProvder.payToPlan.N4.N41);
                                cmd.Parameters.AddWithValue("@L2010AC_1_N4_1_N402", billingProvder.payToPlan.N4.N42);
                                cmd.Parameters.AddWithValue("@L2010AC_1_N4_1_N403", billingProvder.payToPlan.N4.N43);
                                cmd.Parameters.AddWithValue("@L2010AC_1_N4_1_N404", billingProvder.payToPlan.N4.N44);
                                cmd.Parameters.AddWithValue("@L2010AC_1_N4_1_N407", billingProvder.payToPlan.N4.N47);
                                for (int i = 0; i < billingProvder.payToPlan.REF.Length && i < 4; i++)
                                {
                                    switch (billingProvder.payToPlan.REF[i].REF1)
                                    {
                                        case "2U":
                                            cmd.Parameters.AddWithValue("@L2010AC_1_REF_1_REF01", billingProvder.payToPlan.REF[i].REF1);
                                            cmd.Parameters.AddWithValue("@L2010AC_1_REF_1_REF02", billingProvder.payToPlan.REF[i].REF2);
                                            break;
                                        case "FY":
                                            cmd.Parameters.AddWithValue("@L2010AC_1_REF_2_REF01", billingProvder.payToPlan.REF[i].REF1);
                                            cmd.Parameters.AddWithValue("@L2010AC_1_REF_2_REF02", billingProvder.payToPlan.REF[i].REF2);
                                            break;
                                        case "NF":
                                            cmd.Parameters.AddWithValue("@L2010AC_1_REF_3_REF01", billingProvder.payToPlan.REF[i].REF1);
                                            cmd.Parameters.AddWithValue("@L2010AC_1_REF_3_REF02", billingProvder.payToPlan.REF[i].REF2);
                                            break;
                                        case "EI":
                                            cmd.Parameters.AddWithValue("@L2010AC_1_REF_4_REF01", billingProvder.payToPlan.REF[i].REF1);
                                            cmd.Parameters.AddWithValue("@L2010AC_1_REF_4_REF02", billingProvder.payToPlan.REF[i].REF2);
                                            break;
                                    }
                                }
                                await cmd.ExecuteNonQueryAsync();
                            }
                                for (int i = 0; i < billingProvder.subscriber.Length; i++)
                                {
                                    using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                                    {
                                        con.Open();
                                        SqlCommand cmd = new SqlCommand("spinsertsubscriber", con);
                                        cmd.CommandType = CommandType.StoredProcedure;
                                        cmd.Parameters.AddWithValue("@Fileid", fileid);
                                        cmd.Parameters.AddWithValue("@HeaderID", transaction.ST.ST2);
                                        cmd.Parameters.AddWithValue("@L2000B_1_HL_1_HL01", billingProvder.subscriber[i].HL.HL1);
                                        cmd.Parameters.AddWithValue("@L2000B_1_HL_1_HL02", billingProvder.subscriber[i].HL.HL2);
                                        cmd.Parameters.AddWithValue("@L2000B_1_HL_1_HL03", billingProvder.subscriber[i].HL.HL3);
                                        cmd.Parameters.AddWithValue("@L2000B_1_HL_1_HL04", billingProvder.subscriber[i].HL.HL4);
                                        cmd.Parameters.AddWithValue("@L2000B_1_SBR_1_SBR01", billingProvder.subscriber[i].SBR.SBR1);
                                        cmd.Parameters.AddWithValue("@L2000B_1_SBR_1_SBR02", billingProvder.subscriber[i].SBR.SBR2);
                                        cmd.Parameters.AddWithValue("@L2000B_1_SBR_1_SBR03", billingProvder.subscriber[i].SBR.SBR3);
                                        cmd.Parameters.AddWithValue("@L2000B_1_SBR_1_SBR04", billingProvder.subscriber[i].SBR.SBR4);
                                        cmd.Parameters.AddWithValue("@L2000B_1_SBR_1_SBR05", billingProvder.subscriber[i].SBR.SBR4);
                                        cmd.Parameters.AddWithValue("@L2000B_1_SBR_1_SBR09", billingProvder.subscriber[i].SBR.SBR9);
                                        cmd.Parameters.AddWithValue("@L2000B_1_PAT_1_PAT05", billingProvder.subscriber[i].PAT.PAT5);
                                        cmd.Parameters.AddWithValue("@L2000B_1_PAT_1_PAT06", billingProvder.subscriber[i].PAT.PAT6);
                                        cmd.Parameters.AddWithValue("@L2000B_1_PAT_1_PAT07", billingProvder.subscriber[i].PAT.PAT7);
                                        cmd.Parameters.AddWithValue("@L2000B_1_PAT_1_PAT08", billingProvder.subscriber[i].PAT.PAT8);
                                        cmd.Parameters.AddWithValue("@L2000B_1_PAT_1_PAT09", billingProvder.subscriber[i].PAT.PAT9);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_NM1_1_NM101", billingProvder.subscriber[i].SubscriberDetails.NM1.NM11);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_NM1_1_NM102", billingProvder.subscriber[i].SubscriberDetails.NM1.NM12);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_NM1_1_NM103", billingProvder.subscriber[i].SubscriberDetails.NM1.NM13);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_NM1_1_NM104", billingProvder.subscriber[i].SubscriberDetails.NM1.NM14);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_NM1_1_NM105", billingProvder.subscriber[i].SubscriberDetails.NM1.NM15);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_NM1_1_NM107", billingProvder.subscriber[i].SubscriberDetails.NM1.NM17);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_NM1_1_NM108", billingProvder.subscriber[i].SubscriberDetails.NM1.NM18);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_NM1_1_NM109", billingProvder.subscriber[i].SubscriberDetails.NM1.NM19);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_N3_1_N301", billingProvder.subscriber[i].SubscriberDetails.N3.N31);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_N3_1_N302", billingProvder.subscriber[i].SubscriberDetails.N3.N32);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_N4_1_N401", billingProvder.subscriber[i].SubscriberDetails.N4.N41);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_N4_1_N402", billingProvder.subscriber[i].SubscriberDetails.N4.N42);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_N4_1_N403", billingProvder.subscriber[i].SubscriberDetails.N4.N43);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_N4_1_N404", billingProvder.subscriber[i].SubscriberDetails.N4.N44);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_N4_1_N407", billingProvder.subscriber[i].SubscriberDetails.N4.N47);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_DMG_1_DMG01", billingProvder.subscriber[i].SubscriberDetails.DMG.DMG1);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_DMG_1_DMG02", billingProvder.subscriber[i].SubscriberDetails.DMG.DMG2);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_DMG_1_DMG03", billingProvder.subscriber[i].SubscriberDetails.DMG.DMG3);
                                        for (int j = 0; j < billingProvder.subscriber[i].SubscriberDetails.REF.Length && j < 2; j++)
                                        {
                                            switch (billingProvder.subscriber[i].SubscriberDetails.REF[j].REF1)
                                            {
                                                case "SY":
                                                    cmd.Parameters.AddWithValue("@L2010BA_1_REF_1_REF01", billingProvder.subscriber[i].SubscriberDetails.REF[j].REF1);
                                                    cmd.Parameters.AddWithValue("@L2010BA_1_REF_1_REF02", billingProvder.subscriber[i].SubscriberDetails.REF[j].REF2);
                                                    break;
                                                case "Y4":
                                                    cmd.Parameters.AddWithValue("@L2010BA_1_REF_2_REF01", billingProvder.subscriber[i].SubscriberDetails.REF[j].REF1);
                                                    cmd.Parameters.AddWithValue("@L2010BA_1_REF_2_REF02", billingProvder.subscriber[i].SubscriberDetails.REF[j].REF2);
                                                    break;
                                            }
                                        }
                                        cmd.Parameters.AddWithValue("@L2010BA_1_PER_1_PER01", billingProvder.subscriber[i].SubscriberDetails.PER.PER1);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_PER_1_PER02", billingProvder.subscriber[i].SubscriberDetails.PER.PER2);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_PER_1_PER03", billingProvder.subscriber[i].SubscriberDetails.PER.PER3);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_PER_1_PER04", billingProvder.subscriber[i].SubscriberDetails.PER.PER4);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_PER_1_PER05", billingProvder.subscriber[i].SubscriberDetails.PER.PER5);
                                        cmd.Parameters.AddWithValue("@L2010BA_1_PER_1_PER06", billingProvder.subscriber[i].SubscriberDetails.PER.PER6);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_NM1_1_NM101", billingProvder.subscriber[i].payer.NM1.NM11);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_NM1_1_NM102", billingProvder.subscriber[i].payer.NM1.NM12);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_NM1_1_NM103", billingProvder.subscriber[i].payer.NM1.NM13);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_NM1_1_NM108", billingProvder.subscriber[i].payer.NM1.NM18);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_NM1_1_NM109", billingProvder.subscriber[i].payer.NM1.NM19);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_N3_1_N301", billingProvder.subscriber[i].payer.N3.N31);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_N3_1_N302", billingProvder.subscriber[i].payer.N3.N32);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_N4_1_N401", billingProvder.subscriber[i].payer.N4.N41);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_N4_1_N402", billingProvder.subscriber[i].payer.N4.N42);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_N4_1_N403", billingProvder.subscriber[i].payer.N4.N43);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_N4_1_N404", billingProvder.subscriber[i].payer.N4.N44);
                                        cmd.Parameters.AddWithValue("@L2010BB_1_N4_1_N407", billingProvder.subscriber[i].payer.N4.N47);
                                        for (int j = 0; j < billingProvder.subscriber[i].payer.REF.Length && j < 6; j++)
                                        {
                                            switch (billingProvder.subscriber[i].payer.REF[j].REF1)
                                            {
                                                case "2U":
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_1_REF01", billingProvder.subscriber[i].payer.REF[j].REF1);
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_1_REF02", billingProvder.subscriber[i].payer.REF[j].REF2);
                                                    break;
                                                case "EI":
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_2_REF01", billingProvder.subscriber[i].payer.REF[j].REF1);
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_2_REF02", billingProvder.subscriber[i].payer.REF[j].REF2);
                                                    break;
                                                case "FY":
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_3_REF01", billingProvder.subscriber[i].payer.REF[j].REF1);
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_3_REF02", billingProvder.subscriber[i].payer.REF[j].REF2);
                                                    break;
                                                case "NF":
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_4_REF01", billingProvder.subscriber[i].payer.REF[j].REF1);
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_4_REF02", billingProvder.subscriber[i].payer.REF[j].REF2);
                                                    break;
                                                case "G2":
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_5_REF01", billingProvder.subscriber[i].payer.REF[j].REF1);
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_5_REF02", billingProvder.subscriber[i].payer.REF[j].REF2);
                                                    break;
                                                case "LU":
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_6_REF01", billingProvder.subscriber[i].payer.REF[j].REF1);
                                                    cmd.Parameters.AddWithValue("@L2010BB_1_REF_6_REF02", billingProvder.subscriber[i].payer.REF[j].REF2);
                                                    break;
                                            }
                                        }

                                        await cmd.ExecuteNonQueryAsync();
                                    }
                                await insertClaim(billingProvder.subscriber[i].Claim, fileid, transaction, billingProvder.subscriber[i].SubscriberDetails.NM1.NM19, billingProvder.subscriber[i].HL.HL1);
                                    for (int j = 0; j < billingProvder.subscriber[i].patient.Length; j++)
                                    {
                                        using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                                        {
                                            con.Open();
                                            SqlCommand cmd = new SqlCommand("spinsertpatient", con);
                                            cmd.CommandType = CommandType.StoredProcedure;
                                            cmd.Parameters.AddWithValue("@Fileid", fileid);
                                            cmd.Parameters.AddWithValue("@HeaderID", transaction.ST.ST2);
                                            cmd.Parameters.AddWithValue("@L2000C_1_HL_1_HL01", billingProvder.subscriber[i].patient[j].HL.HL1);
                                            cmd.Parameters.AddWithValue("@L2000C_1_HL_1_HL02", billingProvder.subscriber[i].patient[j].HL.HL2);
                                            cmd.Parameters.AddWithValue("@L2000C_1_HL_1_HL03", billingProvder.subscriber[i].patient[j].HL.HL3);
                                            cmd.Parameters.AddWithValue("@L2000C_1_HL_1_HL04", billingProvder.subscriber[i].patient[j].HL.HL4);
                                            cmd.Parameters.AddWithValue("@L2000C_1_PAT_1_PAT01", billingProvder.subscriber[i].patient[j].PAT.PAT1);
                                            cmd.Parameters.AddWithValue("@L2000C_1_PAT_1_PAT05", billingProvder.subscriber[i].patient[j].PAT.PAT5);
                                            cmd.Parameters.AddWithValue("@L2000C_1_PAT_1_PAT06", billingProvder.subscriber[i].patient[j].PAT.PAT6);
                                            cmd.Parameters.AddWithValue("@L2000C_1_PAT_1_PAT07", billingProvder.subscriber[i].patient[j].PAT.PAT7);
                                            cmd.Parameters.AddWithValue("@L2000C_1_PAT_1_PAT08", billingProvder.subscriber[i].patient[j].PAT.PAT8);
                                            cmd.Parameters.AddWithValue("@L2000C_1_PAT_1_PAT09", billingProvder.subscriber[i].patient[j].PAT.PAT9);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_NM1_1_NM101", billingProvder.subscriber[i].patient[j].patientdetails.NM1.NM11);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_NM1_1_NM102", billingProvder.subscriber[i].patient[j].patientdetails.NM1.NM12);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_NM1_1_NM103", billingProvder.subscriber[i].patient[j].patientdetails.NM1.NM13);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_NM1_1_NM104", billingProvder.subscriber[i].patient[j].patientdetails.NM1.NM14);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_NM1_1_NM105", billingProvder.subscriber[i].patient[j].patientdetails.NM1.NM15);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_NM1_1_NM107", billingProvder.subscriber[i].patient[j].patientdetails.NM1.NM17);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_N3_1_N301", billingProvder.subscriber[i].patient[j].patientdetails.N3.N31);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_N3_1_N302", billingProvder.subscriber[i].patient[j].patientdetails.N3.N32);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_N4_1_N401", billingProvder.subscriber[i].patient[j].patientdetails.N4.N41);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_N4_1_N402", billingProvder.subscriber[i].patient[j].patientdetails.N4.N42);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_N4_1_N403", billingProvder.subscriber[i].patient[j].patientdetails.N4.N43);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_N4_1_N404", billingProvder.subscriber[i].patient[j].patientdetails.N4.N44);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_N4_1_N407", billingProvder.subscriber[i].patient[j].patientdetails.N4.N47);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_DMG_1_DMG01", billingProvder.subscriber[i].patient[j].patientdetails.DMG.DMG1);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_DMG_1_DMG02", billingProvder.subscriber[i].patient[j].patientdetails.DMG.DMG2);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_DMG_1_DMG03", billingProvder.subscriber[i].patient[j].patientdetails.DMG.DMG3);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_REF_1_REF01", billingProvder.subscriber[i].patient[j].patientdetails.REF.REF1);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_REF_1_REF02", billingProvder.subscriber[i].patient[j].patientdetails.REF.REF2);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_PER_1_PER01", billingProvder.subscriber[i].patient[j].patientdetails.PER.PER1);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_PER_1_PER02", billingProvder.subscriber[i].patient[j].patientdetails.PER.PER2);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_PER_1_PER03", billingProvder.subscriber[i].patient[j].patientdetails.PER.PER3);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_PER_1_PER04", billingProvder.subscriber[i].patient[j].patientdetails.PER.PER4);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_PER_1_PER05", billingProvder.subscriber[i].patient[j].patientdetails.PER.PER5);
                                            cmd.Parameters.AddWithValue("@L2010CA_1_PER_1_PER06", billingProvder.subscriber[i].patient[j].patientdetails.PER.PER6);
                                            await cmd.ExecuteNonQueryAsync();
                                        }
                                        await insertClaim(billingProvder.subscriber[i].patient[j].Claim, fileid, transaction, billingProvder.subscriber[i].SubscriberDetails.NM1.NM19, billingProvder.subscriber[i].patient[j].HL.HL1);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        async Task insertClaim(Claims[] claims,int fileid,Transaction transaction,string SubscriberId ,string subscriberpatientloopid) {
            for (int k = 0; k < claims.Length; k++)
            {
                string claimid = "-1";
                using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("spinsertclaim", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Fileid", fileid);
                    cmd.Parameters.AddWithValue("@HeaderID", transaction.ST.ST2);
                    cmd.Parameters.AddWithValue("@subscriber_patientid", subscriberpatientloopid);
                    cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM01", claims[k].CLM.CLM1);
                    cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM02", claims[k].CLM.CLM2);
                    if (!string.IsNullOrEmpty(claims[k].CLM.CLM5))
                    {
                        string[] listofClm05 = claims[k].CLM.CLM5.Split(':');
                        for (int l = 0; l < listofClm05.Length && l < 3; l++)
                        {
                            cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM05_" + (l + 1), listofClm05[l]);
                        }
                    }
                    cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM06", claims[k].CLM.CLM6);
                    cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM07", claims[k].CLM.CLM7);
                    cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM08", claims[k].CLM.CLM8);
                    cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM09", claims[k].CLM.CLM9);
                    cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM10", claims[k].CLM.CLM10);
                    if (!string.IsNullOrEmpty(claims[k].CLM.CLM11))
                    {
                        string[] listofClm11 = claims[k].CLM.CLM11.Split(':');
                        for (int l = 0; l < listofClm11.Length; l++)
                        {
                            if (l == 0 || l == 1 || l == 3 || l == 4)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM11_" + (l + 1), listofClm11[l]);
                            }
                        }
                    }
                    cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM12", claims[k].CLM.CLM12);
                    cmd.Parameters.AddWithValue("@L2300_1_CLM_1_CLM20", claims[k].CLM.CLM20);
                    for (int l = 0; l < claims[k].DTP.Length && l < 19; l++)
                    {
                        switch (claims[k].DTP[l].DTP1)
                        {
                            case "431":
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_1_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_1_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_1_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "454":
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_2_DTP01",claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_2_DTP02",claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_2_DTP03",claims[k].DTP[l].DTP3);
                                break;
                            case "304":
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_3_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_3_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_3_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "453":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_4_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_4_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_4_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "439":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_5_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_5_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_5_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "484":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_6_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_6_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_6_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "455":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_7_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_7_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_7_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "471":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_8_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_8_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_8_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "314":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_9_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_9_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_9_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "360":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_10_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_10_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_10_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "361":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_11_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_11_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_11_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "297":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_12_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_12_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_12_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "296":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_13_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_13_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_13_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "435":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_14_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_14_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_14_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "096":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_15_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_15_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_15_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "090":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_16_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_16_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_16_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "091":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_17_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_17_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_17_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "444":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_18_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_18_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_18_DTP03", claims[k].DTP[l].DTP3);
                                break;
                            case "050":

                                cmd.Parameters.AddWithValue("@L2300_1_DTP_19_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_19_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_19_DTP03", claims[k].DTP[l].DTP3);
                                break;
                        }
                    }
                    for (int l = 0; l < claims[k].PWK.Length && l < 10; l++)
                    {
                        cmd.Parameters.AddWithValue("@L2300_1_PWK_"+(l+1)+"_PWK01", claims[k].PWK[l].PWK1);
                        cmd.Parameters.AddWithValue("@L2300_1_PWK_"+(l+1)+"_PWK02", claims[k].PWK[l].PWK2);
                        cmd.Parameters.AddWithValue("@L2300_1_PWK_"+(l+1)+"_PWK06", claims[k].PWK[l].PWK6);
                    }
                    cmd.Parameters.AddWithValue("@L2300_1_CN1_1_CN101", claims[k].CN1.CN11);
                    cmd.Parameters.AddWithValue("@L2300_1_CN1_1_CN102", claims[k].CN1.CN12);
                    cmd.Parameters.AddWithValue("@L2300_1_CN1_1_CN103", claims[k].CN1.CN13);
                    cmd.Parameters.AddWithValue("@L2300_1_CN1_1_CN104", claims[k].CN1.CN14);
                    cmd.Parameters.AddWithValue("@L2300_1_CN1_1_CN105", claims[k].CN1.CN15);
                    cmd.Parameters.AddWithValue("@L2300_1_CN1_1_CN106", claims[k].CN1.CN16);
                    cmd.Parameters.AddWithValue("@L2300_1_AMT_1_AMT01", claims[k].AMT.AMT1);
                    cmd.Parameters.AddWithValue("@L2300_1_AMT_1_AMT02", claims[k].AMT.AMT2);
                    for (int l = 0; l < claims[k].REF.Length; l++)
                    {
                        switch (claims[k].REF[l].REF1)
                        {
                            case "4N":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_1_REF01",claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_1_REF02", claims[k].REF[l].REF2);
                                break;
                            case "F5":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_2_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_2_REF02", claims[k].REF[l].REF2);
                                break;
                            case "EW":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_3_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_3_REF02", claims[k].REF[l].REF2);
                                break;
                            case "9F":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_4_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_4_REF02", claims[k].REF[l].REF2);
                                break;
                            case "G1":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_5_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_5_REF02", claims[k].REF[l].REF2);
                                break;
                            case "F8":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_6_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_6_REF02", claims[k].REF[l].REF2);
                                break;
                            case "X4":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_7_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_7_REF02", claims[k].REF[l].REF2);
                                break;
                            case "9A":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_8_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_8_REF02", claims[k].REF[l].REF2);
                                break;
                            case "9C":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_9_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_9_REF02", claims[k].REF[l].REF2);
                                break;
                            case "LX":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_10_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_10_REF02", claims[k].REF[l].REF2);
                                break;
                            case "D9":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_11_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_11_REF02", claims[k].REF[l].REF2);
                                break;
                            case "EA":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_12_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_12_REF02", claims[k].REF[l].REF2);
                                break;
                            case "P4":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_13_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_13_REF02", claims[k].REF[l].REF2);
                                break;
                            case "1J":
                                cmd.Parameters.AddWithValue("@L2300_1_REF_14_REF01", claims[k].REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2300_1_REF_14_REF02", claims[k].REF[l].REF2);
                                break;
                        }
                    }
                    for (int l = 0; l < claims[k].K3.Length; l++)
                    {
                        cmd.Parameters.AddWithValue("@L2300_1_K3_" + (l + 1) + "_K301", claims[k].K3[l].K31);
                    }
                    cmd.Parameters.AddWithValue("@L2300_1_NTE_1_NTE01", claims[k].NTE.NTE1);
                    cmd.Parameters.AddWithValue("@L2300_1_NTE_1_NTE02", claims[k].NTE.NTE2);
                    cmd.Parameters.AddWithValue("@L2300_1_CR1_1_CR101", claims[k].CR1.CR11);
                    cmd.Parameters.AddWithValue("@L2300_1_CR1_1_CR102", claims[k].CR1.CR12);
                    cmd.Parameters.AddWithValue("@L2300_1_CR1_1_CR104", claims[k].CR1.CR14);
                    cmd.Parameters.AddWithValue("@L2300_1_CR1_1_CR105", claims[k].CR1.CR15);
                    cmd.Parameters.AddWithValue("@L2300_1_CR1_1_CR106", claims[k].CR1.CR16);
                    cmd.Parameters.AddWithValue("@L2300_1_CR1_1_CR109", claims[k].CR1.CR19);
                    cmd.Parameters.AddWithValue("@L2300_1_CR1_1_CR110", claims[k].CR1.CR110);
                    cmd.Parameters.AddWithValue("@L2300_1_CR2_1_CR208", claims[k].CR2.CR28);
                    cmd.Parameters.AddWithValue("@L2300_1_CR2_1_CR210", claims[k].CR2.CR210);
                    cmd.Parameters.AddWithValue("@L2300_1_CR2_1_CR211", claims[k].CR2.CR211);

                    for (int l = 0; l < claims[k].CRC.Length; l++)
                    {
                        if (claims[k].CRC[l].CRC1 == "75")
                        {
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_7_CRC01", claims[k].CRC[l].CRC1);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_7_CRC02", claims[k].CRC[l].CRC2);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_7_CRC03", claims[k].CRC[l].CRC3);
                        }
                        else if (claims[k].CRC[l].CRC1 == "ZZ")
                        {
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_8_CRC01", claims[k].CRC[l].CRC1);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_8_CRC02", claims[k].CRC[l].CRC2);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_8_CRC03", claims[k].CRC[l].CRC3);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_8_CRC04", claims[k].CRC[l].CRC4);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_8_CRC05", claims[k].CRC[l].CRC5);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_" + (l + 1) + "_CRC01", claims[k].CRC[l].CRC1);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_" + (l + 1) + "_CRC02", claims[k].CRC[l].CRC2);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_" + (l + 1) + "_CRC03", claims[k].CRC[l].CRC3);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_" + (l + 1) + "_CRC04", claims[k].CRC[l].CRC4);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_" + (l + 1) + "_CRC05", claims[k].CRC[l].CRC5);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_" + (l + 1) + "_CRC06", claims[k].CRC[l].CRC6);
                            cmd.Parameters.AddWithValue("@L2300_1_CRC_" + (l + 1) + "_CRC07", claims[k].CRC[l].CRC7);
                        }
                    }
                    for (int l = 0; l < claims[k].HI.Length; l++)
                    {
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI1))
                        {
                            string[] hi1Values = claims[k].HI[l].HI1.Split(':');
                            for (int m = 0; m < hi1Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI01_0" + (m + 1), hi1Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI2))
                        {
                            string[] hi2Values = claims[k].HI[l].HI2.Split(':');
                            for (int m = 0; m < hi2Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI02_0" + (m + 1), hi2Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI3))
                        {
                            string[] hi3Values = claims[k].HI[l].HI3.Split(':');
                            for (int m = 0; m < hi3Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI03_0" + (m + 1), hi3Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI4))
                        {
                            string[] hi4Values = claims[k].HI[l].HI4.Split(':');
                            for (int m = 0; m < hi4Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI04_0" + (m + 1), hi4Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI5))
                        {
                            string[] hi5Values = claims[k].HI[l].HI5.Split(':');
                            for (int m = 0; m < hi5Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI05_0" + (m + 1), hi5Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI6))
                        {
                            string[] hi6Values = claims[k].HI[l].HI6.Split(':');
                            for (int m = 0; m < hi6Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI06_0" + (m + 1), hi6Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI7))
                        {
                            string[] hi7Values = claims[k].HI[l].HI7.Split(':');
                            for (int m = 0; m < hi7Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI07_0" + (m + 1), hi7Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI8))
                        {
                            string[] hi8Values = claims[k].HI[l].HI8.Split(':');
                            for (int m = 0; m < hi8Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI08_0" + (m + 1), hi8Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI9))
                        {
                            string[] hi9Values = claims[k].HI[l].HI9.Split(':');
                            for (int m = 0; m < hi9Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI09_0" + (m + 1), hi9Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI10))
                        {
                            string[] hi10Values = claims[k].HI[l].HI10.Split(':');
                            for (int m = 0; m < hi10Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI10_0" + (m + 1), hi10Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI11))
                        {
                            string[] hi11Values = claims[k].HI[l].HI11.Split(':');
                            for (int m = 0; m < hi11Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI11_0" + (m + 1), hi11Values[m]);
                            }
                        }
                        if (!string.IsNullOrEmpty(claims[k].HI[l].HI12))
                        {
                            string[] hi12Values = claims[k].HI[l].HI12.Split(':');
                            for (int m = 0; m < hi12Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2300_1_HI_" + (l + 1) + "_HI12_0" + (m + 1), hi12Values[m]);
                            }
                        }
                    }
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP01", claims[k].HCP.HCP1);
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP02", claims[k].HCP.HCP2);
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP03", claims[k].HCP.HCP3);
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP04", claims[k].HCP.HCP4);
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP05", claims[k].HCP.HCP5);
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP06", claims[k].HCP.HCP6);
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP07", claims[k].HCP.HCP7);
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP13", claims[k].HCP.HCP13);
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP14", claims[k].HCP.HCP14);
                    cmd.Parameters.AddWithValue("@L2300_1_HCP_1_HCP15", claims[k].HCP.HCP15);
                    for (int l = 0; l < claims[k].ReferingProvider.Length; l++)
                    {
                        switch (claims[k].ReferingProvider[l].NM1.NM11) {
                            case "DN":
                                cmd.Parameters.AddWithValue("@L2310A_1_NM1_1_NM101", claims[k].ReferingProvider[l].NM1.NM11);
                                cmd.Parameters.AddWithValue("@L2310A_1_NM1_1_NM102", claims[k].ReferingProvider[l].NM1.NM12);
                                cmd.Parameters.AddWithValue("@L2310A_1_NM1_1_NM103", claims[k].ReferingProvider[l].NM1.NM13);
                                cmd.Parameters.AddWithValue("@L2310A_1_NM1_1_NM104", claims[k].ReferingProvider[l].NM1.NM14);
                                cmd.Parameters.AddWithValue("@L2310A_1_NM1_1_NM105", claims[k].ReferingProvider[l].NM1.NM15);
                                cmd.Parameters.AddWithValue("@L2310A_1_NM1_1_NM107", claims[k].ReferingProvider[l].NM1.NM17);
                                cmd.Parameters.AddWithValue("@L2310A_1_NM1_1_NM108", claims[k].ReferingProvider[l].NM1.NM18);
                                cmd.Parameters.AddWithValue("@L2310A_1_NM1_1_NM109", claims[k].ReferingProvider[l].NM1.NM19);
                                for (int m = 0; m < claims[k].ReferingProvider[l].REF.Length; m++)
                                {
                                    switch (claims[k].ReferingProvider[l].REF[m].REF1) {
                                        case "0B":
                                            cmd.Parameters.AddWithValue("@L2310A_1_REF_1_REF01", claims[k].ReferingProvider[l].REF[m].REF1);
                                            cmd.Parameters.AddWithValue("@L2310A_1_REF_1_REF02", claims[k].ReferingProvider[l].REF[m].REF2);
                                            break;
                                        case "1G":
                                            cmd.Parameters.AddWithValue("@L2310A_1_REF_2_REF01", claims[k].ReferingProvider[l].REF[m].REF1);
                                            cmd.Parameters.AddWithValue("@L2310A_1_REF_2_REF02", claims[k].ReferingProvider[l].REF[m].REF2);
                                            break;
                                        case "G2":
                                            cmd.Parameters.AddWithValue("@L2310A_1_REF_3_REF01", claims[k].ReferingProvider[l].REF[m].REF1);
                                            cmd.Parameters.AddWithValue("@L2310A_1_REF_3_REF02", claims[k].ReferingProvider[l].REF[m].REF2);
                                            break;
                                    }
                                }
                                break;
                            case "P3":
                                cmd.Parameters.AddWithValue("@L2310A_2_NM1_1_NM101", claims[k].ReferingProvider[l].NM1.NM11);
                                cmd.Parameters.AddWithValue("@L2310A_2_NM1_1_NM102", claims[k].ReferingProvider[l].NM1.NM12);
                                cmd.Parameters.AddWithValue("@L2310A_2_NM1_1_NM103", claims[k].ReferingProvider[l].NM1.NM13);
                                cmd.Parameters.AddWithValue("@L2310A_2_NM1_1_NM104", claims[k].ReferingProvider[l].NM1.NM14);
                                cmd.Parameters.AddWithValue("@L2310A_2_NM1_1_NM105", claims[k].ReferingProvider[l].NM1.NM15);
                                cmd.Parameters.AddWithValue("@L2310A_2_NM1_1_NM107", claims[k].ReferingProvider[l].NM1.NM17);
                                cmd.Parameters.AddWithValue("@L2310A_2_NM1_1_NM108", claims[k].ReferingProvider[l].NM1.NM18);
                                cmd.Parameters.AddWithValue("@L2310A_2_NM1_1_NM109", claims[k].ReferingProvider[l].NM1.NM19);
                                for (int m = 0; m < claims[k].ReferingProvider[l].REF.Length; m++)
                                {
                                    switch (claims[k].ReferingProvider[l].REF[m].REF1)
                                    {
                                        case "0B":
                                            cmd.Parameters.AddWithValue("@L2310A_2_REF_1_REF01", claims[k].ReferingProvider[l].REF[m].REF1);
                                            cmd.Parameters.AddWithValue("@L2310A_2_REF_1_REF02", claims[k].ReferingProvider[l].REF[m].REF2);
                                            break;
                                        case "1G":
                                            cmd.Parameters.AddWithValue("@L2310A_2_REF_2_REF01", claims[k].ReferingProvider[l].REF[m].REF1);
                                            cmd.Parameters.AddWithValue("@L2310A_2_REF_2_REF02", claims[k].ReferingProvider[l].REF[m].REF2);
                                            break;
                                        case "G2":
                                            cmd.Parameters.AddWithValue("@L2310A_2_REF_3_REF01", claims[k].ReferingProvider[l].REF[m].REF1);
                                            cmd.Parameters.AddWithValue("@L2310A_2_REF_3_REF02", claims[k].ReferingProvider[l].REF[m].REF2);
                                            break;
                                    }
                                }
                                break;
                        }
                    }
                    cmd.Parameters.AddWithValue("@L2310B_1_NM1_1_NM101", claims[k].RenderingProvider.NM1.NM11);
                    cmd.Parameters.AddWithValue("@L2310B_1_NM1_1_NM102", claims[k].RenderingProvider.NM1.NM12);
                    cmd.Parameters.AddWithValue("@L2310B_1_NM1_1_NM103", claims[k].RenderingProvider.NM1.NM13);
                    cmd.Parameters.AddWithValue("@L2310B_1_NM1_1_NM104", claims[k].RenderingProvider.NM1.NM14);
                    cmd.Parameters.AddWithValue("@L2310B_1_NM1_1_NM105", claims[k].RenderingProvider.NM1.NM15);
                    cmd.Parameters.AddWithValue("@L2310B_1_NM1_1_NM107", claims[k].RenderingProvider.NM1.NM17);
                    cmd.Parameters.AddWithValue("@L2310B_1_NM1_1_NM108", claims[k].RenderingProvider.NM1.NM18);
                    cmd.Parameters.AddWithValue("@L2310B_1_NM1_1_NM109", claims[k].RenderingProvider.NM1.NM19);
                    cmd.Parameters.AddWithValue("@L2310B_1_PRV_1_PRV01", claims[k].RenderingProvider.PRV.PRV1);
                    cmd.Parameters.AddWithValue("@L2310B_1_PRV_1_PRV02", claims[k].RenderingProvider.PRV.PRV2);
                    cmd.Parameters.AddWithValue("@L2310B_1_PRV_1_PRV03", claims[k].RenderingProvider.PRV.PRV3);
                    for (int l = 0; l < claims[k].RenderingProvider.REF.Length; l++)
                    {
                        switch (claims[k].RenderingProvider.REF[l].REF1) {
                            case "0B":
                                cmd.Parameters.AddWithValue("@L2310B_1_REF_1_REF01", claims[k].RenderingProvider.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310B_1_REF_1_REF02", claims[k].RenderingProvider.REF[l].REF2);
                                break;
                            case "1G":
                                cmd.Parameters.AddWithValue("@L2310B_1_REF_2_REF01", claims[k].RenderingProvider.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310B_1_REF_2_REF02", claims[k].RenderingProvider.REF[l].REF2);

                                break;
                            case "G2":
                                cmd.Parameters.AddWithValue("@L2310B_1_REF_3_REF01", claims[k].RenderingProvider.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310B_1_REF_3_REF02", claims[k].RenderingProvider.REF[l].REF2);

                                break;
                            case "LU":
                                cmd.Parameters.AddWithValue("@L2310B_1_REF_4_REF01", claims[k].RenderingProvider.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310B_1_REF_4_REF02", claims[k].RenderingProvider.REF[l].REF2);

                                break;
                        }
                    }
                    cmd.Parameters.AddWithValue("@L2310C_1_NM1_1_NM101", claims[k].ServiceFacilityLocation.NM1.NM11);
                    cmd.Parameters.AddWithValue("@L2310C_1_NM1_1_NM102", claims[k].ServiceFacilityLocation.NM1.NM12);
                    cmd.Parameters.AddWithValue("@L2310C_1_NM1_1_NM103", claims[k].ServiceFacilityLocation.NM1.NM13);
                    cmd.Parameters.AddWithValue("@L2310C_1_NM1_1_NM108", claims[k].ServiceFacilityLocation.NM1.NM18);
                    cmd.Parameters.AddWithValue("@L2310C_1_NM1_1_NM109", claims[k].ServiceFacilityLocation.NM1.NM19);
                    cmd.Parameters.AddWithValue("@L2310C_1_N3_1_N301", claims[k].ServiceFacilityLocation.N3.N31);
                    cmd.Parameters.AddWithValue("@L2310C_1_N3_1_N302", claims[k].ServiceFacilityLocation.N3.N32);
                    cmd.Parameters.AddWithValue("@L2310C_1_N4_1_N401", claims[k].ServiceFacilityLocation.N4.N41);
                    cmd.Parameters.AddWithValue("@L2310C_1_N4_1_N402", claims[k].ServiceFacilityLocation.N4.N42);
                    cmd.Parameters.AddWithValue("@L2310C_1_N4_1_N403", claims[k].ServiceFacilityLocation.N4.N43);
                    cmd.Parameters.AddWithValue("@L2310C_1_N4_1_N404", claims[k].ServiceFacilityLocation.N4.N44);
                    cmd.Parameters.AddWithValue("@L2310C_1_N4_1_N407", claims[k].ServiceFacilityLocation.N4.N47);
                    cmd.Parameters.AddWithValue("@L2310C_1_PER_1_PER01", claims[k].ServiceFacilityLocation.PER.PER1);
                    cmd.Parameters.AddWithValue("@L2310C_1_PER_1_PER02", claims[k].ServiceFacilityLocation.PER.PER2);
                    cmd.Parameters.AddWithValue("@L2310C_1_PER_1_PER03", claims[k].ServiceFacilityLocation.PER.PER3);
                    cmd.Parameters.AddWithValue("@L2310C_1_PER_1_PER04", claims[k].ServiceFacilityLocation.PER.PER4);
                    cmd.Parameters.AddWithValue("@L2310C_1_PER_1_PER05", claims[k].ServiceFacilityLocation.PER.PER5);
                    cmd.Parameters.AddWithValue("@L2310C_1_PER_1_PER06", claims[k].ServiceFacilityLocation.PER.PER6);
                    for (int l = 0; l < claims[k].ServiceFacilityLocation.REF.Length && l<3; l++)
                    {
                        switch (claims[k].ServiceFacilityLocation.REF[l].REF1) {
                            case "0B":
                                cmd.Parameters.AddWithValue("@L2310C_1_REF_1_REF01", claims[k].ServiceFacilityLocation.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310C_1_REF_1_REF02", claims[k].ServiceFacilityLocation.REF[l].REF2);
                                break;
                            case "G2":
                                cmd.Parameters.AddWithValue("@L2310C_1_REF_2_REF01", claims[k].ServiceFacilityLocation.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310C_1_REF_2_REF02", claims[k].ServiceFacilityLocation.REF[l].REF2);
                                break;
                            case "LU":
                                cmd.Parameters.AddWithValue("@L2310C_1_REF_3_REF01", claims[k].ServiceFacilityLocation.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310C_1_REF_3_REF02", claims[k].ServiceFacilityLocation.REF[l].REF2);
                                break;
                        }
                        
                    }
                    cmd.Parameters.AddWithValue("@L2310D_1_NM1_1_NM101", claims[k].supervicingProvider.NM1.NM11);
                    cmd.Parameters.AddWithValue("@L2310D_1_NM1_1_NM102", claims[k].supervicingProvider.NM1.NM12);
                    cmd.Parameters.AddWithValue("@L2310D_1_NM1_1_NM103", claims[k].supervicingProvider.NM1.NM13);
                    cmd.Parameters.AddWithValue("@L2310D_1_NM1_1_NM104", claims[k].supervicingProvider.NM1.NM14);
                    cmd.Parameters.AddWithValue("@L2310D_1_NM1_1_NM105", claims[k].supervicingProvider.NM1.NM15);
                    cmd.Parameters.AddWithValue("@L2310D_1_NM1_1_NM107", claims[k].supervicingProvider.NM1.NM17);
                    cmd.Parameters.AddWithValue("@L2310D_1_NM1_1_NM108", claims[k].supervicingProvider.NM1.NM18);
                    cmd.Parameters.AddWithValue("@L2310D_1_NM1_1_NM109", claims[k].supervicingProvider.NM1.NM19);
                    for (int l = 0; l < claims[k].supervicingProvider.REF.Length; l++)
                    {
                        switch (claims[k].supervicingProvider.REF[l].REF1) {
                            case "0B":
                                cmd.Parameters.AddWithValue("@L2310D_1_REF_1_REF01", claims[k].supervicingProvider.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310D_1_REF_1_REF02", claims[k].supervicingProvider.REF[l].REF2);
                                break;
                            case "1G":
                                cmd.Parameters.AddWithValue("@L2310D_1_REF_2_REF01", claims[k].supervicingProvider.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310D_1_REF_2_REF02", claims[k].supervicingProvider.REF[l].REF2);
                                break;
                            case "G2":
                                cmd.Parameters.AddWithValue("@L2310D_1_REF_3_REF01", claims[k].supervicingProvider.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310D_1_REF_3_REF02", claims[k].supervicingProvider.REF[l].REF2);
                                break;
                            case "LU":
                                cmd.Parameters.AddWithValue("@L2310D_1_REF_4_REF01", claims[k].supervicingProvider.REF[l].REF1);
                                cmd.Parameters.AddWithValue("@L2310D_1_REF_4_REF02", claims[k].supervicingProvider.REF[l].REF2);
                                break;
                        }
                        
                    }
                    cmd.Parameters.AddWithValue("@L2310E_1_NM1_1_NM101", claims[k].AmbulancePickupLocation.NM1.NM11);
                    cmd.Parameters.AddWithValue("@L2310E_1_NM1_1_NM102", claims[k].AmbulancePickupLocation.NM1.NM12);
                    cmd.Parameters.AddWithValue("@L2310E_1_N3_1_N301", claims[k].AmbulancePickupLocation.N3.N31);
                    cmd.Parameters.AddWithValue("@L2310E_1_N3_1_N302", claims[k].AmbulancePickupLocation.N3.N32);
                    cmd.Parameters.AddWithValue("@L2310E_1_N4_1_N401", claims[k].AmbulancePickupLocation.N4.N41);
                    cmd.Parameters.AddWithValue("@L2310E_1_N4_1_N402", claims[k].AmbulancePickupLocation.N4.N42);
                    cmd.Parameters.AddWithValue("@L2310E_1_N4_1_N404", claims[k].AmbulancePickupLocation.N4.N44);
                    cmd.Parameters.AddWithValue("@L2310E_1_N4_1_N403", claims[k].AmbulancePickupLocation.N4.N43);
                    cmd.Parameters.AddWithValue("@L2310E_1_N4_1_N407", claims[k].AmbulancePickupLocation.N4.N47);
                    cmd.Parameters.AddWithValue("@L2310F_1_NM1_1_NM101", claims[k].AmbulanceDropLocation.NM1.NM11);
                    cmd.Parameters.AddWithValue("@L2310F_1_NM1_1_NM102", claims[k].AmbulanceDropLocation.NM1.NM12);
                    cmd.Parameters.AddWithValue("@L2310F_1_NM1_1_NM103", claims[k].AmbulanceDropLocation.NM1.NM13);
                    cmd.Parameters.AddWithValue("@L2310F_1_N3_1_N301", claims[k].AmbulanceDropLocation.N3.N31);
                    cmd.Parameters.AddWithValue("@L2310F_1_N3_1_N302", claims[k].AmbulanceDropLocation.N3.N32);
                    cmd.Parameters.AddWithValue("@L2310F_1_N4_1_N401", claims[k].AmbulanceDropLocation.N4.N41);
                    cmd.Parameters.AddWithValue("@L2310F_1_N4_1_N402", claims[k].AmbulanceDropLocation.N4.N42);
                    cmd.Parameters.AddWithValue("@L2310F_1_N4_1_N404", claims[k].AmbulanceDropLocation.N4.N44);
                    cmd.Parameters.AddWithValue("@L2310F_1_N4_1_N403", claims[k].AmbulanceDropLocation.N4.N43);
                    cmd.Parameters.AddWithValue("@L2310F_1_N4_1_N407", claims[k].AmbulanceDropLocation.N4.N47);
                    //try
                    //{
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            foreach (IDataRecord r in reader)
                            {
                                claimid = "" + r["claimid"];
                            }
                        }
                    //}
                    //catch (Exception e)
                    //{
                    //    Console.WriteLine(e);
                    //}
                }
                for (int l = 0; l < claims[k].otherSubscriberDetails.Length; l++)
                {
                    using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("spinsertothersubscriber", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@claimid", claimid);
                        cmd.Parameters.AddWithValue("@Fileid", fileid);
                        cmd.Parameters.AddWithValue("@HeaderID", transaction.ST.ST2);
                        cmd.Parameters.AddWithValue("@subscriber_patientid", subscriberpatientloopid);
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR01", claims[k].otherSubscriberDetails[l].SBR.SBR1);
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR02", claims[k].otherSubscriberDetails[l].SBR.SBR2);
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR03",claims[k].otherSubscriberDetails[l].SBR.SBR3);
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR04",claims[k].otherSubscriberDetails[l].SBR.SBR4);
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR05",claims[k].otherSubscriberDetails[l].SBR.SBR5);
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR09", claims[k].otherSubscriberDetails[l].SBR.SBR9);
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].CAS.Length && m < 5; m++) {
                            switch (claims[k].otherSubscriberDetails[l].CAS[m].CAS1) {
                                case "CO":
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS01", claims[k].otherSubscriberDetails[l].CAS[m].CAS1);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS02", claims[k].otherSubscriberDetails[l].CAS[m].CAS2);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS03", claims[k].otherSubscriberDetails[l].CAS[m].CAS3);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS04", claims[k].otherSubscriberDetails[l].CAS[m].CAS4);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS05", claims[k].otherSubscriberDetails[l].CAS[m].CAS5);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS06", claims[k].otherSubscriberDetails[l].CAS[m].CAS6);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS07", claims[k].otherSubscriberDetails[l].CAS[m].CAS7);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS08", claims[k].otherSubscriberDetails[l].CAS[m].CAS8);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS09", claims[k].otherSubscriberDetails[l].CAS[m].CAS9);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS10", claims[k].otherSubscriberDetails[l].CAS[m].CAS10);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS11", claims[k].otherSubscriberDetails[l].CAS[m].CAS11);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS12", claims[k].otherSubscriberDetails[l].CAS[m].CAS12);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS13", claims[k].otherSubscriberDetails[l].CAS[m].CAS13);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS14", claims[k].otherSubscriberDetails[l].CAS[m].CAS14);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS15", claims[k].otherSubscriberDetails[l].CAS[m].CAS15);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS16", claims[k].otherSubscriberDetails[l].CAS[m].CAS16);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS17", claims[k].otherSubscriberDetails[l].CAS[m].CAS17);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS18", claims[k].otherSubscriberDetails[l].CAS[m].CAS18);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_1_CAS19", claims[k].otherSubscriberDetails[l].CAS[m].CAS19);
                                  break;
                                case "CR":
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS01", claims[k].otherSubscriberDetails[l].CAS[m].CAS1);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS02", claims[k].otherSubscriberDetails[l].CAS[m].CAS2);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS03", claims[k].otherSubscriberDetails[l].CAS[m].CAS3);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS04", claims[k].otherSubscriberDetails[l].CAS[m].CAS4);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS05", claims[k].otherSubscriberDetails[l].CAS[m].CAS5);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS06", claims[k].otherSubscriberDetails[l].CAS[m].CAS6);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS07", claims[k].otherSubscriberDetails[l].CAS[m].CAS7);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS08", claims[k].otherSubscriberDetails[l].CAS[m].CAS8);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS09", claims[k].otherSubscriberDetails[l].CAS[m].CAS9);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS10", claims[k].otherSubscriberDetails[l].CAS[m].CAS10);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS11", claims[k].otherSubscriberDetails[l].CAS[m].CAS11);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS12", claims[k].otherSubscriberDetails[l].CAS[m].CAS12);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS13", claims[k].otherSubscriberDetails[l].CAS[m].CAS13);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS14", claims[k].otherSubscriberDetails[l].CAS[m].CAS14);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS15", claims[k].otherSubscriberDetails[l].CAS[m].CAS15);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS16", claims[k].otherSubscriberDetails[l].CAS[m].CAS16);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS17", claims[k].otherSubscriberDetails[l].CAS[m].CAS17);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS18", claims[k].otherSubscriberDetails[l].CAS[m].CAS18);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_2_CAS19", claims[k].otherSubscriberDetails[l].CAS[m].CAS19);
                                    break;
                                case "OA":
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS01", claims[k].otherSubscriberDetails[l].CAS[m].CAS1);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS02", claims[k].otherSubscriberDetails[l].CAS[m].CAS2);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS03", claims[k].otherSubscriberDetails[l].CAS[m].CAS3);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS04", claims[k].otherSubscriberDetails[l].CAS[m].CAS4);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS05", claims[k].otherSubscriberDetails[l].CAS[m].CAS5);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS06", claims[k].otherSubscriberDetails[l].CAS[m].CAS6);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS07", claims[k].otherSubscriberDetails[l].CAS[m].CAS7);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS08", claims[k].otherSubscriberDetails[l].CAS[m].CAS8);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS09", claims[k].otherSubscriberDetails[l].CAS[m].CAS9);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS10", claims[k].otherSubscriberDetails[l].CAS[m].CAS10);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS11", claims[k].otherSubscriberDetails[l].CAS[m].CAS11);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS12", claims[k].otherSubscriberDetails[l].CAS[m].CAS12);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS13", claims[k].otherSubscriberDetails[l].CAS[m].CAS13);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS14", claims[k].otherSubscriberDetails[l].CAS[m].CAS14);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS15", claims[k].otherSubscriberDetails[l].CAS[m].CAS15);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS16", claims[k].otherSubscriberDetails[l].CAS[m].CAS16);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS17", claims[k].otherSubscriberDetails[l].CAS[m].CAS17);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS18", claims[k].otherSubscriberDetails[l].CAS[m].CAS18);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_3_CAS19", claims[k].otherSubscriberDetails[l].CAS[m].CAS19);
                                    break;
                                case "PI":
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS01", claims[k].otherSubscriberDetails[l].CAS[m].CAS1);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS02", claims[k].otherSubscriberDetails[l].CAS[m].CAS2);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS03", claims[k].otherSubscriberDetails[l].CAS[m].CAS3);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS04", claims[k].otherSubscriberDetails[l].CAS[m].CAS4);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS05", claims[k].otherSubscriberDetails[l].CAS[m].CAS5);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS06", claims[k].otherSubscriberDetails[l].CAS[m].CAS6);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS07", claims[k].otherSubscriberDetails[l].CAS[m].CAS7);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS08", claims[k].otherSubscriberDetails[l].CAS[m].CAS8);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS09", claims[k].otherSubscriberDetails[l].CAS[m].CAS9);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS10", claims[k].otherSubscriberDetails[l].CAS[m].CAS10);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS11", claims[k].otherSubscriberDetails[l].CAS[m].CAS11);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS12", claims[k].otherSubscriberDetails[l].CAS[m].CAS12);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS13", claims[k].otherSubscriberDetails[l].CAS[m].CAS13);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS14", claims[k].otherSubscriberDetails[l].CAS[m].CAS14);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS15", claims[k].otherSubscriberDetails[l].CAS[m].CAS15);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS16", claims[k].otherSubscriberDetails[l].CAS[m].CAS16);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS17", claims[k].otherSubscriberDetails[l].CAS[m].CAS17);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS18", claims[k].otherSubscriberDetails[l].CAS[m].CAS18);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_4_CAS19", claims[k].otherSubscriberDetails[l].CAS[m].CAS19);
                                    break;
                                case "PR":

                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS01", claims[k].otherSubscriberDetails[l].CAS[m].CAS1);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS02", claims[k].otherSubscriberDetails[l].CAS[m].CAS2);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS03", claims[k].otherSubscriberDetails[l].CAS[m].CAS3);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS04", claims[k].otherSubscriberDetails[l].CAS[m].CAS4);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS05", claims[k].otherSubscriberDetails[l].CAS[m].CAS5);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS06", claims[k].otherSubscriberDetails[l].CAS[m].CAS6);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS07", claims[k].otherSubscriberDetails[l].CAS[m].CAS7);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS08", claims[k].otherSubscriberDetails[l].CAS[m].CAS8);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS09", claims[k].otherSubscriberDetails[l].CAS[m].CAS9);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS10", claims[k].otherSubscriberDetails[l].CAS[m].CAS10);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS11", claims[k].otherSubscriberDetails[l].CAS[m].CAS11);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS12", claims[k].otherSubscriberDetails[l].CAS[m].CAS12);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS13", claims[k].otherSubscriberDetails[l].CAS[m].CAS13);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS14", claims[k].otherSubscriberDetails[l].CAS[m].CAS14);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS15", claims[k].otherSubscriberDetails[l].CAS[m].CAS15);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS16", claims[k].otherSubscriberDetails[l].CAS[m].CAS16);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS17", claims[k].otherSubscriberDetails[l].CAS[m].CAS17);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS18", claims[k].otherSubscriberDetails[l].CAS[m].CAS18);
                                    cmd.Parameters.AddWithValue("@L2320_1_CAS_5_CAS19", claims[k].otherSubscriberDetails[l].CAS[m].CAS19);
                                    break;
                            }
                        }
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].AMT.Length && m < 3; m++)
                        {
                            switch (claims[k].otherSubscriberDetails[l].AMT[m].AMT1)
                            {
                                case "D":
                                        cmd.Parameters.AddWithValue("@L2320_1_AMT_1_AMT01", claims[k].otherSubscriberDetails[l].AMT[m].AMT1);
                                        cmd.Parameters.AddWithValue("@L2320_1_AMT_1_AMT02", claims[k].otherSubscriberDetails[l].AMT[m].AMT2);
                                    break;

                                case "AB":
                                    cmd.Parameters.AddWithValue("@L2320_1_AMT_2_AMT01", claims[k].otherSubscriberDetails[l].AMT[m].AMT1);
                                    cmd.Parameters.AddWithValue("@L2320_1_AMT_2_AMT02", claims[k].otherSubscriberDetails[l].AMT[m].AMT2);
                                    break;
                                case "EAF":
                                    cmd.Parameters.AddWithValue("@L2320_1_AMT_3_AMT01", claims[k].otherSubscriberDetails[l].AMT[m].AMT1);
                                    cmd.Parameters.AddWithValue("@L2320_1_AMT_3_AMT02", claims[k].otherSubscriberDetails[l].AMT[m].AMT2);
                                    break;
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2320_1_OI_1_OI03",claims[k].otherSubscriberDetails[l].OI.OI3);
                        cmd.Parameters.AddWithValue("@L2320_1_OI_1_OI04",claims[k].otherSubscriberDetails[l].OI.OI4);
                        cmd.Parameters.AddWithValue("@L2320_1_OI_1_OI06", claims[k].otherSubscriberDetails[l].OI.OI6);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA01", claims[k].otherSubscriberDetails[l].MOA.MOA1);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA02",claims[k].otherSubscriberDetails[l].MOA.MOA2);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA03",claims[k].otherSubscriberDetails[l].MOA.MOA3);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA04",claims[k].otherSubscriberDetails[l].MOA.MOA4);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA05",claims[k].otherSubscriberDetails[l].MOA.MOA5);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA06",claims[k].otherSubscriberDetails[l].MOA.MOA6);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA07",claims[k].otherSubscriberDetails[l].MOA.MOA7);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA08",claims[k].otherSubscriberDetails[l].MOA.MOA8);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA09", claims[k].otherSubscriberDetails[l].MOA.MOA9);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM101",claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM102",claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM103",claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM13);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM104",claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM14);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM105",claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM15);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM107",claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM17);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM108",claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM18);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM109", claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM19);
                        cmd.Parameters.AddWithValue("@L2330A_1_N3_1_N301",claims[k].otherSubscriberDetails[l].otherSubscriber.N3.N31);
                        cmd.Parameters.AddWithValue("@L2330A_1_N3_1_N302",claims[k].otherSubscriberDetails[l].otherSubscriber.N3.N32);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N401",claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N41);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N402",claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N42);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N403",claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N43);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N404", claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N44);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N407", claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N47);
                        cmd.Parameters.AddWithValue("@L2330A_1_REF_1_REF01", claims[k].otherSubscriberDetails[l].otherSubscriber.REF.REF1);
                        cmd.Parameters.AddWithValue("@L2330A_1_REF_1_REF02", claims[k].otherSubscriberDetails[l].otherSubscriber.REF.REF2);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM101", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM102", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM103", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM13);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM108", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM18);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM109", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM19);
                        cmd.Parameters.AddWithValue("@L2330B_1_N3_1_N301",claims[k].otherSubscriberDetails[l].otherPayerName.N3.N31);
                        cmd.Parameters.AddWithValue("@L2330B_1_N3_1_N302",claims[k].otherSubscriberDetails[l].otherPayerName.N3.N32);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N401",claims[k].otherSubscriberDetails[l].otherPayerName.N4.N41);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N402",claims[k].otherSubscriberDetails[l].otherPayerName.N4.N42);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N403",claims[k].otherSubscriberDetails[l].otherPayerName.N4.N43);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N404",claims[k].otherSubscriberDetails[l].otherPayerName.N4.N44);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N407", claims[k].otherSubscriberDetails[l].otherPayerName.N4.N47);
                        cmd.Parameters.AddWithValue("@L2330B_1_DTP_1_DTP01",claims[k].otherSubscriberDetails[l].otherPayerName.DTP.DTP1);
                        cmd.Parameters.AddWithValue("@L2330B_1_DTP_1_DTP02", claims[k].otherSubscriberDetails[l].otherPayerName.DTP.DTP2);
                        cmd.Parameters.AddWithValue("@L2330B_1_DTP_1_DTP03", claims[k].otherSubscriberDetails[l].otherPayerName.DTP.DTP3);
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].otherPayerName.REF.Length && m < 8; m++) {
                            switch (claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF1) {
                                case "2U":
                                    cmd.Parameters.AddWithValue("@L2330B_1_REF_1_REF01", claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330B_1_REF_1_REF02", claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF2);
                                    break;
                                case "EI":
                                    cmd.Parameters.AddWithValue("@L2330B_1_REF_2_REF01", claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330B_1_REF_2_REF02", claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF2);
                                    break;
                                case "FY":
                                    cmd.Parameters.AddWithValue("@L2330B_1_REF_3_REF01", claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330B_1_REF_3_REF02", claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF2);
                                    break;
                                case "NF":
                                    cmd.Parameters.AddWithValue("@L2330B_1_REF_4_REF01", claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330B_1_REF_4_REF02", claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF2);
                                    break;
                            }
                        }
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].otherPayerReferingProvider.Length && m < 2; m++)
                        {
                            switch (claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].NM1.NM11) {
                                case "DN":
                                    cmd.Parameters.AddWithValue("@L2330C_1_NM1_1_NM101", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].NM1.NM11);
                                    cmd.Parameters.AddWithValue("@L2330C_1_NM1_1_NM102", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].NM1.NM12);
                                    for (int n = 0; n < claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF.Length && n < 3; n++)
                                    {
                                        switch (claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF1)
                                        {
                                            case "0B":
                                                cmd.Parameters.AddWithValue("@L2330C_1_REF_1_REF01", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF1);
                                                cmd.Parameters.AddWithValue("@L2330C_1_REF_1_REF02", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF2);
                                                break;
                                            case "1G":
                                                cmd.Parameters.AddWithValue("@L2330C_1_REF_2_REF01", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF1);
                                                cmd.Parameters.AddWithValue("@L2330C_1_REF_2_REF02", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF2);
                                                break;
                                            case "G2":
                                                cmd.Parameters.AddWithValue("@L2330C_1_REF_3_REF01", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF1);
                                                cmd.Parameters.AddWithValue("@L2330C_1_REF_3_REF02", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF2);
                                                break;
                                        }
                                    }
                                        break;
                                case "P3":
                                    cmd.Parameters.AddWithValue("@L2330C_2_NM1_1_NM101", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].NM1.NM11);
                                    cmd.Parameters.AddWithValue("@L2330C_2_NM1_1_NM102", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].NM1.NM12);
                                    for (int n = 0; n < claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF.Length && n < 3; n++)
                                    {
                                        switch (claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF1)
                                        {
                                            case "0B":
                                                cmd.Parameters.AddWithValue("@L2330C_2_REF_1_REF01", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF1);
                                                cmd.Parameters.AddWithValue("@L2330C_2_REF_1_REF02", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF2);
                                                break;
                                            case "1G":
                                                cmd.Parameters.AddWithValue("@L2330C_2_REF_2_REF01", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF1);
                                                cmd.Parameters.AddWithValue("@L2330C_2_REF_2_REF02", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF2);
                                                break;
                                            case "G2":
                                                cmd.Parameters.AddWithValue("@L2330C_2_REF_3_REF01", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF1);
                                                cmd.Parameters.AddWithValue("@L2330C_2_REF_3_REF02", claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].REF[n].REF2);
                                                break;
                                        }
                                    }
                                    break;
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2330D_1_NM1_1_NM101", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330D_1_NM1_1_NM102", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.NM1.NM12);
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF.Length && m < 4; m++)
                        {
                            switch (claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF1) {
                                case "0B":
                                    cmd.Parameters.AddWithValue("@L2330D_1_REF_1_REF01", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330D_1_REF_1_REF02", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF2);
                                    break;
                                case "1G":
                                    cmd.Parameters.AddWithValue("@L2330D_1_REF_2_REF01", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330D_1_REF_2_REF02", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF2);
                                    break;
                                case "G2":
                                    cmd.Parameters.AddWithValue("@L2330D_1_REF_3_REF01", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330D_1_REF_3_REF02", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF2);
                                    break;
                                case "LU":
                                    cmd.Parameters.AddWithValue("@L2330D_1_REF_4_REF01", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330D_1_REF_4_REF02", claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF2);
                                    break;
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2330E_1_NM1_1_NM101",claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330E_1_NM1_1_NM102",claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.NM1.NM12);
                        for(int m=0;m< claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF.Length && m < 3; m++)
                        {
                            switch (claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF[m].REF1) {
                                case "0B":
                                    cmd.Parameters.AddWithValue("@L2330E_1_REF_1_REF01", claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330E_1_REF_1_REF02", claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF[m].REF2);
                                    break;
                                case "G2":
                                    cmd.Parameters.AddWithValue("@L2330E_1_REF_2_REF01", claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330E_1_REF_2_REF02", claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF[m].REF2);
                                    break;
                                case "LU":
                                    cmd.Parameters.AddWithValue("@L2330E_1_REF_3_REF01", claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330E_1_REF_3_REF02", claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF[m].REF2);
                                    break;
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2330F_1_NM1_1_NM101",claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330F_1_NM1_1_NM102",claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.NM1.NM12);
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF.Length && m < 4; m++) {
                            switch (claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF[m].REF1)
                            {
                                case "0B":
                                    cmd.Parameters.AddWithValue("@L2330F_1_REF_1_REF01", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330F_1_REF_1_REF02", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF[m].REF2);
                                    break;
                                case "1G":
                                    cmd.Parameters.AddWithValue("@L2330F_1_REF_2_REF01", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330F_1_REF_2_REF02", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF[m].REF2);
                                    break;
                                case "G2":
                                    cmd.Parameters.AddWithValue("@L2330F_1_REF_3_REF01", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330F_1_REF_3_REF02", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF[m].REF2);
                                    break;
                                case "LU":
                                    cmd.Parameters.AddWithValue("@L2330F_1_REF_4_REF01", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330F_1_REF_4_REF02", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF[m].REF2);
                                    break;
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2330G_1_NM1_1_NM101", claims[k].otherSubscriberDetails[l].otherPayerBillingProvider.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330G_1_NM1_1_NM102", claims[k].otherSubscriberDetails[l].otherPayerBillingProvider.NM1.NM12);
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].otherPayerBillingProvider.REF.Length && m < 2; m++)
                        {
                            switch (claims[k].otherSubscriberDetails[l].otherPayerBillingProvider.REF[m].REF1)
                            {
                                case "G2":
                                    cmd.Parameters.AddWithValue("@L2330G_1_REF_1_REF01", claims[k].otherSubscriberDetails[l].otherPayerBillingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330G_1_REF_1_REF02", claims[k].otherSubscriberDetails[l].otherPayerBillingProvider.REF[m].REF2);
                                    break;
                                case "LU":
                                    cmd.Parameters.AddWithValue("@L2330G_1_REF_2_REF01", claims[k].otherSubscriberDetails[l].otherPayerBillingProvider.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2330G_1_REF_2_REF02", claims[k].otherSubscriberDetails[l].otherPayerBillingProvider.REF[m].REF2);
                                    break;
                            }
                        }
                        //try
                        //{
                            cmd.ExecuteNonQuery();
                        //}
                        //catch (Exception e)
                        //{
                        //    Console.WriteLine(e);
                        //}
                    }
                }
                for (int l = 0; l < claims[k].ServiceLine.Length; l++)
                {
                    string servicelineid = "-1";
                    using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("spinsertserviceline", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@claimid", claimid);

                        cmd.Parameters.AddWithValue("@HeaderID", transaction.ST.ST2);
                        cmd.Parameters.AddWithValue("@subscriber_patientid", subscriberpatientloopid);
                        cmd.Parameters.AddWithValue("@Fileid", fileid);
                        cmd.Parameters.AddWithValue("@L2400_1_LX_1_LX01", claims[k].ServiceLine[l].LX.LX1);
                        if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].SV1.SV11))
                        {
                            string[] sv1Values = claims[k].ServiceLine[l].SV1.SV11.Split(':');
                            for (int m = 0; m < sv1Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV101_0" + (m + 1), sv1Values[m]);
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV102", claims[k].ServiceLine[l].SV1.SV12);
                        cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV103", claims[k].ServiceLine[l].SV1.SV13);
                        cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV104", claims[k].ServiceLine[l].SV1.SV14);
                        cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV105", claims[k].ServiceLine[l].SV1.SV15);
                        if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].SV1.SV17))
                        {
                            string[] sv7Values = claims[k].ServiceLine[l].SV1.SV17.Split(':');
                            for (int m = 0; m < sv7Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV107_" + (m + 1), sv7Values[m]);
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV109", claims[k].ServiceLine[l].SV1.SV19);
                        cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV111", claims[k].ServiceLine[l].SV1.SV111);
                        cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV112", claims[k].ServiceLine[l].SV1.SV112);
                        cmd.Parameters.AddWithValue("@L2400_1_SV1_1_SV115", claims[k].ServiceLine[l].SV1.SV115);
                        if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].SV5.SV51))
                        {
                            string[] sv51Values = claims[k].ServiceLine[l].SV5.SV51.Split(':');
                            for (int m = 0; m < sv51Values.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2400_1_SV5_1_SV501_0" + (m + 1), sv51Values[m]);
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2400_1_SV5_1_SV502", claims[k].ServiceLine[l].SV5.SV52);
                        cmd.Parameters.AddWithValue("@L2400_1_SV5_1_SV503", claims[k].ServiceLine[l].SV5.SV53);
                        cmd.Parameters.AddWithValue("@L2400_1_SV5_1_SV504", claims[k].ServiceLine[l].SV5.SV54);
                        cmd.Parameters.AddWithValue("@L2400_1_SV5_1_SV505", claims[k].ServiceLine[l].SV5.SV55);
                        cmd.Parameters.AddWithValue("@L2400_1_SV5_1_SV506", claims[k].ServiceLine[l].SV5.SV56);
                        for (int m = 0; m < claims[k].ServiceLine[l].PWK.Length; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2400_1_PWK_" + (m + 1) + "_PWK01", claims[k].ServiceLine[l].PWK[m].PWK1);
                            cmd.Parameters.AddWithValue("@L2400_1_PWK_" + (m + 1) + "_PWK02", claims[k].ServiceLine[l].PWK[m].PWK2);
                            cmd.Parameters.AddWithValue("@L2400_1_PWK_" + (m + 1) + "_PWK05", claims[k].ServiceLine[l].PWK[m].PWK5);
                            cmd.Parameters.AddWithValue("@L2400_1_PWK_" + (m + 1) + "_PWK06", claims[k].ServiceLine[l].PWK[m].PWK6);
                        }
                        cmd.Parameters.AddWithValue("@L2400_1_CR1_1_CR101", claims[k].ServiceLine[l].CR1.CR11);
                        cmd.Parameters.AddWithValue("@L2400_1_CR1_1_CR102", claims[k].ServiceLine[l].CR1.CR12);
                        cmd.Parameters.AddWithValue("@L2400_1_CR1_1_CR104", claims[k].ServiceLine[l].CR1.CR14);
                        cmd.Parameters.AddWithValue("@L2400_1_CR1_1_CR105", claims[k].ServiceLine[l].CR1.CR15);
                        cmd.Parameters.AddWithValue("@L2400_1_CR1_1_CR106", claims[k].ServiceLine[l].CR1.CR16);
                        cmd.Parameters.AddWithValue("@L2400_1_CR1_1_CR109", claims[k].ServiceLine[l].CR1.CR19);
                        cmd.Parameters.AddWithValue("@L2400_1_CR1_1_CR110", claims[k].ServiceLine[l].CR1.CR110);
                        cmd.Parameters.AddWithValue("@L2400_1_CR3_1_CR301", claims[k].ServiceLine[l].CR3.CR31);
                        cmd.Parameters.AddWithValue("@L2400_1_CR3_1_CR302", claims[k].ServiceLine[l].CR3.CR32);
                        cmd.Parameters.AddWithValue("@L2400_1_CR3_1_CR303", claims[k].ServiceLine[l].CR3.CR33);
                        for (int m = 0; m < claims[k].ServiceLine[l].CRC.Length; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2400_1_CRC_" + (m + 1) + "_CRC01", claims[k].ServiceLine[l].CRC[m].CRC1);
                            cmd.Parameters.AddWithValue("@L2400_1_CRC_" + (m + 1) + "_CRC02", claims[k].ServiceLine[l].CRC[m].CRC2);
                            cmd.Parameters.AddWithValue("@L2400_1_CRC_" + (m + 1) + "_CRC03", claims[k].ServiceLine[l].CRC[m].CRC3);
                            cmd.Parameters.AddWithValue("@L2400_1_CRC_" + (m + 1) + "_CRC04", claims[k].ServiceLine[l].CRC[m].CRC4);
                            cmd.Parameters.AddWithValue("@L2400_1_CRC_" + (m + 1) + "_CRC05", claims[k].ServiceLine[l].CRC[m].CRC5);
                            cmd.Parameters.AddWithValue("@L2400_1_CRC_" + (m + 1) + "_CRC06", claims[k].ServiceLine[l].CRC[m].CRC6);
                            cmd.Parameters.AddWithValue("@L2400_1_CRC_" + (m + 1) + "_CRC07", claims[k].ServiceLine[l].CRC[m].CRC7);
                        }
                        for (int m = 0; m < claims[k].ServiceLine[l].DTP.Length && m<10; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2400_1_DTP_" + (m + 1) + "_DTP01", claims[k].ServiceLine[l].DTP[m].DTP1);
                            cmd.Parameters.AddWithValue("@L2400_1_DTP_" + (m + 1) + "_DTP02", claims[k].ServiceLine[l].DTP[m].DTP2);
                            cmd.Parameters.AddWithValue("@L2400_1_DTP_" + (m + 1) + "_DTP03", claims[k].ServiceLine[l].DTP[m].DTP3);
                        }
                        for (int m = 0; m < claims[k].ServiceLine[l].QTY.Length; m++)
                        {
                            switch (claims[k].ServiceLine[l].QTY[m].QTY1) {
                                case "PT":
                                    cmd.Parameters.AddWithValue("@L2400_1_QTY_1_QTY01", claims[k].ServiceLine[l].QTY[m].QTY1);
                                    cmd.Parameters.AddWithValue("@L2400_1_QTY_1_QTY02", claims[k].ServiceLine[l].QTY[m].QTY2);
                                    break;
                                case "FL":
                                    cmd.Parameters.AddWithValue("@L2400_1_QTY_2_QTY01", claims[k].ServiceLine[l].QTY[m].QTY1);
                                    cmd.Parameters.AddWithValue("@L2400_1_QTY_2_QTY02", claims[k].ServiceLine[l].QTY[m].QTY2);
                                    break;
                            }
                           
                        }
                        for (int m = 0; m < claims[k].ServiceLine[l].MEA.Length; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2400_1_MEA_" + (m + 1) + "_MEA01", claims[k].ServiceLine[l].MEA[m].MEA1);
                            cmd.Parameters.AddWithValue("@L2400_1_MEA_" + (m + 1) + "_MEA02", claims[k].ServiceLine[l].MEA[m].MEA2);
                            cmd.Parameters.AddWithValue("@L2400_1_MEA_" + (m + 1) + "_MEA03", claims[k].ServiceLine[l].MEA[m].MEA3);
                        }
                        cmd.Parameters.AddWithValue("@L2400_1_CN1_1_CN101", claims[k].ServiceLine[l].CN1.CN11);
                        cmd.Parameters.AddWithValue("@L2400_1_CN1_1_CN102", claims[k].ServiceLine[l].CN1.CN12);
                        cmd.Parameters.AddWithValue("@L2400_1_CN1_1_CN103", claims[k].ServiceLine[l].CN1.CN13);
                        cmd.Parameters.AddWithValue("@L2400_1_CN1_1_CN104", claims[k].ServiceLine[l].CN1.CN14);
                        cmd.Parameters.AddWithValue("@L2400_1_CN1_1_CN105", claims[k].ServiceLine[l].CN1.CN15);
                        cmd.Parameters.AddWithValue("@L2400_1_CN1_1_CN106", claims[k].ServiceLine[l].CN1.CN16);
                        for (int m = 0; m < claims[k].ServiceLine[l].REF.Length && m<17; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2400_1_REF_" + (m + 1) + "_REF01", claims[k].ServiceLine[l].REF[m].REF1);
                            cmd.Parameters.AddWithValue("@L2400_1_REF_" + (m + 1) + "_REF02", claims[k].ServiceLine[l].REF[m].REF2);
                            if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].REF[m].REF4))
                            {
                                string[] ref4Values = claims[k].ServiceLine[l].REF[m].REF4.Split(':');
                                for (int n = 0; n < ref4Values.Length; n++)
                                {
                                    cmd.Parameters.AddWithValue("@L2400_1_REF_" + (m + 1) + "_REF04_" + (n + 1), ref4Values[n]);
                                }
                            }
                        }

                        cmd.Parameters.AddWithValue("@L2400_1_AMT_1_AMT01", claims[k].ServiceLine[l].AMT.AMT1);
                        cmd.Parameters.AddWithValue("@L2400_1_AMT_1_AMT02", claims[k].ServiceLine[l].AMT.AMT2);
                        for (int m = 0; m < claims[k].ServiceLine[l].K3.Length; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2400_1_K3_" + (m + 1) + "_K301", claims[k].ServiceLine[l].K3[m].K31);
                        }
                        for (int m = 0; m < claims[k].ServiceLine[l].NTE.Length; m++)
                        {
                            switch (claims[k].ServiceLine[l].NTE[m].NTE1) {
                                case "ADD":
                                        cmd.Parameters.AddWithValue("@L2400_1_NTE_1_NTE01", claims[k].ServiceLine[l].NTE[m].NTE1);
                                        cmd.Parameters.AddWithValue("@L2400_1_NTE_1_NTE02", claims[k].ServiceLine[l].NTE[m].NTE2);
                                    break;
                                case "DCP":
                                    cmd.Parameters.AddWithValue("@L2400_1_NTE_2_NTE01", claims[k].ServiceLine[l].NTE[m].NTE1);
                                    cmd.Parameters.AddWithValue("@L2400_1_NTE_2_NTE02", claims[k].ServiceLine[l].NTE[m].NTE2);
                                    break;
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2400_1_PS1_1_PS101", claims[k].ServiceLine[l].PS1.PS11);
                        cmd.Parameters.AddWithValue("@L2400_1_PS1_1_PS102", claims[k].ServiceLine[l].PS1.PS12);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP01", claims[k].ServiceLine[l].HCP.HCP1);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP02", claims[k].ServiceLine[l].HCP.HCP2);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP03", claims[k].ServiceLine[l].HCP.HCP3);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP04", claims[k].ServiceLine[l].HCP.HCP4);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP05", claims[k].ServiceLine[l].HCP.HCP5);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP06", claims[k].ServiceLine[l].HCP.HCP6);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP07", claims[k].ServiceLine[l].HCP.HCP7);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP09", claims[k].ServiceLine[l].HCP.HCP9);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP10", claims[k].ServiceLine[l].HCP.HCP10);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP11", claims[k].ServiceLine[l].HCP.HCP11);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP12", claims[k].ServiceLine[l].HCP.HCP12);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP13", claims[k].ServiceLine[l].HCP.HCP13);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP14", claims[k].ServiceLine[l].HCP.HCP14);
                        cmd.Parameters.AddWithValue("@L2400_1_HCP_1_HCP15", claims[k].ServiceLine[l].HCP.HCP15);
                        cmd.Parameters.AddWithValue("@L2410_1_LIN_1_LIN01", claims[k].ServiceLine[l].durgIdentification.LIN.LIN1);
                        cmd.Parameters.AddWithValue("@L2410_1_LIN_1_LIN02", claims[k].ServiceLine[l].durgIdentification.LIN.LIN2);
                        cmd.Parameters.AddWithValue("@L2410_1_LIN_1_LIN03", claims[k].ServiceLine[l].durgIdentification.LIN.LIN3);
                        cmd.Parameters.AddWithValue("@L2410_1_CTP_1_CTP04", claims[k].ServiceLine[l].durgIdentification.CTP.CTP4);
                        cmd.Parameters.AddWithValue("@L2410_1_CTP_1_CTP05", claims[k].ServiceLine[l].durgIdentification.CTP.CTP5);
                        for (int m = 0; m < claims[k].ServiceLine[l].durgIdentification.REF.Length; m++)
                        {
                            switch (claims[k].ServiceLine[l].durgIdentification.REF[m].REF1)
                            {
                                case "VY":
                                cmd.Parameters.AddWithValue("@L2410_1_REF_1_REF01", claims[k].ServiceLine[l].durgIdentification.REF[m].REF1);
                                cmd.Parameters.AddWithValue("@L2410_1_REF_1_REF02", claims[k].ServiceLine[l].durgIdentification.REF[m].REF2);
                                    break;
                                case "XZ":
                                    cmd.Parameters.AddWithValue("@L2410_1_REF_2_REF01", claims[k].ServiceLine[l].durgIdentification.REF[m].REF1);
                                    cmd.Parameters.AddWithValue("@L2410_1_REF_2_REF02", claims[k].ServiceLine[l].durgIdentification.REF[m].REF2);
                                    break;
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2420A_1_NM1_1_NM101", claims[k].ServiceLine[l].renderingProvider.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2420A_1_NM1_1_NM102", claims[k].ServiceLine[l].renderingProvider.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2420A_1_NM1_1_NM103", claims[k].ServiceLine[l].renderingProvider.NM1.NM13);
                        cmd.Parameters.AddWithValue("@L2420A_1_NM1_1_NM104", claims[k].ServiceLine[l].renderingProvider.NM1.NM14);
                        cmd.Parameters.AddWithValue("@L2420A_1_NM1_1_NM105", claims[k].ServiceLine[l].renderingProvider.NM1.NM15);
                        cmd.Parameters.AddWithValue("@L2420A_1_NM1_1_NM107", claims[k].ServiceLine[l].renderingProvider.NM1.NM17);
                        cmd.Parameters.AddWithValue("@L2420A_1_NM1_1_NM108", claims[k].ServiceLine[l].renderingProvider.NM1.NM18);
                        cmd.Parameters.AddWithValue("@L2420A_1_NM1_1_NM109", claims[k].ServiceLine[l].renderingProvider.NM1.NM19);
                        cmd.Parameters.AddWithValue("@L2420A_1_PRV_1_PRV01", claims[k].ServiceLine[l].renderingProvider.PRV.PRV1);
                        cmd.Parameters.AddWithValue("@L2420A_1_PRV_1_PRV02", claims[k].ServiceLine[l].renderingProvider.PRV.PRV2);
                        cmd.Parameters.AddWithValue("@L2420A_1_PRV_1_PRV03", claims[k].ServiceLine[l].renderingProvider.PRV.PRV3);
                        for (int m = 0; m < claims[k].ServiceLine[l].renderingProvider.REF.Length && m < 3; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2420A_1_REF_" + (m + 1) + "_REF01", claims[k].ServiceLine[l].renderingProvider.REF[m].REF1);
                            cmd.Parameters.AddWithValue("@L2420A_1_REF_" + (m + 1) + "_REF02", claims[k].ServiceLine[l].renderingProvider.REF[m].REF2);
                            if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].renderingProvider.REF[m].REF4))
                            {
                                string[] ref4value = claims[k].ServiceLine[l].renderingProvider.REF[m].REF4.Split(':');
                                for (int n = 0; n < ref4value.Length; n++)
                                {
                                    cmd.Parameters.AddWithValue("@L2420A_1_REF_" + (m + 1) + "_REF04_" + (n + 1), ref4value[n]);
                                }
                            }
                        }
                        //
                        cmd.Parameters.AddWithValue("@L2420B_1_NM1_1_NM101", claims[k].ServiceLine[l].purchasedserviceProvider.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2420B_1_NM1_1_NM102", claims[k].ServiceLine[l].purchasedserviceProvider.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2420B_1_NM1_1_NM108", claims[k].ServiceLine[l].purchasedserviceProvider.NM1.NM18);
                        cmd.Parameters.AddWithValue("@L2420B_1_NM1_1_NM109", claims[k].ServiceLine[l].purchasedserviceProvider.NM1.NM19);
                        for (int m = 0; m < claims[k].ServiceLine[l].purchasedserviceProvider.REF.Length && m < 3; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2420B_1_REF_" + (m + 1) + "_REF01", claims[k].ServiceLine[l].purchasedserviceProvider.REF[m].REF1);
                            cmd.Parameters.AddWithValue("@L2420B_1_REF_" + (m + 1) + "_REF02", claims[k].ServiceLine[l].purchasedserviceProvider.REF[m].REF2);
                            if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].purchasedserviceProvider.REF[m].REF4))
                            {
                                string[] ref4value = claims[k].ServiceLine[l].purchasedserviceProvider.REF[m].REF4.Split(':');
                                for (int n = 0; n < ref4value.Length; n++)
                                {
                                    cmd.Parameters.AddWithValue("@L2420B_1_REF_" + (m + 1) + "_REF04_" + (n + 1), ref4value[n]);
                                }
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2420C_1_NM1_1_NM101", claims[k].ServiceLine[l].serviceFacilityLocation.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2420C_1_NM1_1_NM102", claims[k].ServiceLine[l].serviceFacilityLocation.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2420C_1_NM1_1_NM103", claims[k].ServiceLine[l].serviceFacilityLocation.NM1.NM13);
                        cmd.Parameters.AddWithValue("@L2420C_1_NM1_1_NM108", claims[k].ServiceLine[l].serviceFacilityLocation.NM1.NM18);
                        cmd.Parameters.AddWithValue("@L2420C_1_NM1_1_NM109", claims[k].ServiceLine[l].serviceFacilityLocation.NM1.NM19);
                        cmd.Parameters.AddWithValue("@L2420C_1_N3_1_N301", claims[k].ServiceLine[l].serviceFacilityLocation.N3.N31);
                        cmd.Parameters.AddWithValue("@L2420C_1_N3_1_N302", claims[k].ServiceLine[l].serviceFacilityLocation.N3.N32);
                        cmd.Parameters.AddWithValue("@L2420C_1_N4_1_N401", claims[k].ServiceLine[l].serviceFacilityLocation.N4.N41);
                        cmd.Parameters.AddWithValue("@L2420C_1_N4_1_N402", claims[k].ServiceLine[l].serviceFacilityLocation.N4.N42);
                        cmd.Parameters.AddWithValue("@L2420C_1_N4_1_N403", claims[k].ServiceLine[l].serviceFacilityLocation.N4.N43);
                        cmd.Parameters.AddWithValue("@L2420C_1_N4_1_N404", claims[k].ServiceLine[l].serviceFacilityLocation.N4.N44);
                        cmd.Parameters.AddWithValue("@L2420C_1_N4_1_N407", claims[k].ServiceLine[l].serviceFacilityLocation.N4.N47);
                        for (int m = 0; m < claims[k].ServiceLine[l].serviceFacilityLocation.REF.Length; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2420C_1_REF_" + (m + 1) + "_REF01", claims[k].ServiceLine[l].serviceFacilityLocation.REF[m].REF1);
                            cmd.Parameters.AddWithValue("@L2420C_1_REF_" + (m + 1) + "_REF02", claims[k].ServiceLine[l].serviceFacilityLocation.REF[m].REF2);
                            if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].serviceFacilityLocation.REF[m].REF4))
                            {
                                string[] ref4Value = claims[k].ServiceLine[l].serviceFacilityLocation.REF[m].REF4.Split(':');
                                for (int n = 0; n < ref4Value.Length; n++)
                                {
                                    cmd.Parameters.AddWithValue("@L2420C_1_REF_" + (m + 1) + "_REF04_" + (n + 1), ref4Value[n]);
                                }
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2420D_1_NM1_1_NM101", claims[k].ServiceLine[l].supervicingProvider.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2420D_1_NM1_1_NM102", claims[k].ServiceLine[l].supervicingProvider.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2420D_1_NM1_1_NM103", claims[k].ServiceLine[l].supervicingProvider.NM1.NM13);
                        cmd.Parameters.AddWithValue("@L2420D_1_NM1_1_NM104", claims[k].ServiceLine[l].supervicingProvider.NM1.NM14);
                        cmd.Parameters.AddWithValue("@L2420D_1_NM1_1_NM105", claims[k].ServiceLine[l].supervicingProvider.NM1.NM15);
                        cmd.Parameters.AddWithValue("@L2420D_1_NM1_1_NM107", claims[k].ServiceLine[l].supervicingProvider.NM1.NM17);
                        cmd.Parameters.AddWithValue("@L2420D_1_NM1_1_NM108", claims[k].ServiceLine[l].supervicingProvider.NM1.NM18);
                        cmd.Parameters.AddWithValue("@L2420D_1_NM1_1_NM109", claims[k].ServiceLine[l].supervicingProvider.NM1.NM19);
                        for (int m = 0; m < claims[k].ServiceLine[l].supervicingProvider.REF.Length; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2420D_1_REF_" + (m + 1) + "_REF01", claims[k].ServiceLine[l].supervicingProvider.REF[m].REF1);
                            cmd.Parameters.AddWithValue("@L2420D_1_REF_" + (m + 1) + "_REF02", claims[k].ServiceLine[l].supervicingProvider.REF[m].REF2);
                            if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].supervicingProvider.REF[m].REF4))
                            {
                                string[] ref4Value = claims[k].ServiceLine[l].supervicingProvider.REF[m].REF4.Split(':');
                                for (int n = 0; n < ref4Value.Length; n++)
                                {
                                    cmd.Parameters.AddWithValue("@L2420D_1_REF_" + (m + 1) + "_REF04_" + (n + 1), ref4Value[n]);
                                }
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2420E_1_NM1_1_NM101", claims[k].ServiceLine[l].orderingProvider.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2420E_1_NM1_1_NM103", claims[k].ServiceLine[l].orderingProvider.NM1.NM13);
                        cmd.Parameters.AddWithValue("@L2420E_1_NM1_1_NM104", claims[k].ServiceLine[l].orderingProvider.NM1.NM14);
                        cmd.Parameters.AddWithValue("@L2420E_1_NM1_1_NM105", claims[k].ServiceLine[l].orderingProvider.NM1.NM15);
                        cmd.Parameters.AddWithValue("@L2420E_1_NM1_1_NM107", claims[k].ServiceLine[l].orderingProvider.NM1.NM17);
                        cmd.Parameters.AddWithValue("@L2420E_1_NM1_1_NM108", claims[k].ServiceLine[l].orderingProvider.NM1.NM18);
                        cmd.Parameters.AddWithValue("@L2420E_1_NM1_1_NM109", claims[k].ServiceLine[l].orderingProvider.NM1.NM19);
                        cmd.Parameters.AddWithValue("@L2420E_1_NM1_1_NM102", claims[k].ServiceLine[l].orderingProvider.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2420E_1_N3_1_N301", claims[k].ServiceLine[l].orderingProvider.N3.N31);
                        cmd.Parameters.AddWithValue("@L2420E_1_N3_1_N302", claims[k].ServiceLine[l].orderingProvider.N3.N32);
                        cmd.Parameters.AddWithValue("@L2420E_1_N4_1_N401", claims[k].ServiceLine[l].orderingProvider.N4.N41);
                        cmd.Parameters.AddWithValue("@L2420E_1_N4_1_N402", claims[k].ServiceLine[l].orderingProvider.N4.N42);
                        cmd.Parameters.AddWithValue("@L2420E_1_N4_1_N403", claims[k].ServiceLine[l].orderingProvider.N4.N43);
                        cmd.Parameters.AddWithValue("@L2420E_1_N4_1_N404", claims[k].ServiceLine[l].orderingProvider.N4.N44);
                        cmd.Parameters.AddWithValue("@L2420E_1_N4_1_N407", claims[k].ServiceLine[l].orderingProvider.N4.N47);
                        for (int m = 0; m < claims[k].ServiceLine[l].orderingProvider.REF.Length; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2420E_1_REF_" + (m + 1) + "_REF01", claims[k].ServiceLine[l].orderingProvider.REF[m].REF1);
                            cmd.Parameters.AddWithValue("@L2420E_1_REF_" + (m + 1) + "_REF02", claims[k].ServiceLine[l].orderingProvider.REF[m].REF2);
                            if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].orderingProvider.REF[m].REF4))
                            {
                                string[] ref4Value = claims[k].ServiceLine[l].orderingProvider.REF[m].REF4.Split(':');
                                for (int n = 0; n < ref4Value.Length; n++)
                                {
                                    cmd.Parameters.AddWithValue("@L2420E_1_REF_" + (m + 1) + "_REF04_" + (n + 1), ref4Value[n]);
                                }
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2420E_1_PER_1_PER01", claims[k].ServiceLine[l].orderingProvider.PER.PER1);
                        cmd.Parameters.AddWithValue("@L2420E_1_PER_1_PER02", claims[k].ServiceLine[l].orderingProvider.PER.PER2);
                        cmd.Parameters.AddWithValue("@L2420E_1_PER_1_PER03", claims[k].ServiceLine[l].orderingProvider.PER.PER3);
                        cmd.Parameters.AddWithValue("@L2420E_1_PER_1_PER04", claims[k].ServiceLine[l].orderingProvider.PER.PER4);
                        cmd.Parameters.AddWithValue("@L2420E_1_PER_1_PER05", claims[k].ServiceLine[l].orderingProvider.PER.PER5);
                        cmd.Parameters.AddWithValue("@L2420E_1_PER_1_PER06", claims[k].ServiceLine[l].orderingProvider.PER.PER6);
                        cmd.Parameters.AddWithValue("@L2420E_1_PER_1_PER07", claims[k].ServiceLine[l].orderingProvider.PER.PER7);
                        cmd.Parameters.AddWithValue("@L2420E_1_PER_1_PER08", claims[k].ServiceLine[l].orderingProvider.PER.PER8);
                        for (int m = 0; m < claims[k].ServiceLine[l].referingProvider.Length; m++)
                        {
                            switch (claims[k].ServiceLine[l].referingProvider[m].NM1.NM11) {
                                case "DN":
                                cmd.Parameters.AddWithValue("@L2420F_1_NM1_1_NM101", claims[k].ServiceLine[l].referingProvider[m].NM1.NM11);
                                cmd.Parameters.AddWithValue("@L2420F_1_NM1_1_NM103", claims[k].ServiceLine[l].referingProvider[m].NM1.NM13);
                                cmd.Parameters.AddWithValue("@L2420F_1_NM1_1_NM102", claims[k].ServiceLine[l].referingProvider[m].NM1.NM12);
                                cmd.Parameters.AddWithValue("@L2420F_1_NM1_1_NM104", claims[k].ServiceLine[l].referingProvider[m].NM1.NM14);
                                cmd.Parameters.AddWithValue("@L2420F_1_NM1_1_NM105", claims[k].ServiceLine[l].referingProvider[m].NM1.NM15);
                                cmd.Parameters.AddWithValue("@L2420F_1_NM1_1_NM107", claims[k].ServiceLine[l].referingProvider[m].NM1.NM17);
                                cmd.Parameters.AddWithValue("@L2420F_1_NM1_1_NM108", claims[k].ServiceLine[l].referingProvider[m].NM1.NM18);
                                cmd.Parameters.AddWithValue("@L2420F_1_NM1_1_NM109", claims[k].ServiceLine[l].referingProvider[m].NM1.NM19);
                                for (int n = 0; n < claims[k].ServiceLine[l].referingProvider[m].REF.Length; n++)
                                {
                                    cmd.Parameters.AddWithValue("@L2420F_1_REF_" + (n + 1) + "_REF01", claims[k].ServiceLine[l].referingProvider[m].REF[n].REF1);
                                    cmd.Parameters.AddWithValue("@L2420F_1_REF_" + (n + 1) + "_REF02", claims[k].ServiceLine[l].referingProvider[m].REF[n].REF2);
                                    if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].referingProvider[m].REF[n].REF4))
                                    {
                                        string[] ref4Value = claims[k].ServiceLine[l].referingProvider[m].REF[n].REF4.Split(':');
                                        for (int o = 0; o < ref4Value.Length; o++)
                                        {
                                            cmd.Parameters.AddWithValue("@L2420F_1_REF_" + (n + 1) + "_REF04_" + (o + 1), ref4Value[o]);
                                        }
                                    }
                                }
                                    break;
                                case "P3":
                                    cmd.Parameters.AddWithValue("@L2420F_2_NM1_1_NM101", claims[k].ServiceLine[l].referingProvider[m].NM1.NM11);
                                    cmd.Parameters.AddWithValue("@L2420F_2_NM1_1_NM103", claims[k].ServiceLine[l].referingProvider[m].NM1.NM13);
                                    cmd.Parameters.AddWithValue("@L2420F_2_NM1_1_NM102", claims[k].ServiceLine[l].referingProvider[m].NM1.NM12);
                                    cmd.Parameters.AddWithValue("@L2420F_2_NM1_1_NM104", claims[k].ServiceLine[l].referingProvider[m].NM1.NM14);
                                    cmd.Parameters.AddWithValue("@L2420F_2_NM1_1_NM105", claims[k].ServiceLine[l].referingProvider[m].NM1.NM15);
                                    cmd.Parameters.AddWithValue("@L2420F_2_NM1_1_NM107", claims[k].ServiceLine[l].referingProvider[m].NM1.NM17);
                                    cmd.Parameters.AddWithValue("@L2420F_2_NM1_1_NM108", claims[k].ServiceLine[l].referingProvider[m].NM1.NM18);
                                    cmd.Parameters.AddWithValue("@L2420F_2_NM1_1_NM109", claims[k].ServiceLine[l].referingProvider[m].NM1.NM19);
                                    for (int n = 0; n < claims[k].ServiceLine[l].referingProvider[m].REF.Length; n++)
                                    {
                                        cmd.Parameters.AddWithValue("@L2420F_2_REF_" + (n + 1) + "_REF01", claims[k].ServiceLine[l].referingProvider[m].REF[n].REF1);
                                        cmd.Parameters.AddWithValue("@L2420F_2_REF_" + (n + 1) + "_REF02", claims[k].ServiceLine[l].referingProvider[m].REF[n].REF2);
                                        if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].referingProvider[m].REF[n].REF4))
                                        {
                                            string[] ref4Value = claims[k].ServiceLine[l].referingProvider[m].REF[n].REF4.Split(':');
                                            for (int o = 0; o < ref4Value.Length; o++)
                                            {
                                                cmd.Parameters.AddWithValue("@L2420F_2_REF_" + (n + 1) + "_REF04_" + (o + 1), ref4Value[o]);
                                            }
                                        }
                                    }
                                    break;
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2420G_1_NM1_1_NM101", claims[k].ServiceLine[l].ambulancePickUpLoaction.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2420G_1_NM1_1_NM102", claims[k].ServiceLine[l].ambulancePickUpLoaction.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2420G_1_N3_1_N301", claims[k].ServiceLine[l].ambulancePickUpLoaction.N3.N31);
                        cmd.Parameters.AddWithValue("@L2420G_1_N3_1_N302", claims[k].ServiceLine[l].ambulancePickUpLoaction.N3.N32);
                        cmd.Parameters.AddWithValue("@L2420G_1_N4_1_N401", claims[k].ServiceLine[l].ambulancePickUpLoaction.N4.N41);
                        cmd.Parameters.AddWithValue("@L2420G_1_N4_1_N402", claims[k].ServiceLine[l].ambulancePickUpLoaction.N4.N42);
                        cmd.Parameters.AddWithValue("@L2420G_1_N4_1_N403", claims[k].ServiceLine[l].ambulancePickUpLoaction.N4.N43);
                        cmd.Parameters.AddWithValue("@L2420G_1_N4_1_N404", claims[k].ServiceLine[l].ambulancePickUpLoaction.N4.N44);
                        cmd.Parameters.AddWithValue("@L2420G_1_N4_1_N407", claims[k].ServiceLine[l].ambulancePickUpLoaction.N4.N47);
                        cmd.Parameters.AddWithValue("@L2420H_1_NM1_1_NM101", claims[k].ServiceLine[l].AmbulanceDropLocation.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2420H_1_NM1_1_NM102", claims[k].ServiceLine[l].AmbulanceDropLocation.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2420H_1_N3_1_N301", claims[k].ServiceLine[l].AmbulanceDropLocation.N3.N31);
                        cmd.Parameters.AddWithValue("@L2420H_1_N3_1_N302", claims[k].ServiceLine[l].AmbulanceDropLocation.N3.N32);
                        cmd.Parameters.AddWithValue("@L2420H_1_N4_1_N401", claims[k].ServiceLine[l].AmbulanceDropLocation.N4.N41);
                        cmd.Parameters.AddWithValue("@L2420H_1_N4_1_N402", claims[k].ServiceLine[l].AmbulanceDropLocation.N4.N42);
                        cmd.Parameters.AddWithValue("@L2420H_1_N4_1_N403", claims[k].ServiceLine[l].AmbulanceDropLocation.N4.N43);
                        cmd.Parameters.AddWithValue("@L2420H_1_N4_1_N404", claims[k].ServiceLine[l].AmbulanceDropLocation.N4.N44);
                        cmd.Parameters.AddWithValue("@L2420H_1_N4_1_N407", claims[k].ServiceLine[l].AmbulanceDropLocation.N4.N47);
                        cmd.Parameters.AddWithValue("@L2430_1_SVD_1_SVD01", claims[k].ServiceLine[l].lineAdjustment.SVD.SVD1);
                        cmd.Parameters.AddWithValue("@L2430_1_SVD_1_SVD02", claims[k].ServiceLine[l].lineAdjustment.SVD.SVD2);
                        if (!string.IsNullOrEmpty(claims[k].ServiceLine[l].lineAdjustment.SVD.SVD3))
                        {
                            string[] svd3Value = claims[k].ServiceLine[l].lineAdjustment.SVD.SVD3.Split(':');
                            for (int m = 0; m < svd3Value.Length; m++)
                            {
                                cmd.Parameters.AddWithValue("@L2430_1_SVD_1_SVD03_" + (m + 1), svd3Value[m]);
                            }
                        }
                        cmd.Parameters.AddWithValue("@L2430_1_SVD_1_SVD05", claims[k].ServiceLine[l].lineAdjustment.SVD.SVD5);
                        cmd.Parameters.AddWithValue("@L2430_1_SVD_1_SVD06", claims[k].ServiceLine[l].lineAdjustment.SVD.SVD6);
                        for (int m = 0; m < claims[k].ServiceLine[l].lineAdjustment.CAS.Length; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS01", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS1);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS02", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS2);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS03", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS3);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS04", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS4);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS05", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS5);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS06", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS6);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS07", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS7);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS08", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS8);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS09", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS9);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS10", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS10);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS11", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS11);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS12", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS12);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS13", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS13);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS14", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS14);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS15", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS15);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS16", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS16);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS17", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS17);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS18", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS18);
                            cmd.Parameters.AddWithValue("@L2430_1_CAS_1_CAS19", claims[k].ServiceLine[l].lineAdjustment.CAS[m].CAS19);
                        }
                        cmd.Parameters.AddWithValue("@L2430_1_DTP_1_DTP01", claims[k].ServiceLine[l].lineAdjustment.DTP.DTP1);
                        cmd.Parameters.AddWithValue("@L2430_1_DTP_1_DTP02", claims[k].ServiceLine[l].lineAdjustment.DTP.DTP2);
                        cmd.Parameters.AddWithValue("@L2430_1_DTP_1_DTP03", claims[k].ServiceLine[l].lineAdjustment.DTP.DTP3);
                        cmd.Parameters.AddWithValue("@L2430_1_AMT_1_AMT01", claims[k].ServiceLine[l].lineAdjustment.AMT.AMT1);
                        cmd.Parameters.AddWithValue("@L2430_1_AMT_1_AMT02", claims[k].ServiceLine[l].lineAdjustment.AMT.AMT2);
                        //try
                        //{
                            SqlDataReader reader = cmd.ExecuteReader();
                            if (reader.HasRows)
                            {
                                foreach (IDataRecord r in reader)
                                {
                                    servicelineid = "" + r["servicelineid"];
                                }
                            }
                    //}
                    //    catch (Exception e)
                    //{
                    //    Console.WriteLine(e);
                    //}
                }
                    for (int m = 0; m < claims[k].ServiceLine[l].formIdentificationCode.Length; m++)
                    {
                        string formidentificationid = "-1";
                        using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("spinsertformidentification", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@servicelidid", servicelineid);
                            cmd.Parameters.AddWithValue("@L2440_1_LQ_1_LQ01", claims[k].ServiceLine[l].formIdentificationCode[m].LQ.LQ1);
                            cmd.Parameters.AddWithValue("@L2440_1_LQ_1_LQ02", claims[k].ServiceLine[l].formIdentificationCode[m].LQ.LQ2);
                            //try
                            //{
                                SqlDataReader reader = cmd.ExecuteReader();
                                if (reader.HasRows)
                                {
                                    foreach (IDataRecord r in reader)
                                    {
                                        formidentificationid = "" + r["formidentificationid"];
                                    }
                                }
                            //}
                            //catch (Exception e)
                            //{
                                //Console.WriteLine(e);
                            //}
                        }
                        for (int n = 0; n < claims[k].ServiceLine[l].formIdentificationCode[m].FRM.Length; n++)
                        {
                            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
                            {
                                con.Open();
                                SqlCommand cmd = new SqlCommand("spinsertsupportdoc", con);
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@formidentification",formidentificationid);
                                cmd.Parameters.AddWithValue("@L2440_FRM_FRM01", claims[k].ServiceLine[l].formIdentificationCode[m].FRM[n].FRM1);
                                cmd.Parameters.AddWithValue("@L2440_FRM_FRM02", claims[k].ServiceLine[l].formIdentificationCode[m].FRM[n].FRM2);
                                cmd.Parameters.AddWithValue("@L2440_FRM_FRM03", claims[k].ServiceLine[l].formIdentificationCode[m].FRM[n].FRM3);
                                cmd.Parameters.AddWithValue("@L2440_FRM_FRM04", claims[k].ServiceLine[l].formIdentificationCode[m].FRM[n].FRM4);
                                cmd.Parameters.AddWithValue("@L2440_FRM_FRM05", claims[k].ServiceLine[l].formIdentificationCode[m].FRM[n].FRM5);
                                cmd.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }
        }

        public async Task<string> SearchBenefitCode(string hpcode, string benefitcode)
        {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spsearchbenefitcode", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@HealthPlanCode", hpcode);
                cmd.Parameters.AddWithValue("@BenefitCode", benefitcode);
                SqlDataReader reader = cmd.ExecuteReader();
                string description = "";
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        description = "" + r["Description"];
                    }
                }
                return description;
            }
        }

        public async Task<PcpAutoFillModel> GetPcpOrganizationName(string pcpid)
        {
            using (SqlConnection con = new SqlConnection(@"data source=CAPTIVATESOFT2\MSSQLSERVER01; database = EDIDatabase ; integrated security=SSPI"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("spgetpcpprimorg", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@providerId",pcpid);
                string organizationName = "";
                string providerLastName = "";
                string providerFirstName = "";

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    foreach (IDataRecord r in reader)
                    {
                        organizationName = "" + r["organizationName"];
                        providerLastName = "" + r["lastName"];
                        providerFirstName = "" + r["firstName"];
                    }
                }
                return new PcpAutoFillModel { organizationName=organizationName, providerFirstName = providerFirstName, providerLastName=providerLastName};
            }
        }

        public async Task<List<MemberSearchResult>> SearchMember(MemberSearchModel msm)
        {
            try
            {
                using (EDIDatabase db = new EDIDatabase())
                {
                    string query = "spsearchmemberclaim '" + msm.memid + "','" + msm.lastname + "','" + msm.firstname + "','" + msm.hp + "','" + msm.dob + "','" + msm.gender + "'";
                    List<MemberSearchResult> mr = db.Database.SqlQuery<MemberSearchResult>(query).ToList();
                    return mr;
                }
            }
            catch (Exception e) {
                throw;
            }
        }
    }
}

using DataBase;
using Microsoft.AspNet.Identity;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Http;
using DataBase.Models;
using System.Web;
using System.IO;
using System;
using Microsoft.Office.Interop.Excel;
using System.Xml;
using System.Xml.Serialization;
using Database.Models;
using System.Net.Http;

namespace Angular_API.Controllers
{
    [Authorize]
    [RoutePrefix("api/Users")]
    public class UsersController : ApiController
    {
        private IDatabase _db;
        public UsersController(IDatabase database) {
            _db = database;
        }
        public async Task<IHttpActionResult> get() {
            var context = (ClaimsIdentity)User.Identity;
            return Ok(context.GetUserName());
        }
        [HttpPost]
        [Route("searchMember")]
        public async Task<IHttpActionResult> searchMember(MemberSearch ms) {
            List<MembersModel> membersearchresult = await _db.searchMember(ms);
            return Ok(membersearchresult);
        }
        [HttpPut]
        [Route("setMember")]
        public async Task<IHttpActionResult> setMember(MembersModel model) {
            await _db.Update(model);
            return Ok(model);
        }
        [HttpGet]
        [Route("searchBenefit")]
        public async Task<IHttpActionResult> searchBenefitMaster(string healthplan,string healthplancode) {
            BenefitMasterModel[] searchresults =await _db.searchbenefitMaster((healthplan!= "undefined" && healthplan!=null) ? healthplan : "",(healthplancode != "undefined" && healthplancode!=null)? healthplancode:"");
            return Ok(searchresults);
        }
        [HttpGet]
        [Route("GetMember")]
        public async Task<IHttpActionResult> GetMember(string memberid, string healthplan) {
            MembersModel members = await _db.selectMember(memberid,healthplan);
            return Ok(members);
        }
        [HttpPost]
        [Route("createMember")]
        public async Task<IHttpActionResult> CreateMember(MembersModel model) {
            if (model.autogenmemid) {
                model.memberId = Guid.NewGuid().ToString();
            }
            await _db.createMember(model);
            return Ok(model);
        }
        [HttpGet]
        [Route("searchProvider")]
        public async Task<IHttpActionResult> searchProvider(string pcpid,string pcpnpi,string lastName,string firstName,string organizationName,string address1,string address2,string city,string state,string postalCode) {
            List<ProviderSearchResultModel> model = await _db.searchProvider(pcpid==null?"":pcpid, pcpnpi==null?"":pcpnpi,lastName==null?"":lastName,firstName==null?"":firstName, organizationName==null?"":organizationName,address1==null?"":address1,address2==null?"":address2,city==null?"":city,state==null?"":state,postalCode==null?"":postalCode);
            return Ok(model);
        }
        [HttpGet]
        [Route("getEDI")]
        public async Task<HttpResponseMessage> getEDI(string fileid) {
            HttpResponseMessage response = new HttpResponseMessage(System.Net.HttpStatusCode.OK);
            try
            {
                response.Content = new StreamContent(new FileStream("C:\\Users\\saikiran\\Documents\\EDIFile\\" + fileid + ".txt", FileMode.Open, FileAccess.ReadWrite));
                response.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment");
                response.Content.Headers.ContentDisposition.FileName = fileid + ".txt";
                response.Content.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("text/plain");

                return response;
            }
            catch (Exception e) {
                return null;
            }
        }
        [HttpGet]
        [Route("searchBenefitCode")]
        public async Task<IHttpActionResult> searchBenefitCode(string healthPlanCode,string benefitCode) {
            string description = await _db.SearchBenefitCode(healthPlanCode, benefitCode);
            return Ok(description);
        }
        [HttpGet]
        [Route("getPcpOrganization")]
        public async Task<IHttpActionResult> getPcpOrganization(string pcpid) {
            PcpAutoFillModel organizationname = await _db.GetPcpOrganizationName(pcpid);
            return Ok(organizationname);
        }
        [HttpPost]
        [Route("addProviders")]
        public async Task<IHttpActionResult> addProviders() {
            var httpRequest = HttpContext.Current.Request;
            var providerFile = httpRequest.Files["providerfile"];
            string fileName = providerFile.FileName;
            string filePath = @"C:\Users\saikiran\Documents\ProviderFile\" + fileName;
            //wbWorkbook.SaveAs("c:\yourdesiredFilename.csv", Microsoft.Office.Interop.Excel.XlFileFormat.xlCSV)
            providerFile.SaveAs(filePath);
            Application rawData = new Application();
            Workbook workbook = rawData.Workbooks.Open(filePath);
            Worksheet ws = (Worksheet)workbook.Sheets[1];
            ws.SaveAs(filePath + ".csv", XlFileFormat.xlCSV);
            workbook.Close();
            await this._db.providersAdd(filePath + ".csv");
            return Ok();

        }
        [HttpPost]
        [Route("BenefitMasterAdd")]
        public async Task<IHttpActionResult> BenefitMasterAdd(BenefitMasterModel model)
        {
            await this._db.AddBenefitMaster(model);
            return Ok();
        }
        [HttpPost]
        [Route("EdiUpload")]
        public async Task<IHttpActionResult> EdiUpload() {
            var httpRequest = HttpContext.Current.Request;
            var ediFile = httpRequest.Files["ediFile"];
            string ediFileName = ediFile.FileName;
            int fileid = await _db.storefiledetails(ediFileName);
            string filePath = @"C:\Users\saikiran\Documents\EDIFile\" + fileid + ".txt";
            ediFile.SaveAs(filePath);
            string xmlfilepath = EdiToXml(filePath);
            await this.DeserializeanExecute(xmlfilepath, fileid);
            return Ok();
        }
        [HttpGet]
        [Route("allclaims")]
        public async Task<IHttpActionResult> GetAllClaims() {
            ClaimsTableModel[] model = await _db.GetAllClaims();
            return Ok(model);
        }

        async Task DeserializeanExecute(string xmlFilePath, int fileid)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(EDIModel));
            StreamReader sr = new StreamReader(xmlFilePath);
            EDIModel ediModel = (EDIModel)serializer.Deserialize(sr);
            if (ediModel.Group.Length == ediModel.IEA.IEA1)
            {
                await _db.InsertClaim(ediModel, fileid);
            }
            //    foreach (Group group in ediModel.Group ?? new Group[] { })
            //    {
            //        foreach (Transaction transaction in group.Transaction ?? new Transaction[] { })
            //        {
            //            foreach (BillingProvider billingProvider in transaction.BillingProvider ?? new BillingProvider[] { })
            //            {
            //                this._db.insertbillingporvider(transactionid: transaction.Transactionid, billingproviderloopid: billingProvider.BillingProviderloopid, billingproviderlastname: billingProvider.billingproviderdetails.BillingProviderOrganizationName, billingprovidernpi: billingProvider.billingproviderdetails.BillingProviderNpi, taxid: Array.FindIndex(billingProvider.billingproviderdetails.ReferenceQualifier, (s) => s == "EI")==-1?null:billingProvider.billingproviderdetails.ReferenceValues[Array.FindIndex(billingProvider.billingproviderdetails.ReferenceQualifier, (s) => s == "EI")], address1: billingProvider.billingproviderdetails.Address1, address2: billingProvider.billingproviderdetails.Address2, city: billingProvider.billingproviderdetails.City, state: billingProvider.billingproviderdetails.State, postalcode: billingProvider.billingproviderdetails.PostalCode);
            //            }
            //            foreach (Patient patient in transaction.Patients ?? new Patient[] { })
            //            {
            //                this._db.spinsertpatient(transactionid: transaction.Transactionid, loopid: patient.PatientLoopId, subscriberloopid: patient.SubscriberLoopId, lastname: patient.PatientDetails.PatientLastName, firstname: patient.PatientDetails.PatientFirstName, patientid: patient.PatientDetails.PatientId, address1: patient.PatientDetails.Address1, address2: patient.PatientDetails.Address2, city: patient.PatientDetails.City, state: patient.PatientDetails.City, postalcode: patient.PatientDetails.PostalCode,dob:patient.PatientDetails.Dob,gender:patient.PatientDetails.Gender);
            //                foreach (Models.Claims claim in patient.Claims ?? new Claims[] { })
            //                {
            //                    claim.ClaimId = this._db.spinsertclaim(fileid,transactionid: transaction.Transactionid, claimsenderid: claim.ClaimSenderid, diagnosiscode1: claim.Diagnosiscode1, diagnosiscode2: claim.Diagnosiscode2, diagnosiscode3: claim.Diagnosiscode3, diagnosiscode4: claim.Diagnosiscode4, diagnosiscode5: claim.Diagnosiscode5, diagnosiscode6: claim.Diagnosiscode6, diagnosiscode7: claim.Diagnosiscode7, diagnosiscode8: claim.Diagnosiscode8, diagnosiscode9: claim.Diagnosiscode9, diagnosiscode10: claim.Diagnosiscode10, diagnosiscode11: claim.Diagnosiscode11, diagnosiscode12: claim.Diagnosiscode12, parentloopid: patient.PatientLoopId);
            //                    foreach (ReferingProvider referingProvider in claim.ReferingProvider ?? new ReferingProvider[] { })
            //                    {
            //                        this._db.spinsertreferingprovider(claimid: claim.ClaimId, lastname: referingProvider.LastName, firstname: referingProvider.FirstName, referingprovidernpi: referingProvider.ReferingProviderNpi);
            //                    }
            //                    if (claim.RenderingProvider != null)
            //                    {
            //                        this._db.spinsertrenderingprovider(claimid: claim.ClaimId, lastname: claim.RenderingProvider.LastName, firstname: claim.RenderingProvider.FirstName, renderningprovidernpi: claim.RenderingProvider.RenderingProviderNpi);
            //                    }
            //                    if(claim.AmbulancePickUpLocation != null)
            //                    this._db.spinsertambulancepickup(claimid: claim.ClaimId, address1: claim.AmbulancePickUpLocation.Address1, address2: claim.AmbulancePickUpLocation.Address2, city: claim.AmbulancePickUpLocation.City, state: claim.AmbulancePickUpLocation.State, postalcode: claim.AmbulancePickUpLocation.PostalCode);
            //                    if(claim.AmbulanceDropLocation != null)
            //                    this._db.spinsertambulancedroplocation(claimid: claim.ClaimId, organizationname: claim.AmbulanceDropLocation.AmbulanceOrganization, address1: claim.AmbulanceDropLocation.Address1, address2: claim.AmbulanceDropLocation.Address2, city: claim.AmbulanceDropLocation.City, state: claim.AmbulanceDropLocation.State, postalcode: claim.AmbulanceDropLocation.PostalCode, organizationnpi: claim.AmbulanceDropLocation.NPI);
            //                    if(claim.ServiceFacilityLocation != null)
            //                    this._db.spinsertservicefacilitylocation(claimid: claim.ClaimId, lastname: claim.ServiceFacilityLocation.OrganizationName, firstname: null, organizationnpi: claim.ServiceFacilityLocation.OrganizationNPI, address1: claim.ServiceFacilityLocation.Address1, address2: claim.ServiceFacilityLocation.Address2, city: claim.ServiceFacilityLocation.City, state: claim.ServiceFacilityLocation.State, postalcode: claim.ServiceFacilityLocation.PostalCode);
            //                    foreach (ServiceLine serviceLine in claim.ServiceLine ?? new ServiceLine[] { })
            //                    {
            //                        this._db.spinsertserviceline(claimid: claim.ClaimId, procedurecode: serviceLine.Procedurecode, diagnosiscode: serviceLine.DiagnosticPointer, servicelinenumber: serviceLine.ServiceLineNumber, serviceperiod: serviceLine.ServicePeriod);
            //                    }

            //                }
            //                foreach (Subscriber subscriber in transaction.Subscriber  ?? new Subscriber[] { })
            //                {     
            //                    this._db.spinsertsubscriber(transactionid: transaction.Transactionid, billingproviderloopid: subscriber.billingproviderloopid, loopid: subscriber.subscriberloopid, lastname: subscriber.SubscriberDetails.SubscriberLastName, firstname: subscriber.SubscriberDetails.SubscriberFirstName, subscriberid: subscriber.SubscriberDetails.SubscriberId, address1: subscriber.SubscriberDetails.Address1, address2: subscriber.SubscriberDetails.Address2, city: subscriber.SubscriberDetails.City, state: subscriber.SubscriberDetails.State, postalcode: subscriber.SubscriberDetails.PostalCode,dob:subscriber.SubscriberDetails.Dob,gender:subscriber.SubscriberDetails.Gender);
            //                    foreach (Models.Claims claim in subscriber.Claim ?? new Claims[] { })
            //                    {
            //                        claim.ClaimId = this._db.spinsertclaim(fileid,transactionid: transaction.Transactionid, claimsenderid: claim.ClaimSenderid, diagnosiscode1: claim.Diagnosiscode1, diagnosiscode2: claim.Diagnosiscode2, diagnosiscode3: claim.Diagnosiscode3, diagnosiscode4: claim.Diagnosiscode4, diagnosiscode5: claim.Diagnosiscode5, diagnosiscode6: claim.Diagnosiscode6, diagnosiscode7: claim.Diagnosiscode7, diagnosiscode8: claim.Diagnosiscode8, diagnosiscode9: claim.Diagnosiscode9, diagnosiscode10: claim.Diagnosiscode10, diagnosiscode11: claim.Diagnosiscode11, diagnosiscode12: claim.Diagnosiscode12, parentloopid: subscriber.subscriberloopid);
            //                        foreach (ReferingProvider referingProvider in claim.ReferingProvider ?? new ReferingProvider[] { })
            //                        {
            //                            this._db.spinsertreferingprovider(claimid: claim.ClaimId, lastname: referingProvider.LastName, firstname: referingProvider.FirstName, referingprovidernpi: referingProvider.ReferingProviderNpi);
            //                        }
            //                        if(claim.RenderingProvider != null)
            //                        this._db.spinsertrenderingprovider(claimid: claim.ClaimId, lastname: claim.RenderingProvider.LastName, firstname: claim.RenderingProvider.FirstName, renderningprovidernpi: claim.RenderingProvider.RenderingProviderNpi);
            //                        if(claim.AmbulancePickUpLocation != null)
            //                        this._db.spinsertambulancepickup(claimid: claim.ClaimId, address1: claim.AmbulancePickUpLocation.Address1, address2: claim.AmbulancePickUpLocation.Address2, city: claim.AmbulancePickUpLocation.City, state: claim.AmbulancePickUpLocation.State, postalcode: claim.AmbulancePickUpLocation.PostalCode);
            //                        if(claim.AmbulanceDropLocation != null)
            //                        this._db.spinsertambulancedroplocation(claimid: claim.ClaimId, organizationname: claim.AmbulanceDropLocation.AmbulanceOrganization, address1: claim.AmbulanceDropLocation.Address1, address2: claim.AmbulanceDropLocation.Address2, city: claim.AmbulanceDropLocation.City, state: claim.AmbulanceDropLocation.State, postalcode: claim.AmbulanceDropLocation.PostalCode, organizationnpi: claim.AmbulanceDropLocation.NPI);
            //                        if(claim.ServiceFacilityLocation != null)
            //                        this._db.spinsertservicefacilitylocation(claimid: claim.ClaimId, lastname: claim.ServiceFacilityLocation.OrganizationName, firstname: null, organizationnpi: claim.ServiceFacilityLocation.OrganizationNPI, address1: claim.ServiceFacilityLocation.Address1, address2: claim.ServiceFacilityLocation.Address2, city: claim.ServiceFacilityLocation.City, state: claim.ServiceFacilityLocation.State, postalcode: claim.ServiceFacilityLocation.PostalCode);
            //                        foreach (ServiceLine serviceLine in claim.ServiceLine ?? new ServiceLine[] { })
            //                        {
            //                            this._db.spinsertserviceline(claimid: claim.ClaimId, procedurecode: serviceLine.Procedurecode, diagnosiscode: serviceLine.DiagnosticPointer, servicelinenumber: serviceLine.ServiceLineNumber, serviceperiod: serviceLine.ServicePeriod);
            //                        }
            //                    }
            //                }
            //            }
            //        }
            //    }
        }
        static  string EdiToXml(string edipath) {
            string edifilename = Path.GetFileNameWithoutExtension(edipath);
            string xmlpath = @"C:\Users\saikiran\Documents\EDIFile\convertedxml\" + edifilename + ".xml";
            XmlWriter xmlWriter = XmlWriter.Create(xmlpath, new XmlWriterSettings() { Indent = true });
            uint numberofSegmentspertran = 0;
            xmlWriter.WriteStartDocument();
            xmlWriter.WriteStartElement("Data");
            string totallines = string.Join("",File.ReadAllLines(edipath).ToArray());
            string[] lines = totallines.Split('~');
            bool billingproviderexist = false;
            bool patientexist = false;
            bool subscriberexist = false;
            bool DrugIdentificationExist = false;
            bool orderingproviderexist = false;
            bool servicelineexist = false;
            bool ambulancedroplocationexist = false;
            bool othersubscribernameexist = false;
            bool othersubscriberdetailsexist = false;
            bool supervisingproviderexist = false;
            bool servicefacilitylocationexist = false;
            bool renderingproviderexist = false;
            bool purchasedserviceproviderexist = false;
            bool claimexist = false;
            bool lineadjustmentexist = false;
            bool formidentificationcodeexist = false;
            bool referingproviderexist = false;
            bool ambulancepickuplocationexist = false;
            bool submiterexist = false;
            bool billingproviderdetailsexist = false;
            foreach (string line in lines)
            {
                string[] segments =  line.Replace("\n", "").Trim().Split('*');
                numberofSegmentspertran++;
                switch (segments[0])
                {
                    case "GS":
                        xmlWriter.WriteStartElement("Group");
                        numberofSegmentspertran = 0;
                        writeElement(segments, xmlWriter);
                        break;
                    case "ST":
                        xmlWriter.WriteStartElement("Transaction");
                        numberofSegmentspertran = 1;
                        xmlWriter.WriteAttributeString("transactionid", segments[2]);
                        writeElement(segments, xmlWriter);
                        break;
                    case "NM1":
                        if (segments[1] == "41")
                        {
                            xmlWriter.WriteStartElement("submitter");
                            writeElement(segments, xmlWriter);
                            submiterexist = true;
                        }
                        else if (segments[1] == "40")
                        {
                            if (submiterexist) {
                                xmlWriter.WriteEndElement();
                            }
                            submiterexist = false;
                            xmlWriter.WriteStartElement("receiver");
                            writeElement(segments, xmlWriter);
                            xmlWriter.WriteEndElement();
                        }
                        else if (segments[1] == "85")
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            billingproviderdetailsexist = true;
                            xmlWriter.WriteStartElement("billingproviderdetails");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "87")
                        {
                            xmlWriter.WriteEndElement();
                            xmlWriter.WriteStartElement("paytoaddress");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "PE")
                        {
                            xmlWriter.WriteEndElement();
                            xmlWriter.WriteStartElement("paytoplan");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "IL")
                        {
                            xmlWriter.WriteStartElement("subscriberinformation");
                            writeElement(segments, xmlWriter);
                            if (othersubscriberdetailsexist)
                            {
                                othersubscribernameexist = true;
                            }
                        }
                        else if (segments[1] == "PR")
                        {
                            xmlWriter.WriteEndElement();
                            xmlWriter.WriteStartElement("payer");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "QC")
                        {
                            xmlWriter.WriteStartElement("patientdetails");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "DN" || segments[1] == "P3")
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            xmlWriter.WriteStartElement("referingprovider");
                            referingproviderexist = true;
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "82")
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            xmlWriter.WriteStartElement("renderingprovider");
                            renderingproviderexist = true;
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "77")
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            servicefacilitylocationexist = true;
                            xmlWriter.WriteStartElement("servicefacilitylocation");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "DQ")
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            supervisingproviderexist = true;
                            xmlWriter.WriteStartElement("supervicingprovider");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "PW")
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            ambulancepickuplocationexist = true;
                            xmlWriter.WriteStartElement("ambulancepickuplocation");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "45")
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            ambulancedroplocationexist = true;
                            xmlWriter.WriteStartElement("ambulancedroplocation");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "QB")
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                         
                            DrugIdentificationExist = false;
                            othersubscriberdetailsexist = false;
                            othersubscribernameexist = false;
                            orderingproviderexist = false;
                            othersubscriberdetailsexist = true;
                            formidentificationcodeexist = false;
                            referingproviderexist = false;
                            renderingproviderexist = false;
                            purchasedserviceproviderexist = false;
                            servicefacilitylocationexist = false;
                            supervisingproviderexist = false;
                            ambulancepickuplocationexist = false;
                            ambulancedroplocationexist = false;
                            lineadjustmentexist = false;
                            purchasedserviceproviderexist = true;
                            xmlWriter.WriteStartElement("purchasedserviceprovider");
                            writeElement(segments, xmlWriter);
                        }
                        else if (segments[1] == "DK")
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            orderingproviderexist = true;
                            xmlWriter.WriteStartElement("orderingprovider");
                            writeElement(segments, xmlWriter);
                        }
                        break;


                    case "HL":
                        switch (segments[3])
                        {
                            case "20":
                                if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (submiterexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (servicelineexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (patientexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (subscriberexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (claimexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (billingproviderexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                DrugIdentificationExist = false;
                                submiterexist = false;
                                billingproviderexist = true;
                                servicelineexist = false;
                                referingproviderexist = false;
                                formidentificationcodeexist = false;
                                lineadjustmentexist = false;
                                orderingproviderexist = false;
                                purchasedserviceproviderexist = false;
                                othersubscriberdetailsexist = false;
                                othersubscribernameexist = false;
                                renderingproviderexist = false;
                                servicefacilitylocationexist = false;
                                supervisingproviderexist = false;
                                ambulancepickuplocationexist = false;
                                ambulancedroplocationexist = false;
                                subscriberexist = false;
                                patientexist = false;
                                claimexist = false;
                                xmlWriter.WriteStartElement("billingprovider");
                                xmlWriter.WriteAttributeString("id", segments[1]);
                                writeElement(segments, xmlWriter);
                                break;
                            case "22":
                                if (DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (servicelineexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (subscriberexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (patientexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                xmlWriter.WriteEndElement();
                                subscriberexist = true;
                                DrugIdentificationExist = false;
                                servicelineexist = false;
                                referingproviderexist = false;
                                formidentificationcodeexist = false;
                                lineadjustmentexist = false;
                                orderingproviderexist = false;
                                purchasedserviceproviderexist = false;
                                othersubscriberdetailsexist = false;
                                othersubscribernameexist = false;
                                renderingproviderexist = false;
                                billingproviderdetailsexist = false;
                                servicefacilitylocationexist = false;
                                supervisingproviderexist = false;
                                ambulancepickuplocationexist = false;
                                ambulancedroplocationexist = false;
                                patientexist = false;
                                claimexist = false;
                                othersubscribernameexist = false;
                                xmlWriter.WriteStartElement("subscriber");
                                xmlWriter.WriteAttributeString("id", segments[1]);
                                xmlWriter.WriteAttributeString("parentid", segments[2]);
                                writeElement(segments, xmlWriter);
                                break;
                            case "23":
                                xmlWriter.WriteEndElement();
                                if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (patientexist) {
                                    xmlWriter.WriteEndElement();
                                }
                                if (claimexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                if (servicelineexist)
                                {
                                    xmlWriter.WriteEndElement();
                                }
                                DrugIdentificationExist = false;
                                servicelineexist = false;
                                referingproviderexist = false;
                                formidentificationcodeexist = false;
                                lineadjustmentexist = false;
                                orderingproviderexist = false;
                                purchasedserviceproviderexist = false;
                                othersubscriberdetailsexist = false;
                                othersubscribernameexist = false;
                                renderingproviderexist = false;
                                servicefacilitylocationexist = false;
                                supervisingproviderexist = false;
                                ambulancepickuplocationexist = false;
                                ambulancedroplocationexist = false;
                                patientexist = true;
                                claimexist = false;
                                xmlWriter.WriteStartElement("patient");
                                xmlWriter.WriteAttributeString("id", segments[1]);
                                xmlWriter.WriteAttributeString("parentid", segments[2]);
                                writeElement(segments, xmlWriter);
                                break;
                        }
                        break;
                    case "CLM":
                        if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        if (servicelineexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        xmlWriter.WriteEndElement();
                        DrugIdentificationExist = false;
                        claimexist = true;
                        servicelineexist = false;
                        othersubscriberdetailsexist = false;
                        referingproviderexist = false;
                        renderingproviderexist = false;
                        servicefacilitylocationexist = false;
                        supervisingproviderexist = false;
                        ambulancepickuplocationexist = false;
                        ambulancedroplocationexist = false;
                        othersubscribernameexist = false;
                        formidentificationcodeexist = false;
                        orderingproviderexist = false;
                        lineadjustmentexist = false;
                        purchasedserviceproviderexist = false;
                        xmlWriter.WriteStartElement("Claim");
                        writeElement(segments, xmlWriter);
                        break;
                    case "SBR":
                        if (claimexist)
                        {
                            if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            if (othersubscriberdetailsexist)
                            {
                                xmlWriter.WriteEndElement();
                            }
                            DrugIdentificationExist = false;
                            othersubscribernameexist = false;
                            othersubscriberdetailsexist = true;
                            referingproviderexist = false;
                            orderingproviderexist = false;
                            renderingproviderexist = false;
                            servicefacilitylocationexist = false;
                            supervisingproviderexist = false;
                            ambulancepickuplocationexist = false;
                            ambulancedroplocationexist = false;
                            lineadjustmentexist = false;
                            formidentificationcodeexist = false;
                            xmlWriter.WriteStartElement("othersubscriberdetails");
                        }
                        writeElement(segments, xmlWriter);
                        break;
                    case "LX":
                        if (billingproviderdetailsexist||DrugIdentificationExist || referingproviderexist || lineadjustmentexist || formidentificationcodeexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        if (othersubscriberdetailsexist || servicelineexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        DrugIdentificationExist = false;
                        othersubscriberdetailsexist = false;
                        othersubscribernameexist = false;
                        orderingproviderexist = false;
                        othersubscriberdetailsexist = true;
                        formidentificationcodeexist = false;
                        referingproviderexist = false;
                        renderingproviderexist = false;
                        purchasedserviceproviderexist = false;
                        servicefacilitylocationexist = false;
                        supervisingproviderexist = false;
                        ambulancepickuplocationexist = false;
                        ambulancedroplocationexist = false;
                        lineadjustmentexist = false;
                        servicelineexist = true;
                        xmlWriter.WriteStartElement("serviceline");
                        writeElement(segments, xmlWriter);
                        break;
                    case "SVD":
                        if (DrugIdentificationExist||referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        lineadjustmentexist = true;
                        xmlWriter.WriteStartElement("lineadjustment");
                        writeElement(segments, xmlWriter);
                        break;
                    case "LQ":
                        if (DrugIdentificationExist||referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        formidentificationcodeexist = true;
                        xmlWriter.WriteStartElement("formidentificationcode");
                        writeElement(segments, xmlWriter);
                        break;
                    case "LIN":
                        if (DrugIdentificationExist || referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        DrugIdentificationExist = true;
                        xmlWriter.WriteStartElement("drugIdentification");
                        writeElement(segments, xmlWriter);
                        break;
                    case "SE":
                        if (DrugIdentificationExist||referingproviderexist || formidentificationcodeexist || lineadjustmentexist || orderingproviderexist || purchasedserviceproviderexist || othersubscribernameexist || renderingproviderexist || servicefacilitylocationexist || supervisingproviderexist || ambulancepickuplocationexist || ambulancedroplocationexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        if (servicelineexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        if (claimexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        if (patientexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        if (subscriberexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        if (billingproviderexist)
                        {
                            xmlWriter.WriteEndElement();
                        }
                        xmlWriter.WriteStartElement("actualsegmentcount");
                        xmlWriter.WriteString(""+numberofSegmentspertran);
                        xmlWriter.WriteEndElement();
                        DrugIdentificationExist = false;
                        billingproviderexist = false;
                        billingproviderdetailsexist = false;
                        patientexist = false;
                        subscriberexist = false;
                        orderingproviderexist = false;
                        servicelineexist = false;
                        ambulancedroplocationexist = false;
                        othersubscribernameexist = false;
                        othersubscriberdetailsexist = false;
                        supervisingproviderexist = false;
                        servicefacilitylocationexist = false;
                        renderingproviderexist = false;
                        purchasedserviceproviderexist = false;
                        claimexist = false;
                        lineadjustmentexist = false;
                        formidentificationcodeexist = false;
                        referingproviderexist = false;
                        ambulancepickuplocationexist = false;
                        writeElement(segments, xmlWriter);
                        xmlWriter.WriteEndElement();
                        break;
                    case "GE":
                        writeElement(segments, xmlWriter);
                        xmlWriter.WriteEndElement();
                        break;
                    case "":
                        break;
                    default:
                        writeElement(segments, xmlWriter);
                        break;
                }
            }
            xmlWriter.WriteEndDocument();
            xmlWriter.Flush();
            xmlWriter.Close();
            xmlWriter.Dispose();
            return xmlpath;
        }
        static void writeElement(string[] segments, XmlWriter xmlWriter)
        {
            int i = 0;
            if (segments[0] == "IEA")
            {

            }
            xmlWriter.WriteStartElement(segments[0]);
            foreach (string segment in segments)
            {
                if (i != 0)
                {
                    xmlWriter.WriteStartElement(segments[0] + i);
                    xmlWriter.WriteString(segment);
                    xmlWriter.WriteEndElement();
                }
                i++;
            }
            xmlWriter.WriteEndElement();
        }

        [HttpPost]
        [Route("addProvider")]
        public async Task<IHttpActionResult> addPorvider([FromBody]ProviderModel model) {
            var added = await this._db.addProvider(model);
            //if (added)
            //{
                return Ok("organization " + model.basicinformation.providerid + " has been added");
            //}
            //else
            //{
            //    return InternalServerError();
            //}
        }

        [HttpPost]
        [Route("addOrganization")]
        public async Task<IHttpActionResult> addOrganization([FromBody]OrganizationModel model) {
            var added=await this._db.addOrganization(model);
            if (added)
            {
                return Ok("organization "+model.organizationID+" has been added");
            }
            else {
                return InternalServerError();
            }
        }
        [HttpGet]
        [Route("GetBenefitMaster")]
        public async Task<IHttpActionResult> GetBenefitMaster()
        {
            var data = await this._db.searchBenefitMaster();
            return Ok(data);
        }
        [HttpPost]
        [Route("SearchOrganization")]
        public async Task<IHttpActionResult> searchOrganization([FromUri]string searchquery) {
            var exist = await this._db.searchOrganization(searchquery);
            return Ok(exist);
        }
    }
}

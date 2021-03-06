using EDIToDBLoaderService.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using System.Xml.Serialization;

namespace EDIToDBLoaderService
{
    
    public class EDIToDb
    {
        private readonly Timer _timer;
        public EDIToDb() {
            _timer = new Timer(36000000) { AutoReset = true };
            _timer.Elapsed += SaveData;
        }

        private void SaveData(object sender, ElapsedEventArgs e)
        {
            string path = @"C:\Users\saikiran\Documents\EDIFile\forjob";
            DirectoryInfo d = new DirectoryInfo(path);
            foreach (FileInfo file in d.GetFiles())
            {
                XmlSerializer serializer = new XmlSerializer(typeof(EDIModel));
                StreamReader sr = new StreamReader(path+@"\"+file.Name);
                EDIModel ediModel = (EDIModel)serializer.Deserialize(sr);
                if (ediModel.Group.Length == ediModel.IEA.IEA1)
                {
                    InsertClaim(ediModel,Int32.Parse(Path.GetFileNameWithoutExtension(file.Name)));
                }
            }
        }
        public void InsertClaim(EDIModel model, int fileid)
        {
            foreach (Group group in model.Group)
            {
                if (group.Transaction.Length == group.GE.GE1)
                {
                    foreach (Transaction transaction in group.Transaction)
                    {
                        if (transaction.actualsegmentcount == transaction.SE.SE1)
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
                                cmd.ExecuteNonQuery();
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
                                    cmd.ExecuteNonQuery();
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

                                        cmd.ExecuteNonQuery();
                                    }
                                    insertClaim(billingProvder.subscriber[i].Claim, fileid, transaction, billingProvder.subscriber[i].SubscriberDetails.NM1.NM19, billingProvder.subscriber[i].HL.HL1);
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
                                            cmd.ExecuteNonQuery();
                                        }
                                         insertClaim(billingProvder.subscriber[i].patient[j].Claim, fileid, transaction, billingProvder.subscriber[i].SubscriberDetails.NM1.NM19, billingProvder.subscriber[i].patient[j].HL.HL1);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        public void insertClaim(Claims[] claims, int fileid, Transaction transaction, string SubscriberId, string subscriberpatientloopid)
        {
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
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_2_DTP01", claims[k].DTP[l].DTP1);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_2_DTP02", claims[k].DTP[l].DTP2);
                                cmd.Parameters.AddWithValue("@L2300_1_DTP_2_DTP03", claims[k].DTP[l].DTP3);
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
                        cmd.Parameters.AddWithValue("@L2300_1_PWK_" + (l + 1) + "_PWK01", claims[k].PWK[l].PWK1);
                        cmd.Parameters.AddWithValue("@L2300_1_PWK_" + (l + 1) + "_PWK02", claims[k].PWK[l].PWK2);
                        cmd.Parameters.AddWithValue("@L2300_1_PWK_" + (l + 1) + "_PWK06", claims[k].PWK[l].PWK6);
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
                                cmd.Parameters.AddWithValue("@L2300_1_REF_1_REF01", claims[k].REF[l].REF1);
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
                        switch (claims[k].ReferingProvider[l].NM1.NM11)
                        {
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
                                    switch (claims[k].ReferingProvider[l].REF[m].REF1)
                                    {
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
                        switch (claims[k].RenderingProvider.REF[l].REF1)
                        {
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
                    for (int l = 0; l < claims[k].ServiceFacilityLocation.REF.Length && l < 3; l++)
                    {
                        switch (claims[k].ServiceFacilityLocation.REF[l].REF1)
                        {
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
                        switch (claims[k].supervicingProvider.REF[l].REF1)
                        {
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
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR03", claims[k].otherSubscriberDetails[l].SBR.SBR3);
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR04", claims[k].otherSubscriberDetails[l].SBR.SBR4);
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR05", claims[k].otherSubscriberDetails[l].SBR.SBR5);
                        cmd.Parameters.AddWithValue("@L2320_1_SBR_1_SBR09", claims[k].otherSubscriberDetails[l].SBR.SBR9);
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].CAS.Length && m < 5; m++)
                        {
                            switch (claims[k].otherSubscriberDetails[l].CAS[m].CAS1)
                            {
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
                        cmd.Parameters.AddWithValue("@L2320_1_OI_1_OI03", claims[k].otherSubscriberDetails[l].OI.OI3);
                        cmd.Parameters.AddWithValue("@L2320_1_OI_1_OI04", claims[k].otherSubscriberDetails[l].OI.OI4);
                        cmd.Parameters.AddWithValue("@L2320_1_OI_1_OI06", claims[k].otherSubscriberDetails[l].OI.OI6);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA01", claims[k].otherSubscriberDetails[l].MOA.MOA1);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA02", claims[k].otherSubscriberDetails[l].MOA.MOA2);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA03", claims[k].otherSubscriberDetails[l].MOA.MOA3);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA04", claims[k].otherSubscriberDetails[l].MOA.MOA4);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA05", claims[k].otherSubscriberDetails[l].MOA.MOA5);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA06", claims[k].otherSubscriberDetails[l].MOA.MOA6);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA07", claims[k].otherSubscriberDetails[l].MOA.MOA7);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA08", claims[k].otherSubscriberDetails[l].MOA.MOA8);
                        cmd.Parameters.AddWithValue("@L2320_1_MOA_1_MOA09", claims[k].otherSubscriberDetails[l].MOA.MOA9);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM101", claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM102", claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM103", claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM13);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM104", claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM14);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM105", claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM15);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM107", claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM17);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM108", claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM18);
                        cmd.Parameters.AddWithValue("@L2330A_1_NM1_1_NM109", claims[k].otherSubscriberDetails[l].otherSubscriber.NM1.NM19);
                        cmd.Parameters.AddWithValue("@L2330A_1_N3_1_N301", claims[k].otherSubscriberDetails[l].otherSubscriber.N3.N31);
                        cmd.Parameters.AddWithValue("@L2330A_1_N3_1_N302", claims[k].otherSubscriberDetails[l].otherSubscriber.N3.N32);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N401", claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N41);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N402", claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N42);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N403", claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N43);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N404", claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N44);
                        cmd.Parameters.AddWithValue("@L2330A_1_N4_1_N407", claims[k].otherSubscriberDetails[l].otherSubscriber.N4.N47);
                        cmd.Parameters.AddWithValue("@L2330A_1_REF_1_REF01", claims[k].otherSubscriberDetails[l].otherSubscriber.REF.REF1);
                        cmd.Parameters.AddWithValue("@L2330A_1_REF_1_REF02", claims[k].otherSubscriberDetails[l].otherSubscriber.REF.REF2);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM101", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM102", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM12);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM103", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM13);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM108", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM18);
                        cmd.Parameters.AddWithValue("@L2330B_1_NM1_1_NM109", claims[k].otherSubscriberDetails[l].otherPayerName.NM1.NM19);
                        cmd.Parameters.AddWithValue("@L2330B_1_N3_1_N301", claims[k].otherSubscriberDetails[l].otherPayerName.N3.N31);
                        cmd.Parameters.AddWithValue("@L2330B_1_N3_1_N302", claims[k].otherSubscriberDetails[l].otherPayerName.N3.N32);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N401", claims[k].otherSubscriberDetails[l].otherPayerName.N4.N41);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N402", claims[k].otherSubscriberDetails[l].otherPayerName.N4.N42);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N403", claims[k].otherSubscriberDetails[l].otherPayerName.N4.N43);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N404", claims[k].otherSubscriberDetails[l].otherPayerName.N4.N44);
                        cmd.Parameters.AddWithValue("@L2330B_1_N4_1_N407", claims[k].otherSubscriberDetails[l].otherPayerName.N4.N47);
                        cmd.Parameters.AddWithValue("@L2330B_1_DTP_1_DTP01", claims[k].otherSubscriberDetails[l].otherPayerName.DTP.DTP1);
                        cmd.Parameters.AddWithValue("@L2330B_1_DTP_1_DTP02", claims[k].otherSubscriberDetails[l].otherPayerName.DTP.DTP2);
                        cmd.Parameters.AddWithValue("@L2330B_1_DTP_1_DTP03", claims[k].otherSubscriberDetails[l].otherPayerName.DTP.DTP3);
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].otherPayerName.REF.Length && m < 8; m++)
                        {
                            switch (claims[k].otherSubscriberDetails[l].otherPayerName.REF[m].REF1)
                            {
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
                            switch (claims[k].otherSubscriberDetails[l].otherPayerReferingProvider[m].NM1.NM11)
                            {
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
                            switch (claims[k].otherSubscriberDetails[l].otherPayerRenderingProvider.REF[m].REF1)
                            {
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
                        cmd.Parameters.AddWithValue("@L2330E_1_NM1_1_NM101", claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330E_1_NM1_1_NM102", claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.NM1.NM12);
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF.Length && m < 3; m++)
                        {
                            switch (claims[k].otherSubscriberDetails[l].OtherPayerServiceFacilitylocation.REF[m].REF1)
                            {
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
                        cmd.Parameters.AddWithValue("@L2330F_1_NM1_1_NM101", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.NM1.NM11);
                        cmd.Parameters.AddWithValue("@L2330F_1_NM1_1_NM102", claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.NM1.NM12);
                        for (int m = 0; m < claims[k].otherSubscriberDetails[l].OtherPayerSupervicingProvider.REF.Length && m < 4; m++)
                        {
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
                        for (int m = 0; m < claims[k].ServiceLine[l].DTP.Length && m < 10; m++)
                        {
                            cmd.Parameters.AddWithValue("@L2400_1_DTP_" + (m + 1) + "_DTP01", claims[k].ServiceLine[l].DTP[m].DTP1);
                            cmd.Parameters.AddWithValue("@L2400_1_DTP_" + (m + 1) + "_DTP02", claims[k].ServiceLine[l].DTP[m].DTP2);
                            cmd.Parameters.AddWithValue("@L2400_1_DTP_" + (m + 1) + "_DTP03", claims[k].ServiceLine[l].DTP[m].DTP3);
                        }
                        for (int m = 0; m < claims[k].ServiceLine[l].QTY.Length; m++)
                        {
                            switch (claims[k].ServiceLine[l].QTY[m].QTY1)
                            {
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
                        for (int m = 0; m < claims[k].ServiceLine[l].REF.Length && m < 17; m++)
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
                            switch (claims[k].ServiceLine[l].NTE[m].NTE1)
                            {
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
                            switch (claims[k].ServiceLine[l].referingProvider[m].NM1.NM11)
                            {
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
                                cmd.Parameters.AddWithValue("@formidentification", formidentificationid);
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
        public void start() {
            _timer.Start();
        }
        public void stop() {
            _timer.Stop();
        }
    }
}

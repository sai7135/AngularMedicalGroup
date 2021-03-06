using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace EDIToDBLoaderService.Model
{
    [XmlRoot("Data")]
    public class EDIModel
    {
            [XmlElement("ISA")]
            public ISA ISA { get; set; } = new ISA();
            [XmlElement("IEA")]
            public IEA IEA { get; set; } = new IEA();
            Group[] group;
            [XmlElement("Group")]
            public Group[] Group
            {
                get
                {
                    if (group == null)
                    {
                        return new Group[] { };
                    }
                    return group;
                }
                set
                {
                    group = value;
                }
            }
        }
        public class IEA
        {
            [XmlElement("IEA1")]
            public int IEA1 { get; set; }
            [XmlElement("IEA2")]
            public string IEA2 { get; set; }
        }
        public class ISA
        {
            [XmlElement("ISA1")]
            public string ISA1 { get; set; }
            [XmlElement("ISA2")]
            public string ISA2 { get; set; }
            [XmlElement("ISA3")]
            public string ISA3 { get; set; }
            [XmlElement("ISA4")]
            public string ISA4 { get; set; }
            [XmlElement("ISA5")]
            public string ISA5 { get; set; }
            [XmlElement("ISA6")]
            public string ISA6 { get; set; }
            [XmlElement("ISA7")]
            public string ISA7 { get; set; }
            [XmlElement("ISA8")]
            public string ISA8 { get; set; }
            [XmlElement("ISA9")]
            public string ISA9 { get; set; }
            [XmlElement("ISA10")]
            public string ISA10 { get; set; }
            [XmlElement("ISA11")]
            public string ISA11 { get; set; }
            [XmlElement("ISA12")]
            public string ISA12 { get; set; }
            [XmlElement("ISA13")]
            public string ISA13 { get; set; }
            [XmlElement("ISA14")]
            public string ISA14 { get; set; }
            [XmlElement("ISA15")]
            public string ISA15 { get; set; }
            [XmlElement("ISA16")]
            public string ISA16 { get; set; }
        }
        public class Group
        {
            [XmlElement("GS")]
            public GS GS { get; set; } = new GS();
            Transaction[] transaction;
            [XmlElement("GE")]
            public GE GE { get; set; } = new GE();
            [XmlElement("Transaction")]
            public Transaction[] Transaction
            {
                get
                {
                    if (transaction == null)
                    {
                        return new Transaction[] { };
                    }
                    return transaction;
                }
                set
                {
                    transaction = value;
                }
            }
        }
        public class GE
        {
            [XmlElement("GE1")]
            public int GE1 { get; set; }
            [XmlElement("GE2")]
            public string GE2 { get; set; }
        }
        public class GS
        {
            [XmlElement("GS1")]
            public string GS1 { get; set; }
            [XmlElement("GS2")]
            public string GS2 { get; set; }
            [XmlElement("GS3")]
            public string GS3 { get; set; }
            [XmlElement("GS4")]
            public string GS4 { get; set; }
            [XmlElement("GS5")]
            public string GS5 { get; set; }
            [XmlElement("GS6")]
            public string GS6 { get; set; }
            [XmlElement("GS7")]
            public string GS7 { get; set; }
            [XmlElement("GS8")]
            public string GS8 { get; set; }
        }
        public class ST
        {
            [XmlElement("ST1")]
            public string ST1 { get; set; }
            [XmlElement("ST2")]
            public string ST2 { get; set; }
            [XmlElement("ST3")]
            public string ST3 { get; set; }
        }
        public class BHT
        {
            [XmlElement("BHT1")]
            public string BHT1 { get; set; }
            [XmlElement("BHT2")]
            public string BHT2 { get; set; }
            [XmlElement("BHT3")]
            public string BHT3 { get; set; }
            [XmlElement("BHT4")]
            public string BHT4 { get; set; }
            [XmlElement("BHT5")]
            public string BHT5 { get; set; }
            [XmlElement("BHT6")]
            public string BHT6 { get; set; }

        }
        public class Transaction
        {
            public ST ST { get; set; } = new ST();
            [XmlElement("BHT")]
            public BHT BHT { get; set; } = new BHT();
            [XmlElement("actualsegmentcount")]
            public int actualsegmentcount;
            public Submitter submitter { get; set; } = new Submitter();
            [XmlElement("receiver")]
            public Receiver receiver { get; set; } = new Receiver();
            BillingProvider[] billingprovider;
            [XmlElement("billingprovider")]
            public BillingProvider[] BillingProvider
            {
                get
                {
                    if (billingprovider == null)
                    {
                        return new BillingProvider[] { };
                    }
                    return billingprovider;
                }
                set
                {
                    billingprovider = value;
                }
            }
            [XmlElement("SE")]
            public SE SE { get; set; } = new SE();
        }
        public class SE
        {
            [XmlElement("SE1")]
            public int SE1 { get; set; }
            [XmlElement("SE2")]
            public string SE2 { get; set; }
        }
        public class NM1
        {
            [XmlElement("NM11")]
            public string NM11 { get; set; }
            [XmlElement("NM12")]
            public string NM12 { get; set; }
            [XmlElement("NM13")]
            public string NM13 { get; set; }
            [XmlElement("NM14")]
            public string NM14 { get; set; }
            [XmlElement("NM15")]
            public string NM15 { get; set; }
            [XmlElement("NM16")]
            public string NM16 { get; set; }
            [XmlElement("NM17")]
            public string NM17 { get; set; }
            [XmlElement("NM18")]
            public string NM18 { get; set; }
            [XmlElement("NM19")]
            public string NM19 { get; set; }
            [XmlElement("NM110")]
            public string NM110 { get; set; }
            [XmlElement("NM111")]
            public string NM111 { get; set; }
            [XmlElement("NM112")]
            public string NM112 { get; set; }
        }
        public class Receiver
        {
            public NM1 NM1 { get; set; } = new NM1();
        }
        public class PER
        {

            [XmlElement("PER1")]
            public string PER1 { get; set; }
            [XmlElement("PER2")]
            public string PER2 { get; set; }
            [XmlElement("PER3")]
            public string PER3 { get; set; }
            [XmlElement("PER4")]
            public string PER4 { get; set; }
            [XmlElement("PER5")]
            public string PER5 { get; set; }
            [XmlElement("PER6")]
            public string PER6 { get; set; }
            [XmlElement("PER7")]
            public string PER7 { get; set; }
            [XmlElement("PER8")]
            public string PER8 { get; set; }
            [XmlElement("PER9")]
            public string PER9 { get; set; }
        }
        public class Submitter
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            PER[] per;
            [XmlElement("PER")]
            public PER[] PER
            {
                get
                {
                    if (per == null)
                    {
                        return new PER[] { };
                    }
                    return per;
                }
                set
                {
                    per = value;
                }
            }
        }
        public class HL
        {

            [XmlElement("HL1")]
            public string HL1 { get; set; }
            [XmlElement("HL2")]
            public string HL2 { get; set; }
            [XmlElement("HL3")]
            public string HL3 { get; set; }
            [XmlElement("HL4")]
            public string HL4 { get; set; }
        }
        public class SBR
        {

            [XmlElement("SBR1")]
            public string SBR1 { get; set; }
            [XmlElement("SBR2")]
            public string SBR2 { get; set; }
            [XmlElement("SBR3")]
            public string SBR3 { get; set; }
            [XmlElement("SBR4")]
            public string SBR4 { get; set; }
            [XmlElement("SBR5")]
            public string SBR5 { get; set; }
            [XmlElement("SBR6")]
            public string SBR6 { get; set; }
            [XmlElement("SBR7")]
            public string SBR7 { get; set; }
            [XmlElement("SBR8")]
            public string SBR8 { get; set; }
            [XmlElement("SBR9")]
            public string SBR9 { get; set; }
        }
        public class PAT
        {
            [XmlElement("PAT1")]
            public string PAT1 { get; set; }
            [XmlElement("PAT2")]
            public string PAT2 { get; set; }
            [XmlElement("PAT3")]
            public string PAT3 { get; set; }
            [XmlElement("PAT4")]
            public string PAT4 { get; set; }
            [XmlElement("PAT5")]
            public string PAT5 { get; set; }
            [XmlElement("PAT6")]
            public string PAT6 { get; set; }
            [XmlElement("PAT7")]
            public string PAT7 { get; set; }
            [XmlElement("PAT8")]
            public string PAT8 { get; set; }
            [XmlElement("PAT9")]
            public string PAT9 { get; set; }

        }
        public class Subscriber
        {
            [XmlElement("HL")]
            public HL HL { get; set; } = new HL();
            [XmlElement("SBR")]
            public SBR SBR { get; set; } = new SBR();
            [XmlElement("PAT")]
            public PAT PAT { get; set; } = new PAT();
            [XmlElement("subscriberinformation")]
            public SubscriberDetails SubscriberDetails { get; set; } = new SubscriberDetails();
            [XmlElement("payer")]
            public Payer payer { get; set; } = new Payer();
            Patient[] _patient;
            [XmlElement("patient")]
            public Patient[] patient
            {
                get
                {
                    if (_patient == null)
                    {
                        return new Patient[] { };
                    }
                    return _patient;
                }
                set
                {
                    _patient = value;
                }
            }
            Claims[] claim;
            [XmlElement("Claim")]
            public Claims[] Claim
            {
                get
                {
                    if (claim == null)
                    {
                        return new Claims[] { };
                    }
                    return claim;
                }
                set
                {
                    claim = value;
                }
            }
        }
        public class N3
        {
            [XmlElement("N31")]
            public string N31 { get; set; }
            [XmlElement("N32")]
            public string N32 { get; set; }
        }
        public class N4
        {
            [XmlElement("N41")]
            public string N41 { get; set; }
            [XmlElement("N42")]
            public string N42 { get; set; }
            [XmlElement("N43")]
            public string N43 { get; set; }
            [XmlElement("N44")]
            public string N44 { get; set; }
            [XmlElement("N45")]
            public string N45 { get; set; }
            [XmlElement("N46")]
            public string N46 { get; set; }
            [XmlElement("N47")]
            public string N47 { get; set; }

        }
        public class Payer
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
        }
        public class REF
        {
            [XmlElement("REF1")]
            public string REF1 { get; set; }
            [XmlElement("REF2")]
            public string REF2 { get; set; }
            [XmlElement("REF3")]
            public string REF3 { get; set; }
            [XmlElement("REF4")]
            public string REF4 { get; set; }

        }
        public class Patient
        {
            [XmlElement("HL")]
            public HL HL { get; set; } = new HL();
            [XmlElement("PAT")]
            public PAT PAT { get; set; } = new PAT();
            [XmlElement("patientdetails")]
            public PatientDetails patientdetails { get; set; } = new PatientDetails();
            Claims[] claim;
            [XmlElement("Claim")]
            public Claims[] Claim
            {
                get
                {
                    if (claim == null)
                    {
                        return new Claims[] { };
                    }
                    return claim;
                }
                set
                {
                    claim = value;
                }
            }
        }
        public class DMG
        {
            public string DMG1 { get; set; }
            [XmlElement("DMG2")]
            public string DMG2 { get; set; }
            [XmlElement("DMG3")]
            public string DMG3 { get; set; }
            [XmlElement("DMG4")]
            public string DMG4 { get; set; }
            [XmlElement("DMG5")]
            public string DMG5 { get; set; }
            [XmlElement("DMG6")]
            public string DMG6 { get; set; }
            [XmlElement("DMG7")]
            public string DMG7 { get; set; }
            [XmlElement("DMG8")]
            public string DMG8 { get; set; }
            [XmlElement("DMG9")]
            public string DMG9 { get; set; }
            [XmlElement("DMG10")]
            public string DMG10 { get; set; }
            [XmlElement("DMG11")]
            public string DMG11 { get; set; }

        }
        public class PatientDetails
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            [XmlElement("DMG")]
            public DMG DMG { get; set; } = new DMG();
            [XmlElement("REF")]
            public REF REF { get; set; } = new REF();
            [XmlElement("PER")]
            public PER PER { get; set; } = new PER();
        }
        public class CLM
        {
            [XmlElement("CLM1")]
            public string CLM1 { get; set; }
            [XmlElement("CLM2")]
            public string CLM2 { get; set; }
            [XmlElement("CLM3")]
            public string CLM3 { get; set; }
            [XmlElement("CLM4")]
            public string CLM4 { get; set; }
            [XmlElement("CLM5")]
            public string CLM5 { get; set; }
            [XmlElement("CLM6")]
            public string CLM6 { get; set; }
            [XmlElement("CLM7")]
            public string CLM7 { get; set; }
            [XmlElement("CLM8")]
            public string CLM8 { get; set; }
            [XmlElement("CLM9")]
            public string CLM9 { get; set; }
            [XmlElement("CLM10")]
            public string CLM10 { get; set; }
            [XmlElement("CLM11")]
            public string CLM11 { get; set; }
            [XmlElement("CLM12")]
            public string CLM12 { get; set; }
            [XmlElement("CLM13")]
            public string CLM13 { get; set; }
            [XmlElement("CLM14")]
            public string CLM14 { get; set; }
            [XmlElement("CLM15")]
            public string CLM15 { get; set; }
            [XmlElement("CLM16")]
            public string CLM16 { get; set; }
            [XmlElement("CLM17")]
            public string CLM17 { get; set; }
            [XmlElement("CLM18")]
            public string CLM18 { get; set; }
            [XmlElement("CLM19")]
            public string CLM19 { get; set; }
            [XmlElement("CLM20")]
            public string CLM20 { get; set; }

        }
        public class DTP
        {
            [XmlElement("DTP1")]
            public string DTP1 { get; set; }
            [XmlElement("DTP2")]
            public string DTP2 { get; set; }
            [XmlElement("DTP3")]
            public string DTP3 { get; set; }

        }
        public class PWK
        {

            [XmlElement("PWK1")]
            public string PWK1 { get; set; }
            [XmlElement("PWK2")]
            public string PWK2 { get; set; }
            [XmlElement("PWK3")]
            public string PWK3 { get; set; }
            [XmlElement("PWK4")]
            public string PWK4 { get; set; }
            [XmlElement("PWK5")]
            public string PWK5 { get; set; }
            [XmlElement("PWK6")]
            public string PWK6 { get; set; }
            [XmlElement("PWK7")]
            public string PWK7 { get; set; }
            [XmlElement("PWK8")]
            public string PWK8 { get; set; }
            [XmlElement("PWK9")]
            public string PWK9 { get; set; }
        }
        public class CN1
        {
            [XmlElement("CN11")]
            public string CN11 { get; set; }
            [XmlElement("CN12")]
            public string CN12 { get; set; }
            [XmlElement("CN13")]
            public string CN13 { get; set; }
            [XmlElement("CN14")]
            public string CN14 { get; set; }
            [XmlElement("CN15")]
            public string CN15 { get; set; }
            [XmlElement("CN16")]
            public string CN16 { get; set; }

        }
        public class AMT
        {

            [XmlElement("AMT1")]
            public string AMT1 { get; set; }
            [XmlElement("AMT2")]
            public string AMT2 { get; set; }
            [XmlElement("AMT3")]
            public string AMT3 { get; set; }
        }
        public class K3
        {
            [XmlElement("K31")]
            public string K31 { get; set; }
            [XmlElement("K32")]
            public string K32 { get; set; }

            [XmlElement("K33")]
            public string K33 { get; set; }

        }
        public class NTE
        {

            [XmlElement("NTE1")]
            public string NTE1 { get; set; }
            [XmlElement("NTE2")]
            public string NTE2 { get; set; }
        }
        public class CR1
        {
            [XmlElement("CR11")]
            public string CR11 { get; set; }
            [XmlElement("CR12")]
            public string CR12 { get; set; }
            [XmlElement("CR13")]
            public string CR13 { get; set; }
            [XmlElement("CR14")]
            public string CR14 { get; set; }
            [XmlElement("CR15")]
            public string CR15 { get; set; }
            [XmlElement("CR16")]
            public string CR16 { get; set; }
            [XmlElement("CR17")]
            public string CR17 { get; set; }
            [XmlElement("CR18")]
            public string CR18 { get; set; }
            [XmlElement("CR19")]
            public string CR19 { get; set; }
            [XmlElement("CR110")]
            public string CR110 { get; set; }
        }
        public class CR2
        {
            [XmlElement("CR21")]
            public string CR21 { get; set; }
            [XmlElement("CR22")]
            public string CR22 { get; set; }
            [XmlElement("CR23")]
            public string CR23 { get; set; }
            [XmlElement("CR24")]
            public string CR24 { get; set; }
            [XmlElement("CR25")]
            public string CR25 { get; set; }
            [XmlElement("CR26")]
            public string CR26 { get; set; }
            [XmlElement("CR27")]
            public string CR27 { get; set; }
            [XmlElement("CR28")]
            public string CR28 { get; set; }
            [XmlElement("CR29")]
            public string CR29 { get; set; }
            [XmlElement("CR210")]
            public string CR210 { get; set; }
            [XmlElement("CR211")]
            public string CR211 { get; set; }
            [XmlElement("CR212")]
            public string CR212 { get; set; }

        }
        public class CRC
        {
            [XmlElement("CRC1")]
            public string CRC1 { get; set; }
            [XmlElement("CRC2")]
            public string CRC2 { get; set; }
            [XmlElement("CRC3")]
            public string CRC3 { get; set; }
            [XmlElement("CRC4")]
            public string CRC4 { get; set; }
            [XmlElement("CRC5")]
            public string CRC5 { get; set; }
            [XmlElement("CRC6")]
            public string CRC6 { get; set; }
            [XmlElement("CRC7")]
            public string CRC7 { get; set; }

        }
        public class HI
        {
            [XmlElement("HI1")]
            public string HI1 { get; set; }
            [XmlElement("HI2")]
            public string HI2 { get; set; }
            [XmlElement("HI3")]
            public string HI3 { get; set; }
            [XmlElement("HI4")]
            public string HI4 { get; set; }
            [XmlElement("HI5")]
            public string HI5 { get; set; }
            [XmlElement("HI6")]
            public string HI6 { get; set; }
            [XmlElement("HI7")]
            public string HI7 { get; set; }
            [XmlElement("HI8")]
            public string HI8 { get; set; }
            [XmlElement("HI9")]
            public string HI9 { get; set; }
            [XmlElement("HI10")]
            public string HI10 { get; set; }
            [XmlElement("HI11")]
            public string HI11 { get; set; }
            [XmlElement("HI12")]
            public string HI12 { get; set; }

        }
        public class HCP
        {
            [XmlElement("HCP1")]
            public string HCP1 { get; set; }
            [XmlElement("HCP2")]
            public string HCP2 { get; set; }
            [XmlElement("HCP3")]
            public string HCP3 { get; set; }
            [XmlElement("HCP4")]
            public string HCP4 { get; set; }
            [XmlElement("HCP5")]
            public string HCP5 { get; set; }
            [XmlElement("HCP6")]
            public string HCP6 { get; set; }
            [XmlElement("HCP7")]
            public string HCP7 { get; set; }
            [XmlElement("HCP8")]
            public string HCP8 { get; set; }
            [XmlElement("HCP9")]
            public string HCP9 { get; set; }
            [XmlElement("HCP10")]
            public string HCP10 { get; set; }
            [XmlElement("HCP11")]
            public string HCP11 { get; set; }
            [XmlElement("HCP12")]
            public string HCP12 { get; set; }
            [XmlElement("HCP13")]
            public string HCP13 { get; set; }
            [XmlElement("HCP14")]
            public string HCP14 { get; set; }
            [XmlElement("HCP15")]
            public string HCP15 { get; set; }

        }
        public class Claims
        {
            [XmlElement("CLM")]
            public CLM CLM { get; set; } = new CLM();
            DTP[] dtp;
            [XmlElement("DTP")]
            public DTP[] DTP
            {
                get
                {
                    if (dtp == null)
                    {
                        return new DTP[] { };
                    }
                    return dtp;
                }
                set
                {
                    dtp = value;
                }
            }
            PWK[] pwk;
            [XmlElement("PWK")]
            public PWK[] PWK
            {
                get
                {
                    if (pwk == null)
                    {
                        return new PWK[] { };
                    }
                    return pwk;
                }
                set
                {
                    pwk = value;
                }
            }
            [XmlElement("CN1")]
            public CN1 CN1 { get; set; } = new CN1();
            [XmlElement("AMT")]
            public AMT AMT { get; set; } = new AMT();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
            K3[] k3;
            [XmlElement("K3")]
            public K3[] K3
            {
                get
                {
                    if (k3 == null)
                    {
                        return new K3[] { };
                    }
                    return k3;
                }
                set
                {
                    k3 = value;
                }
            }
            [XmlElement("NTE")]
            public NTE NTE { get; set; } = new NTE();
            [XmlElement("CR1")]
            public CR1 CR1 { get; set; } = new CR1();
            [XmlElement("CR2")]
            public CR2 CR2 { get; set; } = new CR2();
            CRC[] crc;
            [XmlElement("CRC")]
            public CRC[] CRC
            {
                get
                {
                    if (crc == null)
                    {
                        return new CRC[] { };
                    }
                    return crc;
                }
                set
                {
                    crc = value;
                }
            }
            HI[] hi;
            [XmlElement("HI")]
            public HI[] HI
            {
                get
                {
                    if (hi == null)
                    {
                        return new HI[] { };
                    }
                    return hi;
                }
                set
                {
                    hi = value;
                }
            }
            [XmlElement("HCP")]
            public HCP HCP { get; set; } = new HCP();
            ReferingProvider[] referingprovider;
            [XmlElement("referingprovider")]
            public ReferingProvider[] ReferingProvider
            {
                get
                {
                    if (referingprovider == null)
                    {
                        return new ReferingProvider[] { };
                    }
                    return referingprovider;
                }
                set
                {
                    referingprovider = value;
                }
            }
            [XmlElement("renderingprovider")]
            public RenderingProvider RenderingProvider { get; set; } = new RenderingProvider();
            [XmlElement("servicefacilitylocation")]
            public ServiceFacilityLocation ServiceFacilityLocation { get; set; } = new ServiceFacilityLocation();
            [XmlElement("supervicingprovider")]
            public SupervicingProvider supervicingProvider { get; set; } = new SupervicingProvider();
            [XmlElement("ambulancedroplocation")]
            public AmbulanceDropLocation AmbulanceDropLocation { get; set; } = new AmbulanceDropLocation();
            [XmlElement("ambulancepickuplocation")]
            public AmbulancePickUpLocation AmbulancePickupLocation { get; set; } = new AmbulancePickUpLocation();
            OtherSubscriberDetails[] _otherSubscriberDetails;
            [XmlElement("othersubscriberdetails")]
            public OtherSubscriberDetails[] otherSubscriberDetails
            {
                get
                {
                    if (_otherSubscriberDetails == null)
                    {
                        return new OtherSubscriberDetails[] { };
                    }
                    return _otherSubscriberDetails;
                }
                set
                {
                    _otherSubscriberDetails = value;
                }
            }
            ServiceLine[] serviceline;
            [XmlElement("serviceline")]
            public ServiceLine[] ServiceLine
            {
                get
                {
                    if (serviceline == null)
                    {
                        return new ServiceLine[] { };
                    }
                    return serviceline;
                }
                set
                {
                    serviceline = value;
                }
            }
        }
        public class CAS
        {

            [XmlElement("CAS1")]
            public string CAS1 { get; set; }
            [XmlElement("CAS2")]
            public string CAS2 { get; set; }
            [XmlElement("CAS3")]
            public string CAS3 { get; set; }
            [XmlElement("CAS4")]
            public string CAS4 { get; set; }
            [XmlElement("CAS5")]
            public string CAS5 { get; set; }
            [XmlElement("CAS6")]
            public string CAS6 { get; set; }
            [XmlElement("CAS7")]
            public string CAS7 { get; set; }
            [XmlElement("CAS8")]
            public string CAS8 { get; set; }
            [XmlElement("CAS9")]
            public string CAS9 { get; set; }

            [XmlElement("CAS10")]
            public string CAS10 { get; set; }
            [XmlElement("CAS11")]
            public string CAS11 { get; set; }

            [XmlElement("CAS12")]
            public string CAS12 { get; set; }
            [XmlElement("CAS13")]
            public string CAS13 { get; set; }
            [XmlElement("CAS14")]
            public string CAS14 { get; set; }
            [XmlElement("CAS15")]
            public string CAS15 { get; set; }
            [XmlElement("CAS16")]
            public string CAS16 { get; set; }
            [XmlElement("CAS17")]
            public string CAS17 { get; set; }
            [XmlElement("CAS18")]
            public string CAS18 { get; set; }
            [XmlElement("CAS19")]
            public string CAS19 { get; set; }
        }
        public class OI
        {
            [XmlElement("OI1")]
            public string OI1 { get; set; }
            [XmlElement("OI2")]
            public string OI2 { get; set; }
            [XmlElement("OI3")]
            public string OI3 { get; set; }
            [XmlElement("OI4")]
            public string OI4 { get; set; }
            [XmlElement("OI5")]
            public string OI5 { get; set; }
            [XmlElement("OI6")]
            public string OI6 { get; set; }

        }
        public class MOA
        {
            [XmlElement("MOA1")]
            public string MOA1 { get; set; }
            [XmlElement("MOA2")]
            public string MOA2 { get; set; }
            [XmlElement("MOA3")]
            public string MOA3 { get; set; }
            [XmlElement("MOA4")]
            public string MOA4 { get; set; }
            [XmlElement("MOA5")]
            public string MOA5 { get; set; }
            [XmlElement("MOA6")]
            public string MOA6 { get; set; }
            [XmlElement("MOA7")]
            public string MOA7 { get; set; }
            [XmlElement("MOA8")]
            public string MOA8 { get; set; }
            [XmlElement("MOA9")]
            public string MOA9 { get; set; }

        }
        public class OtherSubscriberDetails
        {
            [XmlElement("SBR")]
            public SBR SBR { get; set; } = new SBR();
            CAS[] cas;
            [XmlElement("CAS")]
            public CAS[] CAS
            {
                get
                {
                    if (cas == null)
                    {
                        return new CAS[] { };
                    }
                    return cas;
                }
                set
                {
                    cas = value;
                }
            }
            AMT[] amt;
            [XmlElement("AMT")]
            public AMT[] AMT
            {
                get
                {
                    if (amt == null)
                    {
                        return new AMT[] { };
                    }
                    return amt;
                }
                set
                {
                    amt = value;
                }
            }
            [XmlElement("OI")]
            public OI OI { get; set; } = new OI();
            [XmlElement("MOA")]
            public MOA MOA { get; set; } = new MOA();
            [XmlElement("subscriberinformation")]
            public OtherSubscriber otherSubscriber { get; set; } = new OtherSubscriber();

            [XmlElement("payer")]
            public OtherPayerName otherPayerName { get; set; } = new OtherPayerName();
            OtherPayerReferingProvider[] _otherPayerReferingProvider;

            [XmlElement("referingprovider")]
            public OtherPayerReferingProvider[] otherPayerReferingProvider
            {
                get
                {
                    if (_otherPayerReferingProvider == null)
                    {
                        return new OtherPayerReferingProvider[] { };
                    }
                    return _otherPayerReferingProvider;
                }
                set
                {
                    _otherPayerReferingProvider = value;
                }
            }
            [XmlElement("renderingprovider")]
            public OtherPayerRenderingProvider otherPayerRenderingProvider { get; set; } = new OtherPayerRenderingProvider();
            [XmlElement("billingproviderdetails")]
            public OtherPayerBillingProvider otherPayerBillingProvider { get; set; } = new OtherPayerBillingProvider();
            [XmlElement("servicefacilitylocation")]
            public OtherPayerServiceFacilitylocation OtherPayerServiceFacilitylocation { get; set; } = new OtherPayerServiceFacilitylocation();
            [XmlElement("supervicingprovider")]
            public OtherPayerSupervicingProvider OtherPayerSupervicingProvider { get; set; } = new OtherPayerSupervicingProvider();

        }
        public class OtherPayerSupervicingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
        }
        public class OtherPayerServiceFacilitylocation
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
        }
        public class OtherPayerBillingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
        }
        public class OtherPayerRenderingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
        }
        public class OtherPayerReferingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
        }
        public class OtherPayerName
        {

            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();

            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            [XmlElement("DTP")]
            public DTP DTP { get; set; } = new DTP();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
        }
        public class OtherSubscriber
        {


            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();

            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            [XmlElement("DTP")]
            public DTP DTP { get; set; } = new DTP();
            [XmlElement("REF")]
            public REF REF { get; set; } = new REF();
        }
        public class SupervicingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

        }
        public class DrugIdentification
        {
            [XmlElement("LIN")]
            public LIN LIN { get; set; } = new LIN();
            [XmlElement("CTP")]
            public CTP CTP { get; set; } = new CTP();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
        }
        public class LX
        {
            [XmlElement("LX1")]
            public string LX1 { get; set; }
        }
        public class SV1
        {

            [XmlElement("SV11")]
            public string SV11 { get; set; }
            [XmlElement("SV12")]
            public string SV12 { get; set; }
            [XmlElement("SV13")]
            public string SV13 { get; set; }
            [XmlElement("SV14")]
            public string SV14 { get; set; }
            [XmlElement("SV15")]
            public string SV15 { get; set; }
            [XmlElement("SV16")]
            public string SV16 { get; set; }
            [XmlElement("SV17")]
            public string SV17 { get; set; }
            [XmlElement("SV18")]
            public string SV18 { get; set; }
            [XmlElement("SV19")]
            public string SV19 { get; set; }
            [XmlElement("SV110")]
            public string SV110 { get; set; }
            [XmlElement("SV111")]
            public string SV111 { get; set; }
            [XmlElement("SV112")]
            public string SV112 { get; set; }
            [XmlElement("SV113")]
            public string SV113 { get; set; }
            [XmlElement("SV114")]
            public string SV114 { get; set; }
            [XmlElement("SV115")]
            public string SV115 { get; set; }
            [XmlElement("SV116")]
            public string SV116 { get; set; }
            [XmlElement("SV117")]
            public string SV117 { get; set; }
            [XmlElement("SV118")]
            public string SV118 { get; set; }
            [XmlElement("SV119")]
            public string SV119 { get; set; }
            [XmlElement("SV120")]
            public string SV120 { get; set; }
            [XmlElement("SV121")]
            public string SV121 { get; set; }
        }
        public class SV5
        {
            [XmlElement("SV51")]
            public string SV51 { get; set; }
            [XmlElement("SV52")]
            public string SV52 { get; set; }
            [XmlElement("SV53")]
            public string SV53 { get; set; }
            [XmlElement("SV54")]
            public string SV54 { get; set; }
            [XmlElement("SV55")]
            public string SV55 { get; set; }
            [XmlElement("SV56")]
            public string SV56 { get; set; }
            [XmlElement("SV57")]
            public string SV57 { get; set; }

        }
        public class CR3
        {
            [XmlElement("CR31")]
            public string CR31 { get; set; }
            [XmlElement("CR32")]
            public string CR32 { get; set; }
            [XmlElement("CR33")]
            public string CR33 { get; set; }
            [XmlElement("CR34")]
            public string CR34 { get; set; }
            [XmlElement("CR35")]
            public string CR35 { get; set; }

        }
        public class QTY
        {
            [XmlElement("QTY1")]
            public string QTY1 { get; set; }
            [XmlElement("QTY2")]
            public string QTY2 { get; set; }
            [XmlElement("QTY3")]
            public string QTY3 { get; set; }
            [XmlElement("QTY4")]
            public string QTY4 { get; set; }

        }
        public class MEA
        {
            [XmlElement("MEA1")]
            public string MEA1 { get; set; }
            [XmlElement("MEA2")]
            public string MEA2 { get; set; }
            [XmlElement("MEA3")]
            public string MEA3 { get; set; }
            [XmlElement("MEA4")]
            public string MEA4 { get; set; }
            [XmlElement("MEA5")]
            public string MEA5 { get; set; }
            [XmlElement("MEA6")]
            public string MEA6 { get; set; }
            [XmlElement("MEA7")]
            public string MEA7 { get; set; }
            [XmlElement("MEA8")]
            public string MEA8 { get; set; }
            [XmlElement("MEA9")]
            public string MEA9 { get; set; }
            [XmlElement("MEA10")]
            public string MEA10 { get; set; }
            [XmlElement("MEA11")]
            public string MEA11 { get; set; }
            [XmlElement("MEA12")]
            public string MEA12 { get; set; }
        }
        public class PS1
        {

            [XmlElement("PS11")]
            public string PS11 { get; set; }
            [XmlElement("PS12")]
            public string PS12 { get; set; }
            [XmlElement("PS13")]
            public string PS13 { get; set; }

        }
        public class LIN
        {
            [XmlElement("LIN1")]
            public string LIN1 { get; set; }
            [XmlElement("LIN2")]
            public string LIN2 { get; set; }
            [XmlElement("LIN3")]
            public string LIN3 { get; set; }
            [XmlElement("LIN4")]
            public string LIN4 { get; set; }
            [XmlElement("LIN5")]
            public string LIN5 { get; set; }
            [XmlElement("LIN6")]
            public string LIN6 { get; set; }
            [XmlElement("LIN7")]
            public string LIN7 { get; set; }
            [XmlElement("LIN8")]
            public string LIN8 { get; set; }
            [XmlElement("LIN9")]
            public string LIN9 { get; set; }
            [XmlElement("LIN10")]
            public string LIN10 { get; set; }
            [XmlElement("LIN11")]
            public string LIN11 { get; set; }
            [XmlElement("LIN12")]
            public string LIN12 { get; set; }
            [XmlElement("LIN13")]
            public string LIN13 { get; set; }
            [XmlElement("LIN14")]
            public string LIN14 { get; set; }
            [XmlElement("LIN15")]
            public string LIN15 { get; set; }
            [XmlElement("LIN16")]
            public string LIN16 { get; set; }
            [XmlElement("LIN17")]
            public string LIN17 { get; set; }
            [XmlElement("LIN18")]
            public string LIN18 { get; set; }
            [XmlElement("LIN19")]
            public string LIN19 { get; set; }
            [XmlElement("LIN20")]
            public string LIN20 { get; set; }
            [XmlElement("LIN21")]
            public string LIN21 { get; set; }
            [XmlElement("LIN22")]
            public string LIN22 { get; set; }
            [XmlElement("LIN23")]
            public string LIN23 { get; set; }
            [XmlElement("LIN24")]
            public string LIN24 { get; set; }
            [XmlElement("LIN25")]
            public string LIN25 { get; set; }
            [XmlElement("LIN26")]
            public string LIN26 { get; set; }
            [XmlElement("LIN27")]
            public string LIN27 { get; set; }
            [XmlElement("LIN28")]
            public string LIN28 { get; set; }
            [XmlElement("LIN29")]
            public string LIN29 { get; set; }
            [XmlElement("LIN30")]
            public string LIN30 { get; set; }
            [XmlElement("LIN31")]
            public string LIN31 { get; set; }

        }
        public class CTP
        {
            [XmlElement("CTP1")]
            public string CTP1 { get; set; }
            [XmlElement("CTP2")]
            public string CTP2 { get; set; }
            [XmlElement("CTP3")]
            public string CTP3 { get; set; }
            [XmlElement("CTP4")]
            public string CTP4 { get; set; }
            [XmlElement("CTP5")]
            public string CTP5 { get; set; }
            [XmlElement("CTP6")]
            public string CTP6 { get; set; }
            [XmlElement("CTP7")]
            public string CTP7 { get; set; }
            [XmlElement("CTP8")]
            public string CTP9 { get; set; }
            [XmlElement("CTP10")]
            public string CTP10 { get; set; }
            [XmlElement("CTP11")]
            public string CTP11 { get; set; }

        }
        public class ServiceLine
        {
            [XmlElement("LX")]
            public LX LX { get; set; } = new LX();
            [XmlElement("SV1")]
            public SV1 SV1 { get; set; } = new SV1();
            [XmlElement("SV5")]
            public SV5 SV5 { get; set; } = new SV5();
            PWK[] pwk;
            [XmlElement("PWK")]
            public PWK[] PWK
            {
                get
                {
                    if (pwk == null)
                    {
                        return new PWK[] { };
                    }
                    return pwk;
                }
                set
                {
                    pwk = value;
                }
            }
            [XmlElement("CR1")]
            public CR1 CR1 { get; set; } = new CR1();
            [XmlElement("CR3")]
            public CR3 CR3 { get; set; } = new CR3();
            CRC[] crc;
            [XmlElement("CRC")]
            public CRC[] CRC
            {
                get
                {
                    if (crc == null)
                    {
                        return new CRC[] { };
                    }
                    return crc;
                }
                set
                {
                    crc = value;
                }
            }
            DTP[] dtp;
            [XmlElement("DTP")]
            public DTP[] DTP
            {
                get
                {
                    if (dtp == null)
                    {
                        return new DTP[] { };
                    }
                    return dtp;
                }
                set
                {
                    dtp = value;
                }
            }
            QTY[] qty;
            [XmlElement("QTY")]
            public QTY[] QTY
            {
                get
                {
                    if (qty == null)
                    {
                        return new QTY[] { };
                    }
                    return qty;
                }
                set
                {
                    qty = value;
                }
            }
            MEA[] mea;
            [XmlElement("MEA")]
            public MEA[] MEA
            {
                get
                {
                    if (mea == null)
                    {
                        return new MEA[] { };
                    }
                    return mea;
                }
                set
                {
                    mea = value;
                }
            }
            [XmlElement("CN1")]
            public CN1 CN1 { get; set; } = new CN1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
            [XmlElement("AMT")]
            public AMT AMT { get; set; } = new AMT();
            K3[] k3;
            [XmlElement("K3")]
            public K3[] K3
            {
                get
                {
                    if (k3 == null)
                    {
                        return new K3[] { };
                    }
                    return k3;
                }
                set
                {
                    k3 = value;
                }
            }
            NTE[] nte;
            [XmlElement("NTE")]
            public NTE[] NTE
            {
                get
                {
                    if (nte == null)
                    {
                        return new NTE[] { };
                    }
                    return nte;
                }
                set
                {
                    nte = value;
                }
            }
            [XmlElement("PS1")]
            public PS1 PS1 { get; set; } = new PS1();
            [XmlElement("HCP")]
            public HCP HCP { get; set; } = new HCP();
            [XmlElement("drugIdentification")]
            public DrugIdentification durgIdentification { get; set; } = new DrugIdentification();

            [XmlElement("renderingprovider")]
            public ServiceLineRenderingProvider renderingProvider { get; set; } = new ServiceLineRenderingProvider();

            [XmlElement("purchasedserviceprovider")]
            public PurchasedServiceProvider purchasedserviceProvider { get; set; } = new PurchasedServiceProvider();
            [XmlElement("servicefacilitylocation")]
            public ServiceLineServiceFacilityLocation serviceFacilityLocation { get; set; } = new ServiceLineServiceFacilityLocation();
            [XmlElement("supervicingprovider")]
            public ServiceLineSupervicingProvider supervicingProvider { get; set; } = new ServiceLineSupervicingProvider();
            [XmlElement("orderingprovider")]
            public OrderingProvider orderingProvider { get; set; } = new OrderingProvider();
            ServiceLineReferingProvider[] _referingProvider;
            [XmlElement("referingprovider")]
            public ServiceLineReferingProvider[] referingProvider
            {
                get
                {
                    if (_referingProvider == null)
                    {
                        return new ServiceLineReferingProvider[] { };
                    }
                    return _referingProvider;
                }
                set
                {
                    _referingProvider = value;
                }
            }
            [XmlElement("ambulancepickuplocation")]
            public ServiceLineAmbulancePickUpLocation ambulancePickUpLoaction { get; set; } = new ServiceLineAmbulancePickUpLocation();
            [XmlElement("ambulancedroplocation")]
            public ServiceLineAmbulanceDropLocation AmbulanceDropLocation { get; set; } = new ServiceLineAmbulanceDropLocation();
            [XmlElement("lineadjustment")]
            public LineAdjustment lineAdjustment { get; set; } = new LineAdjustment();
            FormIdentificationCode[] _formIdentificationCode;
            [XmlElement("formidentificationcode")]
            public FormIdentificationCode[] formIdentificationCode
            {
                get
                {
                    if (_formIdentificationCode == null)
                    {
                        return new FormIdentificationCode[] { };
                    }
                    return _formIdentificationCode;
                }
                set
                {
                    _formIdentificationCode = value;
                }
            }
        }
        public class LQ
        {
            [XmlElement("LQ1")]
            public string LQ1 { get; set; }
            [XmlElement("LQ2")]
            public string LQ2 { get; set; }
        }
        public class FRM
        {

            [XmlElement("FRM1")]
            public string FRM1 { get; set; }
            [XmlElement("FRM2")]
            public string FRM2 { get; set; }
            [XmlElement("FRM3")]
            public string FRM3 { get; set; }
            [XmlElement("FRM4")]
            public string FRM4 { get; set; }
            [XmlElement("FRM5")]
            public string FRM5 { get; set; }
        }
        public class FormIdentificationCode
        {
            [XmlElement("LQ")]
            public LQ LQ { get; set; } = new LQ();
            FRM[] frm;
            [XmlElement("FRM")]
            public FRM[] FRM
            {
                get
                {
                    if (frm == null)
                    {
                        return new FRM[] { };
                    }
                    return frm;
                }
                set
                {
                    frm = value;
                }
            }
        }
        public class SVD
        {
            [XmlElement("SVD1")]
            public string SVD1 { get; set; }
            [XmlElement("SVD2")]
            public string SVD2 { get; set; }
            [XmlElement("SVD3")]
            public string SVD3 { get; set; }
            [XmlElement("SVD4")]
            public string SVD4 { get; set; }
            [XmlElement("SVD5")]
            public string SVD5 { get; set; }
            [XmlElement("SVD6")]
            public string SVD6 { get; set; }
        }

        public class LineAdjustment
        {
            [XmlElement("SVD")]
            public SVD SVD { get; set; } = new SVD();
            CAS[] cas;
            [XmlElement("CAS")]
            public CAS[] CAS
            {
                get
                {
                    if (cas == null)
                    {
                        return new CAS[] { };
                    }
                    return cas;
                }
                set
                {
                    cas = value;
                }
            }

            [XmlElement("DTP")]
            public DTP DTP { get; set; } = new DTP();
            [XmlElement("AMT")]
            public AMT AMT { get; set; } = new AMT();
        }
        public class ServiceLineAmbulanceDropLocation
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();

        }
        public class ServiceLineAmbulancePickUpLocation
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();

        }
        public class ServiceLineReferingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

        }
        public class OrderingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

            [XmlElement("PER")]
            public PER PER { get; set; } = new PER();
        }
        public class ServiceLineSupervicingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

        }
        public class ServiceLineServiceFacilityLocation
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

        }
        public class PRV
        {
            [XmlElement("PRV1")]
            public string PRV1 { get; set; }
            [XmlElement("PRV2")]
            public string PRV2 { get; set; }
            [XmlElement("PRV3")]
            public string PRV3 { get; set; }
            [XmlElement("PRV4")]
            public string PRV4 { get; set; }
            [XmlElement("PRV5")]
            public string PRV5 { get; set; }
            [XmlElement("PRV6")]
            public string PRV6 { get; set; }

        }
        public class ServiceLineRenderingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();

            [XmlElement("PRV")]
            public PRV PRV { get; set; } = new PRV();

            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

        }
        public class PurchasedServiceProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();

            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

        }
        public class AmbulanceDropLocation
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();

        }
        public class AmbulancePickUpLocation
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();

        }

        public class ServiceFacilityLocation
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            [XmlElement("PER")]
            public PER PER { get; set; } = new PER();

            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
        }
        public class RenderingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();

            [XmlElement("PRV")]
            public PRV PRV { get; set; } = new PRV();

            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

        }
        public class ReferingProvider
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

        }
        public class SubscriberDetails
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            [XmlElement("DMG")]
            public DMG DMG { get; set; } = new DMG();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
            [XmlElement("PER")]
            public PER PER { get; set; } = new PER();
        }
        public class CUR
        {
            [XmlElement("CUR1")]
            public string CUR1 { get; set; }
            [XmlElement("CUR2")]
            public string CUR2 { get; set; }
            [XmlElement("CUR3")]
            public string CUR3 { get; set; }
            [XmlElement("CUR4")]
            public string CUR4 { get; set; }
            [XmlElement("CUR5")]
            public string CUR5 { get; set; }
            [XmlElement("CUR6")]
            public string CUR6 { get; set; }
            [XmlElement("CUR7")]
            public string CUR7 { get; set; }
            [XmlElement("CUR8")]
            public string CUR8 { get; set; }
            [XmlElement("CUR9")]
            public string CUR9 { get; set; }
            [XmlElement("CUR10")]
            public string CUR10 { get; set; }
            [XmlElement("CUR11")]
            public string CUR11 { get; set; }
            [XmlElement("CUR12")]
            public string CUR12 { get; set; }
            [XmlElement("CUR13")]
            public string CUR13 { get; set; }
            [XmlElement("CUR14")]
            public string CUR14 { get; set; }
            [XmlElement("CUR15")]
            public string CUR15 { get; set; }
            [XmlElement("CUR16")]
            public string CUR16 { get; set; }
            [XmlElement("CUR17")]
            public string CUR17 { get; set; }
            [XmlElement("CUR18")]
            public string CUR18 { get; set; }
            [XmlElement("CUR19")]
            public string CUR19 { get; set; }
            [XmlElement("CUR20")]
            public string CUR20 { get; set; }
            [XmlElement("CUR21")]
            public string CUR21 { get; set; }

        }

        public class BillingProvider
        {
            [XmlElement("HL")]
            public HL HL { get; set; } = new HL();
            [XmlElement("PRV")]
            public PRV PRV { get; set; } = new PRV();
            [XmlElement("CUR")]
            public CUR CUR { get; set; } = new CUR();
            [XmlElement("billingproviderdetails")]
            public BillingProviderDetails billingproviderdetails { get; set; } = new BillingProviderDetails();
            [XmlElement("paytoaddress")]
            public PayToAddress payToAddress { get; set; } = new PayToAddress();
            [XmlElement("paytoplan")]
            public PayToPlan payToPlan { get; set; } = new PayToPlan();
            Subscriber[] _subscriber;
            [XmlElement("subscriber")]
            public Subscriber[] subscriber
            {
                get
                {
                    if (_subscriber == null)
                    {
                        return new Subscriber[] { };
                    }
                    return _subscriber;
                }
                set
                {
                    _subscriber = value;
                }
            }
        }
        public class PayToPlan
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }

        }
        public class PayToAddress
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
        }
        public class BillingProviderDetails
        {
            [XmlElement("NM1")]
            public NM1 NM1 { get; set; } = new NM1();
            [XmlElement("N3")]
            public N3 N3 { get; set; } = new N3();
            [XmlElement("N4")]
            public N4 N4 { get; set; } = new N4();
            REF[] refs;
            [XmlElement("REF")]
            public REF[] REF
            {
                get
                {
                    if (refs == null)
                    {
                        return new REF[] { };
                    }
                    return refs;
                }
                set
                {
                    refs = value;
                }
            }
            PER[] per;
            [XmlElement("PER")]
            public PER[] PER
            {
                get
                {
                    if (per == null)
                    {
                        return new PER[] { };
                    }
                    return per;
                }
                set
                {
                    per = value;
                }
            }
        }
}

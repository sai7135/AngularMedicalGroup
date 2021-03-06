using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Angular_API.Models;
using Angular_API.Repository;

namespace Angular_API.Utilites
{
    public class STCheckAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            ST stValue = (ST)value;
            return stValue.ST1 == "837"& stValue.ST2.Length>=4 & stValue.ST2.Length<=9 & stValue.ST3.Length>=1 & stValue.ST3.Length<=35;
        }
    }
    public class TransactionBHTAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            BHT bhtValue = (BHT)value;
            return bhtValue.BHT1 == "0019" & (bhtValue.BHT2 == "00" || bhtValue.BHT2 == "18") & bhtValue.BHT3 != "" & bhtValue.BHT3.Length <= 50 & bhtValue.BHT4!="" &bhtValue.BHT4.Length==8 & bhtValue.BHT5.Length>=4 & bhtValue.BHT5.Length<=8 &(bhtValue.BHT6=="31" || bhtValue.BHT6=="CH" || bhtValue.BHT6=="RP");
        }
    }
    public class SubmitterNM1Attribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            NM1 nm1Value = (NM1)value;
            return nm1Value.NM11 == "41" && (nm1Value.NM12 == "1" || nm1Value.NM12 == "2")&& nm1Value.NM13!="" && nm1Value.NM13.Length<=60 && nm1Value.NM14.Length<=35 && nm1Value.NM15.Length<=25 && (nm1Value.NM18=="" || nm1Value.NM18=="46") && nm1Value.NM19.Length>=2 && nm1Value.NM19.Length<=80; 
        }
    }
    public class SubmitterPERAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            PER[] perValue = (PER[])value;
            bool valid = true;
            foreach (PER per in perValue) {
                if(per.PER1 != "IC")
                {
                    valid = false;
                    break;
                }
                if(per.PER2.Length > 60)
                {
                    valid = false;
                    break;
                }
                if(per.PER3!="EM" || per.PER3!="FX" || per.PER3 != "TE") {
                    valid = false;
                    break;
                }
                if(per.PER4=="" || per.PER4.Length > 256){
                    valid = false;
                    break;
                }
                if(per.PER5!="" ^ per.PER6 != "")
                {
                    valid = false;
                    break;
                }
                if(per.PER7 != "" ^ per.PER8 != "")
                {
                    valid = false;
                    break;
                }
                if(!(per.PER5=="EM" || per.PER5=="EX" || per.PER5 == "FX" || per.PER5 == "TE" || per.PER5=="" || per.PER5==null))
                {
                    valid = false;
                    break;
                }

                if (!(per.PER7 == null || per.PER7 == "EM" || per.PER7 == "EX" || per.PER7 == "FX" || per.PER7 == "TE" || per.PER7 == ""))
                {
                    valid = false;
                    break;
                }
            }
            return perValue.Length < 2 && valid;
        }
    }
    public class ReceiverNM1Attribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            NM1 nm1Value = (NM1)value;
            return nm1Value.NM19!=null && nm1Value.NM13!=null && nm1Value.NM12 == "2" && nm1Value.NM13.Length >= 1 && nm1Value.NM13.Length <= 60 && nm1Value.NM18 == "46" && nm1Value.NM19.Length > 1 && nm1Value.NM19.Length <= 80;
        }
    }
    public class BillingProviderHLAttribute:ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            HL hlValue = (HL)value;
            return hlValue.HL2 == "" && hlValue.HL4 == "1";
        }
    }
    public class BillingProviderPRVAttribute:ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            PRV prvValue = (PRV)value;
            return prvValue.PRV1 == "BI" && prvValue.PRV2 == "PXC" && prvValue.PRV3 != null && prvValue.PRV3.Length >= 1 && prvValue.PRV3.Length <= 50;
        }
    } 
    public class BillingProviderNameNM1Attribute:ValidationAttribute
    {
        
        protected override ValidationResult IsValid(object value,ValidationContext context)
        {
            N4 n4value=(N4)context.ObjectType.GetProperty("N4").GetValue(context.ObjectInstance);
            NM1 nm1Value = (NM1)value;
            string ErrorString;
            if (nm1Value.NM12 == "1")
            {
                ErrorString = ValidateElement.GetValidation(nm1Value.NM13, Element.Required, 1, 60, "NM103") + ValidateElement.GetValidation(nm1Value.NM14, Element.Required, 1, 35, "NM104") + ValidateElement.GetValidation(nm1Value.NM15, Element.Required, 1, 25, "NM105") + ValidateElement.GetValidation(nm1Value.NM17, Element.Required, 1, 10, "NM107");
            }
            else if (nm1Value.NM12 == "2")
            {
                ErrorString = ValidateElement.GetValidation(nm1Value.NM13, Element.Required, 1, 60, "NM103") + ValidateElement.GetValidation(nm1Value.NM14, Element.Situational, 1, 35, "NM104") + ValidateElement.GetValidation(nm1Value.NM15, Element.Situational, 1, 25, "NM105") + ValidateElement.GetValidation(nm1Value.NM17, Element.Situational, 1, 10, "NM107");
            }
            else
            {
                ErrorString = "NM102 should be 1 or 2 ";
            }
            if (n4value.N44 == null || n4value.N44 == string.Empty)
            {
                ErrorMessage = ErrorString+(nm1Value.NM18 == "XX" ? "" : "NM108 should be XX ") + ValidateElement.GetValidation(nm1Value.NM19, Element.Required, 2, 80, "NM109");
            }
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class BillingProviderN3Attribute : ValidationAttribute {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N3 n3Value = (N3)value;
            string ErrorString = ValidateElement.GetValidation(n3Value.N31, Element.Required, 1, 55, "N301") + ValidateElement.GetValidation(n3Value.N32, Element.Situational, 1, 55, "N302");
            if (ErrorString == string.Empty)
                return null;
            return new ValidationResult(ErrorString);
        }
    }
    public class BillingProviderN4Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N4 n4Value = (N4)value;
            string ErrorString = ValidateElement.GetValidation(n4Value.N41, Element.Required, 2, 30, "N401") + ValidateElement.GetValidation(n4Value.N42, Element.Situational, 2, 2, "N402") + ValidateElement.GetValidation(n4Value.N43, Element.Situational, 3, 15, "N403") + ValidateElement.GetValidation(n4Value.N44, Element.Situational, 2, 3, "N404") + ValidateElement.GetValidation(n4Value.N47, Element.Situational, 1, 3, "N407");
            if (ErrorString==string.Empty)
            {
                return null;
            }
            return new ValidationResult("Billing Provider Name:"+ErrorString);
        }

    }
    public class BillingProviderREFAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            REF[] refValue = (REF[])value;
            string ErrorString=string.Empty;
            if (refValue == null)
            {
                ErrorString = "REF is required in BillingProvider Name";
            }
            if (refValue.Length > 3)
            {
                ErrorString = "REF length should not be greater segments should not be 3";
            }
            if (!refValue.Any(r => r.REF1 == "EI" || r.REF1 == "SY"))
            {
                ErrorString += "REF1 should be EI or SY is required ";
            }
            if (!refValue.All(r => r.REF1 == "EI" || r.REF1 == "SY" || r.REF1 == "0B" || r.REF1 == "1G"))
            {
                ErrorString = ErrorString+"REF1 should be EI or SY or 0B or 1G the given value is invalid ";
            }
            foreach(REF r in refValue)
            {
                ErrorString += ValidateElement.GetValidation(r.REF2,Element.Required,1,50,"REF02");
            }
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult("Billing Provider Name: "+ErrorString);
        }
    }
    public class BillingProviderPERAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            PER[] perValues=(PER[])value;
            string ErrorString = string.Empty;
            if (perValues != null)
            {
                if(!perValues.All(p=>p.PER1=="IC"))
                {
                    ErrorString = "PER01 in Billing Provider Name should be IC ";
                }
                if(!perValues.All(p=> p.PER3=="EM" || p.PER3=="EX" || p.PER3 == "TE"))
                {
                    ErrorString += "PER03 should be EM EX or TE ";
                }
                if(!perValues.All(p => p.PER5 == "EM" || p.PER5 == "EX" ||p.PER5=="FX"|| p.PER5 == "TE"||p.PER5==null))
                {
                    ErrorString += "PER05 should be EM or EX or FX or TE ";
                }
                if (!perValues.All(p => p.PER7 == "EM" || p.PER7 == "EX" || p.PER7 == "FX" || p.PER7 == "TE" || p.PER7 == null))
                {
                    ErrorString += "PER07 should be EM or EX or FX or TE ";
                }
                int i = 1;
                foreach(PER perValue in perValues)
                {
                    if (i != 1)
                    {
                        ErrorString += ValidateElement.GetValidation(perValue.PER2,Element.Required,1,60,"PER02");
                    }
                    else
                    {
                        ErrorString += ValidateElement.GetValidation(perValue.PER2, Element.Situational, 1, 60, "PER02");
                    }
                    ErrorString += ValidateElement.GetValidation(perValue.PER4, Element.Required, 1, 256, "PER04") + ValidateElement.GetValidation(perValue.PER6, Element.Situational, 1, 256, "PER06") + ValidateElement.GetValidation(perValue.PER8, Element.Situational, 1, 256, "PER08");
                }
            }

            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PayToAddressNM1Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            NM1 nm1Value = (NM1)value;
            if(nm1Value.NM112=="1" || nm1Value.NM112 == "2")
            {
                return null;
            }
            return new ValidationResult("Pay To Address:NM102 should be 1 or 2");
        }
    }
    public class PayToAddressN3Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N3 n3Value = (N3)value;
            string ErrorString = ValidateElement.GetValidation(n3Value.N31, Element.Required, 1, 55, "N301") + ValidateElement.GetValidation(n3Value.N32, Element.Situational, 1, 55, "N302");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult("Pay To Address: " + ErrorString);
        }
    }
    public class PayToAddressN4Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N4 n4Value = (N4)value;
            if (n4Value == null)
            {
                return new ValidationResult("Pay To Address:N4 segment is required");
            }
            string ErrorString = string.Empty;
            ErrorString = ValidateElement.GetValidation(n4Value.N41, Element.Required, 2, 30, "N401") + ValidateElement.GetValidation(n4Value.N42, Element.Situational, 2, 2, "N402") + ValidateElement.GetValidation(n4Value.N43, Element.Situational, 3, 15, "N403") + ValidateElement.GetValidation(n4Value.N44, Element.Situational, 2, 3, "N404") + ValidateElement.GetValidation(n4Value.N47, Element.Situational, 1, 3, "N407");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PayToPlanNM1Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            string ErrorString = string.Empty;
            NM1 nm1Value = (NM1)value;
            if (nm1Value.NM12 == "2")
            {
                ErrorString = "Pay to plan NM102 should be 2 ";
            }
            ErrorString += ValidateElement.GetValidation(nm1Value.NM13, Element.Required, 1, 60, "NM103");
            if (!(nm1Value.NM18 == "PI" || nm1Value.NM18 == "XV"))
            {
                ErrorString += "NM108 should be PI or XV ";
            }
            ErrorString += ValidateElement.GetValidation(nm1Value.NM19, Element.Required, 2, 80, "NM109");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PayToPlanN3Attribute:ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N3 n3Value = (N3)value;
            if (n3Value == null)
            {
                return new ValidationResult("N3 segment is required");
            }
            string ErrorString = ValidateElement.GetValidation(n3Value.N31, Element.Required, 1, 55, "N301") + ValidateElement.GetValidation(n3Value.N32, Element.Situational, 1, 55, "N302");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PaytoPlanN4Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N4 n4Value = (N4)value;
            if (n4Value == null)
            {
                return new ValidationResult("N401 is Required");
            }
            string ErrorString = ValidateElement.GetValidation(n4Value.N41, Element.Required, 2, 30, "N401") + ValidateElement.GetValidation(n4Value.N42, Element.Situational, 2, 2, "N402") + ValidateElement.GetValidation(n4Value.N43, Element.Situational, 3, 15, "N403") + ValidateElement.GetValidation(n4Value.N44, Element.Situational, 2, 3, "N404") + ValidateElement.GetValidation(n4Value.N47, Element.Situational, 1, 3, "N407");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PayToPlanREF : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            REF[] refValues = (REF[])value;
            if (refValues == null)
            {
                return new ValidationResult("REF is Required ");
            }
            if (!refValues.Any(r => r.REF1 == "EI"))
            {
                return new ValidationResult("REF with EI is required");
            }
            if (!refValues.All(r => r.REF1 == "2U" || r.REF1 == "FY" || r.REF1 == "NF" || r.REF1 == "EI"))
            {
                return new ValidationResult("REF01 with qualifiers 2U,FY,NF,EI is allowed");
            }
            string ErrorString = string.Empty;
            if (refValues.Length > 2)
            {
                ErrorString = "REF should be maximum 2 ";
            }
            foreach(REF refValue in refValues)
            {
                ErrorString += ValidateElement.GetValidation(refValue.REF2,Element.Required,1,50,"REF02");
            }
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class SubScriberHLAttribute:ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {

            HL hlValue = (HL)value;
            if(!(hlValue.HL4=="0" || hlValue.HL4 == "1"))
            {
                return new ValidationResult("HL04 can be 0 or 1");
            }
            return null;
        }
    }
    public class SubscriberSBRAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            SBR sbrValue = (SBR)value;
            if (sbrValue == null)
            {
                return new ValidationResult("SBR segment is required");
            }
            if (!(sbrValue.SBR1 == "A" || sbrValue.SBR1 == "B" || sbrValue.SBR1 == "C" || sbrValue.SBR1 == "D" || sbrValue.SBR1 == "E" || sbrValue.SBR1 == "F" || sbrValue.SBR1 == "G" || sbrValue.SBR1 == "H" || sbrValue.SBR1 == "P" || sbrValue.SBR1 == "S" || sbrValue.SBR1 == "T" || sbrValue.SBR1 == "U"))
            {
                return new ValidationResult("the only allowed values for SBR01 should be ABCDEFGHPSTU");
            }
            string ErrorString = string.Empty;
            if (!(sbrValue.SBR2 == "18" || string.IsNullOrEmpty(sbrValue.SBR2)))
            {
                ErrorString += "SBR02 can only be 18 ";
            }
            if (!(string.IsNullOrEmpty(sbrValue.SBR5)||sbrValue.SBR5 == "12" || sbrValue.SBR5 == "13" || sbrValue.SBR5 == "14" || sbrValue.SBR5 == "15" || sbrValue.SBR5 == "16" || sbrValue.SBR5 == "41" || sbrValue.SBR5 == "42"||sbrValue.SBR5== "47"))
            {
                ErrorString += "SBR05 can only be 12 13 14 15 16 41 42 43 47 ";
            }
            if (!(string.IsNullOrEmpty(sbrValue.SBR9) || sbrValue.SBR9 == "11" || sbrValue.SBR9=="12"|| sbrValue.SBR9 == "13" || sbrValue.SBR9 == "14" || sbrValue.SBR9 == "15" || sbrValue.SBR9  == "16" || sbrValue.SBR9 == "17" || sbrValue.SBR9 == "AM" || sbrValue.SBR5 == "BL" || sbrValue.SBR5 == "CH" || sbrValue.SBR5 == "CI" || sbrValue.SBR5 == "DS" ||  sbrValue.SBR5 == "FI" || sbrValue.SBR5 == "HM" || sbrValue.SBR5 == "LM" || sbrValue.SBR5 == "MA" || sbrValue.SBR5 == "MB" || sbrValue.SBR5 == "MC" || sbrValue.SBR5 == "OF" || sbrValue.SBR5 == "TV" || sbrValue.SBR5 == "VA" || sbrValue.SBR5 == "WC" || sbrValue.SBR5 == "ZZ"))
            {
                ErrorString += "SBR09 can only be 11 12 13 14 15 16 17 AM BL CH CI DS FI HM LM MA MB MC OF TV VA WC ZZ ";
            }
            ErrorString += ValidateElement.GetValidation(sbrValue.SBR3, Element.Situational, 1, 50, "SBR03") + ValidateElement.GetValidation(sbrValue.SBR4, Element.Situational, 1, 60, "SBR04");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class SubscriberPATAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            PAT patValue = (PAT)value;
            string errorString = string.Empty;
            if (!(string.IsNullOrEmpty(patValue.PAT5) || patValue.PAT5 == "D8"))
            {
                errorString = "PAT05 should only be D8 ";
            }
            errorString += ValidateElement.GetValidation(patValue.PAT6,Element.Situational,1,35,"PAT06");
            if (!(string.IsNullOrEmpty(patValue.PAT7) || patValue.PAT7 == "01"))
            {
                errorString += "PAT07 should only be 01 ";
            }
            errorString += ValidateElement.GetValidation(patValue.PAT8, Element.Situational, 1, 10, "PAT08");
            if (!(string.IsNullOrEmpty(patValue.PAT9) || patValue.PAT9== "Y"))
            {
                errorString += "PAT09 should only be Y ";
            }
            if (errorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(errorString);
        }
    }
    public class SubscriberNM1Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            NM1 nm1Value = (NM1)value;
            string ErrorString = string.Empty;
            if(!(nm1Value.NM12=="1"|| nm1Value.NM12 == "2"))
            {
                return new ValidationResult("NM102 should be 1 or 2");
            }
            if (nm1Value.NM12 == "1")
            {
                ErrorString = ValidateElement.GetValidation(nm1Value.NM14, Element.Required, 1, 35, "NM104") + ValidateElement.GetValidation(nm1Value.NM15, Element.Required, 1, 25, "NM105") + ValidateElement.GetValidation(nm1Value.NM17, Element.Required, 1, 10, "NM107");
            }
            else if (nm1Value.NM12 == "2")
            {
                ErrorString = ValidateElement.GetValidation(nm1Value.NM14, Element.Situational, 1, 35, "NM104") + ValidateElement.GetValidation(nm1Value.NM15, Element.Situational, 1, 25, "NM105") + ValidateElement.GetValidation(nm1Value.NM17, Element.Situational, 1, 10, "NM107");
            }
            ErrorString += ValidateElement.GetValidation(nm1Value.NM13, Element.Required, 1, 60, "NM103");
            if(!(nm1Value.NM18== "II" || nm1Value.NM18 == "MI"))
            {
                return new ValidationResult(ErrorString + "NM108 should be II or MI");
            }
            ErrorString += ValidateElement.GetValidation(nm1Value.NM19, Element.Required, 2, 80,"NM109");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class SubscriberN3Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N3 n3Value = (N3)value;
            string ErrorString = string.Empty;
            if (n3Value != null)
            {
                ErrorString = ValidateElement.GetValidation(n3Value.N31, Element.Required, 1, 55, "N301") + ValidateElement.GetValidation(n3Value.N32, Element.Situational, 1, 55, "N302");
                if (ErrorString == string.Empty)
                {
                    return null;
                }
                return new ValidationResult(ErrorString);
            }
            return null;
        }
    }
    public class SubscriberN4Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N4 n4Value = (N4)value;
            if (n4Value == null)
            {
                return new ValidationResult("N4 is required");
            }
            string ErrorString = ValidateElement.GetValidation(n4Value.N41, Element.Required, 1, 40, "N401") + ValidateElement.GetValidation(n4Value.N42, Element.Situational, 2, 2, "N402") + ValidateElement.GetValidation(n4Value.N43, Element.Situational, 3, 15, "N403") + ValidateElement.GetValidation(n4Value.N44, Element.Situational, 2, 3, "N404") + ValidateElement.GetValidation(n4Value.N47, Element.Situational, 1, 3, "N407");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class SubscriberDMGAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            DMG dmgValue = (DMG)value;
            if (dmgValue == null)
            {
                return null;
            }
            string ErrorString = string.Empty;
            if (dmgValue.DMG1 != "D8")
            {
                ErrorString += "DMG01 should be D8 ";
            }
            ErrorString += ValidateElement.GetValidation(dmgValue.DMG2, Element.Required, 1, 35, "DMG02");
            if(!(dmgValue.DMG3=="F"|| dmgValue.DMG3 == "M" || dmgValue.DMG3 == "U"))
            {
                ErrorString += "DMG03 should be F or M or U";
            }
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }

    }
    public class SubscriberREFAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            REF[] refValues=(REF[])value;
            if (refValues == null)
            {
                return null;
            }
            if (!refValues.All(r => r.REF1 == "Y4" || r.REF1 == "SY"))
            {
                return new ValidationResult("REF01 should be Y4 or SY");
            }
            if (refValues.Length > 2)
            {
                return new ValidationResult("REF should be minum 2");
            }
            string ErrorString = string.Empty;
            foreach (REF refValue in refValues)
            {
                ErrorMessage += ValidateElement.GetValidation(refValue.REF2, Element.Required, 1, 50, "REF02");
            }
            if (ErrorMessage == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorMessage);
        }
    }
    public class SubscriberPERAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            PER perValue = (PER)value;
            if (perValue == null)
            {
                return null;
            }
            if (perValue.PER1 != "IC")
            {
                return new ValidationResult("PER01 should be IC");
            }
            string ErrorString = ValidateElement.GetValidation(perValue.PER2, Element.Situational, 1, 60, "PER02");
            if (perValue.PER3 != "TE")
            {
                ErrorString += "PER03 should be TE ";
            }
            ErrorString += ValidateElement.GetValidation(perValue.PER4, Element.Required, 1, 256, "PER04");
            if(!(perValue.PER5=="EX" || string.IsNullOrEmpty(perValue.PER5)))
            {
                ErrorString = "PER05 should be EX ";
            }
            ErrorString += ValidateElement.GetValidation(perValue.PER6, Element.Situational, 1, 256, "PER06");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PayerNM1Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            NM1 nm1Value = (NM1)value;
            if (nm1Value.NM12 != "2")
            {
                return new ValidationResult("NM102 should be 2 ");
            }
            string ErrorString = ValidateElement.GetValidation(nm1Value.NM13, Element.Required, 1, 60, "NM103");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PayerN3Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N3 n3Value = (N3)value;
            if (n3Value == null)
            {
                return null;
            }
            string ErrorString = ValidateElement.GetValidation(n3Value.N31, Element.Required, 1, 55, "N301") + ValidateElement.GetValidation(n3Value.N32, Element.Situational, 1, 55, "N302");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PayerN4Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N4 n4Value = (N4)value;
            if (n4Value == null)
            {
                return new ValidationResult("N4 segment is required");
            }
            string ErrorString = ValidateElement.GetValidation(n4Value.N41, Element.Required, 2, 30, "N401") + ValidateElement.GetValidation(n4Value.N42, Element.Situational, 2, 2, "N402") + ValidateElement.GetValidation(n4Value.N43, Element.Situational, 3, 15, "N403") + ValidateElement.GetValidation(n4Value.N44, Element.Situational, 2, 3, "N404") + ValidateElement.GetValidation(n4Value.N47, Element.Situational, 1, 3, "N407");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PayerREFAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            REF[] refValue = (REF[])value;
            if (refValue == null)
            {
                return null;
            }
            string ErrorString = string.Empty;
            if (!refValue.Any(r => r.REF1 == "2U" || r.REF1 == "EI" || r.REF1 == "FY" || r.REF1 == "NF"||r.REF1=="G2"||r.REF1=="LU"))
            {
                ErrorString = "REF01 allowed values are 2U,EI,FY,NF,G2,LU ";
            }
            foreach (REF r in refValue)
            {
                ErrorString += ValidateElement.GetValidation(r.REF2,Element.Required,1,50,"REF02");
            }
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class SubscriberClaimAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            Claims[] claimsValue = (Claims[])value;
            if (claimsValue == null)
            {
                SubscriberDetails subscriberDetails= (SubscriberDetails)validationContext.ObjectType.GetProperty("SubscriberDetails").GetValue(validationContext.ObjectInstance);
                string ErrorString = string.Empty;
                if (subscriberDetails.N3==null)
                {
                    ErrorString = "N301 is Required in subscriber";
                }
                if (ErrorString == string.Empty)
                {
                    return null;
                }
                return new ValidationResult(ErrorString);
            }
            return null;
        }
    }
    public class PatientPATAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            PAT patValue = (PAT)value;
            string ErrorString = string.Empty;
            if (!(patValue.PAT1 == "01" || patValue.PAT1 == "19" || patValue.PAT1 == "20" || patValue.PAT1 == "21" || patValue.PAT1 == "39" || patValue.PAT1 == "40" || patValue.PAT1 == "G8"))
            {
                ErrorString = "PAT01 should be 01,19,20,21,39,40,G8 ";
            }
            if (!(patValue.PAT5 == "D8" || string.IsNullOrEmpty(patValue.PAT5)))
            {
                ErrorString += "PAT05 should be D8";
            }
            if (!(patValue.PAT7 == "01" || string.IsNullOrEmpty(patValue.PAT7)))
            {
                ErrorString += "PAT07 should be 01";
            }
            if (!(patValue.PAT9 == "Y" || string.IsNullOrEmpty(patValue.PAT9)))
            {
                ErrorString += "PAT09 should be Y";
            }
            ErrorString += ValidateElement.GetValidation(patValue.PAT6, Element.Situational, 1, 35, "PAT06") + ValidateElement.GetValidation(patValue.PAT8, Element.Situational, 1, 10, "PAT08");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PatientHLAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            HL hlValue = (HL)value;
            if (hlValue.HL4 != "0")
            {
                return new ValidationResult("There should be no child to Patient level");
            }
            string ErrorString = ValidateElement.GetValidation(hlValue.HL1,Element.Required,1,12,"HL01")+ValidateElement.GetValidation(hlValue.HL2,Element.Required,1,12,"HL02");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PatientNM1Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            NM1 nm1Value = (NM1)value;
            string ErrorString = string.Empty;
            if (nm1Value.NM12 != "1") {
                ErrorString = "NM102 should be 1";
            }
            ErrorString += ValidateElement.GetValidation(nm1Value.NM13, Element.Required, 1, 60, "NM103") + ValidateElement.GetValidation(nm1Value.NM14,Element.Situational,1,35,"NM104")+ValidateElement.GetValidation(nm1Value.NM15,Element.Situational,1,25,"NM105")+ValidateElement.GetValidation(nm1Value.NM17,Element.Situational,1,10,"NM107");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PatientN3Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N3 n3Value = (N3)value;
            if (n3Value == null)
            {
                return new ValidationResult("N3 segment is required");
            }
            string ErrorString = ValidateElement.GetValidation(n3Value.N31,Element.Required,1,55,"N301")+ValidateElement.GetValidation(n3Value.N32,Element.Situational,1,55,"N302");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PatientN4Attribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            N4 n4Value = (N4)value;
            if (n4Value == null)
            {
                return new ValidationResult("N4 value is required");
            }
            string ErrorString = ValidateElement.GetValidation(n4Value.N41,Element.Required,2,30,"N401")+ValidateElement.GetValidation(n4Value.N42,Element.Situational,2,2,"N402")+ValidateElement.GetValidation(n4Value.N43,Element.Situational,3,15,"N403")+ValidateElement.GetValidation(n4Value.N44,Element.Situational,2,3,"N404")+ValidateElement.GetValidation(n4Value.N47,Element.Situational,1,3,"N407");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PatientDmgAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            DMG dmgValue = (DMG)value;
            if (dmgValue == null)
            {
                return new ValidationResult("DMG is required");
            }
            string ErrorString = string.Empty;
            if(dmgValue.DMG1!="D8")
            {
                ErrorString = "DMG01 should be D8 and required ";
            }
            ErrorString += ValidateElement.GetValidation(dmgValue.DMG2,Element.Required,1,35,"DMG02");
            if (!(dmgValue.DMG3 == "F" || dmgValue.DMG3 == "M" || dmgValue.DMG3 == "U"))
            {
                ErrorString += "DMG03 should be F,M,U";
            }
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PatientRefAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            REF refValue = (REF)value;
            if (refValue == null)
            {
                return null;
            }
            string ErrorString = string.Empty;
            if (refValue.REF1 != "Y4")
            {
                ErrorString += "REF01 should be Y4 ";
            }
            ErrorString += ValidateElement.GetValidation(refValue.REF2,Element.Required,1,50,"REF02");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
    public class PatientPerAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            PER perValue = (PER)value;
            if (perValue == null)
            {
                return null;
            }
            string ErrorString = string.Empty;
            if(!(string.IsNullOrEmpty(perValue.PER1) || perValue.PER1=="IC"))
            {
                ErrorString = "PER01 should be IC ";
            }
            ErrorString = ValidateElement.GetValidation(perValue.PER2,Element.Situational,1,60,"PER02");
            if (!(string.IsNullOrEmpty(perValue.PER3) || perValue.PER3 == "TE"))
            {
                ErrorString += "PER03 should be TE ";
            }
            ErrorString += ValidateElement.GetValidation(perValue.PER4,Element.Required,1,256,"PER03");
            if(!(perValue.PER5=="EX" || !string.IsNullOrEmpty(perValue.PER5)))
            {
                ErrorString += "PER05 should be EX ";
            }
            ErrorString += ValidateElement.GetValidation(perValue.PER6, Element.Situational, 1, 256, "PER06");
            if (ErrorString == string.Empty)
            {
                return null;
            }
            return new ValidationResult(ErrorString);
        }
    }
}
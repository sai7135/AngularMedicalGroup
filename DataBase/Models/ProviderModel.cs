using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataBase.Models
{
    public class ProviderModel
    {
        public BasicInformation basicinformation;
        public ProviderInformation providerInformation;
        public Clia clia;
        public AuthConfiguration authConfiguration;
        public LetterDispatchMode letterDispatchMode;
        public PrimaryLocation primaryLocation;
        public AppointmentStatus appointmentStatus;
        public ContactStatus contactStatus;
        public OrganizationInformation[] organizationInformation;
    }
    public class BasicInformation
    {
        public string category;
        public string npi;
        public string providertype;
        public string providerid;
        public string primaryspeciality;
        public bool preferedspeciality;
        public bool referanymember;
        public string nameTitle;
        public string nameLast;
        public string nameFirst;
        public string nameMiddle;
        public string nameSuffix;
        public string nameProfSuffix;
        public string nameMiddleName;
        public string personalGender;
        public string personalDateOfBirth;
        public string personalSsn;
        public string personalCitezenship;
        public string personalBirthCity;
        public string personalBirthState;
        public string personalBirthCountry;
    }
    public class ProviderInformation
    {
        public string contractType;
        public string fromDate;
        public string toDate;
        public string paymentType;
        public string account;
        public string carrierlocality;
    }
    public class Clia
    {
        public bool certified;
        public bool waivable1;
        public bool waivable2;
    }

    public class AuthConfiguration
    {
        public string validfrom;
        public string allowedVisits;
        public bool acceptPatient;
        public bool allowasReferingProvider;
    }
    public class LetterDispatchMode
    {
        public string authorization;
        public string caseManagement;
        public string claims;
        public string clinicalAlerts;
        public string credentialing;
        public string hedis;
        public string pdr;
        public string referalTracking;
    }
    public class PrimaryLocation
    {
        public string practiceType;
        public string name;
        public string address1;
        public string address2;
        public string aptno;
        public string city;
        public string state;
        public string zip;
        public string countryid;
        public string country;
        public string phone;
        public string fax;
    }
    public class ContactStatus
    {
        public string contractTemplate;
        public string fromDate;
        public string toDate;
    }
    public class OrganizationInformation
    {
        public string organizationId;
        public string organizationType;
        public string organizationEffectiveFrom;
        public string organizationEffectiveTo;
        public string organizationName;
    }
    public class AppointmentStatus
    {
        public string parentPayorFacility1;
        public string parentPayorFacility2;
        public string appType;
    }
}
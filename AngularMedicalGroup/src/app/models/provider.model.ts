export class Provider{
    public basicinformation:BasicInformation;
    public providerInformation:ProviderInformation;
    public clia:Clia;
    public authConfiguration:AuthConfiguration;
    public letterDispatchMode:LetterDispatchMode;
    public primaryLocation:PrimaryLocation;
    public appointmentStatus:AppointmentStatus;
    public contactStatus:ContactStatus;
    public organizationInformation:OrganizationInformation[];
}
export class BasicInformation{
    public category:string;
    public npi:string;
    public providertype:string;
    public providerid:string;
    public primaryspeciality:string;
    public preferedspeciality:boolean;
    public referanymember:boolean;
    public nameTitle:string;
    public nameLast:string;
    public nameFirst:string;
    public nameMiddle:string;
    public nameSuffix:string;
    public nameProfSuffix:string;
    public nameMiddleName:string;
    public personalGender:string;
    public personalDateOfBirth:string;
    public personalSsn:string;
    public personalCitezenship:string;
    public personalBirthCity:string;
    public personalBirthState:string;
    public personalBirthCountry:string;
}
export class ProviderInformation{
    public contractType:string;
    public fromDate:string;
    public toDate:string;
    public paymentType:string;
    public account:string;
    public carrierlocality:string;
}
export class Clia{
    public certified:boolean;
    public waivable1:boolean;
    public waivable2:boolean;
}
export class AuthConfiguration{
    public validfrom:string;
    public allowedVisits:string;
    public acceptPatient:boolean;
    public allowasReferingProvider:boolean;
}
export class LetterDispatchMode{
    public authorization:string;
    public caseManagement:string;
    public claims:string;
    public clinicalAlerts:string;
    public credentialing:string;
    public hedis:string;
    public pdr:string;
    public referalTracking:string;
}
export class PrimaryLocation{
    public practiceType:string;
    public name:string;
    public address1:string;
    public address2:string;
    public aptno:string;
    public city:string;
    public zip:string;
    public state:string;
    public countryid:string;
    public country:string;
    public phone:string;
    public fax:string;
}
export class ContactStatus{
    public contractTemplate:string;
    public fromDate:string;
    public toDate:string;
}
export class OrganizationInformation{
    public organizationId:string;
    public organizationName:string;
    public organizationType:string;
    public organizationEffectiveFrom:string;
    public organizationEffectiveTo:string;
}
export class AppointmentStatus{
    public parentPayorFacility1:string;
    public parentPayorFacility2:string;
    public appType:string;
}
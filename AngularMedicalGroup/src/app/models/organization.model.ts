

export class Organization{
        public organizationID:string;
        public category:string;
        public organizationName:string;
        public organizationLongName:string;
        public accountingSystemName:string;
        public taxID:string;        
        public organizationNPI:string;
        public ssn:string;
        public taxonomyCode:string;
        public capitationAccount:string;
        public claimsAccount:string;
        public autoGenerateERA:string;
        public payToAddress:Address;
        public billingAddress:Address;
}
export class Address{
        public address1:string;
        public address2:string;
        public city:string;
        public state:string;
        public zip:string;
        public internationalZip:string;
        public countryDistict:string;
        public country:string;
        public phone:string;
        public faxNumber:string;
        public eMail:string;
        public contactPerson:string;
}
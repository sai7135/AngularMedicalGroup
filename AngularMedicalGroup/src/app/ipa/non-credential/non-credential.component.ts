import { Component, OnInit } from '@angular/core';
import {ProviderCategory,ProviderAddressCountry,ProviderContractTemplate,ProviderPracticeType,ProviderLetterMode,ProviderOrganizationType,ProviderAccount,ProviderPaymentType,ProviderContractType,PrimarySpeciality,ProviderType,ProviderSuffix,ProviderProfSuffix,ProviderGender,ProviderCitizenship,CarrierLocality} from '../../raw/providerdata';
import {StateService} from '../../raw/state.service';
import { FormGroup, FormControl, Validators, FormArray, Form } from '@angular/forms';
import {NoncredvalidateService} from '../validators/noncredvalidate.service';
import {ApicontactService} from '../../services/apicontact.service';
import {MatDialog} from '@angular/material/dialog';
import {MessageComponent} from '../../dialog/message/message.component';

@Component({
  selector: 'app-non-credential',
  templateUrl: './non-credential.component.html',
  styleUrls: ['./non-credential.component.css']
})
export class NonCredentialComponent implements OnInit {
  providerCreds:FormGroup;
  category;
  speciality:{abbrevation:string,name:string,name2?:string,name3?:string}[];
  type;
  suffix;
  lastName:string;
  profesuffix;
  gender;
  citizenship;
  carrierlocality;
  contractType;
  paymentType;
  account;
  carrierLocality;
  orgType;
  letterMode;
  providerPracticeType;
  providerContractTemplate;
  addressCountry;
  constructor(public statevalue:StateService,private matDialog:MatDialog,private validate:NoncredvalidateService,private api:ApicontactService) { }

  ngOnInit(): void {
    this.providerCreds=new FormGroup({
      "basicinformation":new FormGroup({
        'category':new FormControl(''),
        'npi':new FormControl(''),
        'providertype':new FormControl(''),
        'providerid':new FormControl(''),
        'primaryspeciality':new FormControl(''),
        'preferedspeciality':new FormControl(false),
        'referanymember':new FormControl(false),
        'nameTitle':new FormControl(''),
        'nameLast':new FormControl(''),
        'nameFirst':new FormControl(''),
        'nameMiddle':new FormControl(''),
        'nameSuffix':new FormControl(''),
        'nameProfSuffix':new FormControl(''),
        'nameMiddleName':new FormControl(''),
        'personalGender':new FormControl(''),
        'personalDateOfBirth':new FormControl(''),
        'personalSsn':new FormControl(''),
        'personalCitezenship':new FormControl(''),
        'personalBirthCity':new FormControl(''),
        'personalBirthState':new FormControl(''),
        'personalBirthCountry':new FormControl(''),
      }),
      'providerInformation':new FormGroup(
        {
          'contractType':new FormControl(''),
          'fromDate':new FormControl(''),
          'toDate':new FormControl(''),
          'paymentType':new FormControl(''),
          'account':new FormControl(''),
          'carrierlocality':new FormControl('')
        }
      ),
      'clia':new FormGroup({
        'certified':new FormControl(false),
        'waivable1':new FormControl(false),
        'waivable2':new FormControl(false)
      }),
      'authConfiguration':new FormGroup({
        'validfrom':new FormControl(''),
        'allowedVisits':new FormControl(''),
        'acceptPatient':new FormControl(true),
        'allowasReferingProvider':new FormControl('true')
      }),
     'letterDispatchMode':new FormGroup({
       'authorization':new FormControl('FAX'),
       'caseManagement':new FormControl('FAX'),
       'claims':new FormControl('FAX'),
       'clinicalAlerts':new FormControl('FAX'),
       'credentialing':new FormControl('FAX'),
       'hedis':new FormControl('NONE'),
       'pdr':new FormControl('FAX'),
       'referalTracking':new FormControl('FAX')
     }),
     'primaryLocation':new FormGroup({
       'practiceType':new FormControl(''),
       'name':new FormControl(''),
       'address1':new FormControl(''),
       'address2':new FormControl(''),
       'aptno':new FormControl(''),
       'city':new FormControl(''),
       'state':new FormControl(''),
       'zip':new FormControl(''),
       'countryid':new FormControl(''),
       'country':new FormControl(''),
       'phone':new FormControl(''),
       'fax':new FormControl('')
     }),
     'appointmentStatus':new FormGroup({
       'parentPayorFacility1':new FormControl('AMG'),
       'parentPayorFacility2':new FormControl('AMG'),
       'appType':new FormControl('')

     }),
     'contactStatus':new FormGroup({
       'contractTemplate':new FormControl(''),
       'fromDate':new FormControl(''),
       'toDate':new FormControl('')
     }),
     'organizationInformation':new FormArray([new FormGroup({
       'organizationId':new FormControl('',[],[this.validate.validorganization.bind(this.validate)]),
       'organizationName':new FormControl(''),
       'organizationType':new FormControl(''),
       'organizationEffectiveFrom':new FormControl(''),
       'organizationEffectiveTo':new FormControl('')
     })])
    });

    
    this.category=ProviderCategory;
    this.speciality=PrimarySpeciality;
    this.type=ProviderType;
    this.suffix=ProviderSuffix;
    this.profesuffix=ProviderProfSuffix;
    this.gender=ProviderGender;
    this.citizenship=ProviderCitizenship;
    this.carrierlocality=CarrierLocality;
    this.contractType=ProviderContractType;
    this.account=ProviderAccount;
    this.paymentType=ProviderPaymentType;
    this.orgType=ProviderOrganizationType;
    this.letterMode=ProviderLetterMode;
    this.providerPracticeType=ProviderPracticeType;
    this.providerContractTemplate=ProviderContractTemplate;
    this.addressCountry=ProviderAddressCountry;

    this.providerCreds.get("providerInformation").get("fromDate").valueChanges.subscribe(r=>{
      ((<FormArray>this.providerCreds.get("organizationInformation")).at(0)).get("organizationEffectiveFrom").patchValue(r)
      this.providerCreds.get("contactStatus").get("fromDate").patchValue(r)
    })
  }
  searchorganization(index:number){
    window.open('https://localhost:44344/AngularMedicalGroup/#/organizationsearch','_blank','width:100,height:100');
    const bc=new BroadcastChannel('sendorganization');
    bc.addEventListener('message',r=>{
      (<FormArray>this.providerCreds.get("organizationInformation")).at(index).get('organizationId').patchValue(r.data);
      bc.close();
    })
  }
  searchspeciality(value:string){
    this.speciality=PrimarySpeciality.reduce((output:{abbrevation:string,name:string,name2:string,name3:string}[],option)=>
    {
      if((new RegExp(value.toLowerCase())).test(option.name.toLowerCase())){
        const index=option.name.toLowerCase().search(new RegExp(value.toLowerCase()));
        output.push({abbrevation:option.abbrevation,name:option.name.substring(0,index),name2:option.name.substring(index,index+value.length),name3:option.name.substring(index+value.length,option.name.length)});
    }
    return output
  },[])
    //this.speciality=PrimarySpeciality.filter(option=>new RegExp(value.toLowerCase()).test(option.name.toLowerCase()))
  }
  remove(i){
    if((<FormArray>this.providerCreds.get("organizationInformation")).length>1)
    {
      (<FormArray>this.providerCreds.get("organizationInformation")).removeAt(i);
    }
  }
  addorgline(){
    (<FormArray>this.providerCreds.get("organizationInformation")).push(new FormGroup({
      'organizationId':new FormControl('',[],[this.validate.validorganization.bind(this.validate)]),
      'organizationName':new FormControl(''),
      'organizationType':new FormControl(''),
      'organizationEffectiveFrom':new FormControl(''),
      'organizationEffectiveTo':new FormControl('')
    }))
  }
  onSubmit(){
    if(this.providerCreds.valid){
    this.api.addProvider(this.providerCreds.value).subscribe(r=>{
      console.log(r);
      if(r){
        this.matDialog.open(MessageComponent,{
          width:'50vw',
          data:{title:'provider added',content:'provider has succesufllyadded'}
        })
        window.close();
      }
    },r=>{
      console.log(r);
      this.matDialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'provider cant be added',content:'provider cant be added some error occured'}
      })})
    }
  }
}

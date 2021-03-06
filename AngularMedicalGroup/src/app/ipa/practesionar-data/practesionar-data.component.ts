import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import {ProviderCategory,PrimarySpeciality,ProviderType} from '../../raw/providerdata';
import {read,WorkBook, WorkSheet} from 'xlsx';
import {ApicontactService} from '../../services/apicontact.service';
import {Provider} from '../../models/provider.model';
import { HttpEventType } from '@angular/common/http';
import {map} from 'rxjs/operators'
import {weblink} from '../../raw/defaultdata'

@Component({
  selector: 'app-practesionar-data',
  templateUrl: './practesionar-data.component.html',
  styleUrls: ['./practesionar-data.component.css']
})
export class PractesionarDataComponent implements OnInit {
  primarySpeciality;
  providerType;
  fileSelected:boolean;
  providerFile:File;
  value:boolean;
  uploadProgress;
  providerSelected:boolean;
  filelines=0;
  ProviderFile:File;
  @ViewChild("selectfile") chooser;
  @ViewChild("selectProviderFile") selectProviderFile;
  constructor(private api:ApicontactService) { }

  ngOnInit(): void {
    this.primarySpeciality=PrimarySpeciality;
    this.providerType=ProviderType;
    this.value=false;
    this.fileSelected=false;
    this.providerSelected=false;
    this.uploadProgress=0;
  }
  navlink(link:string){
    window.open(weblink+""+link,'_blank','width:100,height:100');
  }
  choosethefile(e){
    this.chooser.nativeElement.click()
  }
  upload(file){
    this.fileSelected=true;
    this.providerFile=file[0]
  }
  uploadfile(){
    const reader:FileReader=new FileReader();
    reader.onload=(e:any)=>{
      const wb:WorkBook=read(e.target.result,{type:'binary'});
      const ws:WorkSheet=wb.Sheets[wb.SheetNames[0]];
      console.log(ws);
      for(let key in ws){
        if(key!=='!ref'){
          if(key.replace(/[0-9]/g, '')==='A'){
                this.filelines++;
                if(key.replace(/[0-9]/g, '')!=='A'){
                  break;
                }
            }
        }
      }
      console.log(this.filelines);
      for(let i=2;i<=this.filelines;i++){
        this.api.addProvider({basicinformation:{npi:ws['A'+i].v,category:ws['E'+i].v,providertype:ws['D'+i].v,providerid:ws['B'+i].v,primaryspeciality:ws['C'+i].v,preferedspeciality:false,referanymember:false,nameTitle:ws['F'+i]?.v,nameLast:ws['F'+i]?.v,nameFirst:ws['H'+i]?.v,nameMiddle:ws['I'+i]?.v,nameSuffix:ws['J'+i]?.v,nameProfSuffix:ws['K'+i]?.v,nameMiddleName:ws['L'+i]?.v,personalGender:ws['M'+i]?.v,personalDateOfBirth:ws['N'+i]?.w,personalSsn:ws['O'+i]?.v,personalCitezenship:ws['P'+i]?.v,personalBirthCity:ws['Q'+i]?.v,personalBirthState:ws['R'+i]?.v,personalBirthCountry:ws['S'+i]?.v},providerInformation:{contractType:ws['T'+i].v,fromDate:ws['U'+i].w,toDate:ws['V'+i]?.w,paymentType:ws['W'+i].v,account:ws['X'+i].v,carrierlocality:ws['Y'+i].v},clia:{certified:false,waivable1:false,waivable2:false},authConfiguration:{validfrom:ws['AD'+i]?.v,allowedVisits:ws['AE'+i]?.v,acceptPatient:true,allowasReferingProvider:true},letterDispatchMode:{authorization:'FAX',caseManagement:'FAX',claims:'FAX',clinicalAlerts:'FAX',credentialing:'FAX',hedis:'NONE',pdr:'FAX',referalTracking:'FAX'},primaryLocation:{practiceType:ws['AF'+i].v,name:ws['AG'+i]?.v,address1:ws['AH'+i].v,address2:ws['AI'+i]?.v,aptno:ws['AJ'+i]?.v,city:ws['AK'+i].v,state:ws['AL'+i].v,zip:ws['AO'+i].v,countryid:ws['AM'+i]?.v,country:ws['AN'+i]?.v,phone:ws['AP'+i]?.v,fax:ws['AQ'+i]?.v},appointmentStatus:{parentPayorFacility1:'AMG',parentPayorFacility2:'AMG',appType:null},contactStatus:{contractTemplate:ws['AR'+i].v,fromDate:ws['AS'+i].w,toDate:ws['AT'+i]?.w},organizationInformation:[{organizationId:ws['Z'+i].v,organizationName:null,organizationType:ws['AA'+i].v,organizationEffectiveFrom:ws['AB'+i].v,organizationEffectiveTo:ws['AC']?.v}]}).subscribe()
      }
      this.filelines=0;
      // for(let key in ws){
      //   if(key !== '!ref'){
      //     if(key.match(/\d+/g)[0] !== "1"){
      //       if(key.replace(/[0-9]/g, '')==='A'){
              
      //       }
      //     }
      //   }
      // }
    }
    reader.readAsBinaryString(this.providerFile);
  }
  chooseProvider(){
    this.selectProviderFile.nativeElement.click();
  }

  selectProvider(files){
    this.providerSelected=true;
    this.ProviderFile=files[0];
  }
  uploadProviders(){
    const formData:FormData=new FormData();
    formData.append('providerfile',this.ProviderFile);
    this.api.addProviders(formData).pipe(map(event=>{
      switch(event.type){
        case(HttpEventType.UploadProgress):{
          const percentDone=Math.round(100*event.loaded/event.total);
          return {status:'progress',message:percentDone}
        }
        default:{
          return {status:'',message:0};
        }
      }
    })).subscribe(r=>{
      this.uploadProgress=r.message;
      if(r.message==100){

      }
    })
  }
}

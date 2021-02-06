import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders, HttpUrlEncodingCodec, HttpParams} from '@angular/common/http';
import { Observable } from 'rxjs';
import {ChangePasswordModel} from '../models/changepassword.model';
import {MessageComponent} from '../dialog/message/message.component';
import {MatDialog} from '@angular/material/dialog';
import {Router} from '@angular/router';
import {ResetPassword} from '../models/resetpassword.model';
import {CommunicateService} from '../services/communicate.service';
import {Organization} from '../models/organization.model';
import {RegistrationModel} from '../models/registration.model';
import {Provider} from '../models/provider.model';
import {BenefitMasterModel} from '../models/benefitmaster.model';
import { ClaimsTable } from '../models/claimstable.model';
import {Members} from '../models/member.model';
import {PcpSearchResult} from '../models/pcpsearchresult.model';
import {saveAs} from 'file-saver';

@Injectable({
  providedIn: 'root'
})
export class ApicontactService {

  constructor(private http:HttpClient,public matDialog:MatDialog,private router:Router,private comm:CommunicateService) { }
  public getfiletext(fileid:string){
    const REQUEST_PARAMS=new HttpParams().set("fileName",fileid+".txt");
    return this.http.get("https://localhost:44345/api/Users/getEDI?fileid="+fileid,{
      params:REQUEST_PARAMS,
      responseType:'arraybuffer'
    }).subscribe(data=>{
      saveAs(new Blob([data],{type:'text/plain'}),fileid+".txt");
    });
  }
  public modifyMember(member:Members){
    return this.http.put("https://localhost:44345/api/Users/setMember",member);
  }
  public searchMember(ms):Observable<Members[]>{
    return this.http.post<Members[]>("https://localhost:44345/api/Users/searchMember",ms);
  }
  public selectMember(memberId:string,healthPlan:string):Observable<Members>{
    return this.http.get<Members>("https://localhost:44345/api/Users/GetMember?memberid="+memberId+"&healthplan="+healthPlan);
  }
  public searchPCP(pcpid:string,npi:string,lastName:string,firstName:string,organizationName:string,address1:string,address2:string,city:string,state:string,postalCode:string){
    return this.http.get<PcpSearchResult[]>("https://localhost:44345/api/Users/searchProvider?pcpid="+pcpid+"&pcpnpi="+npi+"&lastName="+lastName+"&firstName="+firstName+"&organizationName="+organizationName+"&address1="+address1+"&address2="+address2+"&city="+city+"&state="+state+"&postalCode="+postalCode);
  }
  public searchBenefitMaster(hp:string,benCode:string){
    return this.http.get<BenefitMasterModel[]>("https://localhost:44345/api/Users/searchBenefit?healthplan="+hp+"&healthplancode="+benCode);
  }
  public createMember(model:Members){
    return this.http.post("https://localhost:44345/api/Users/createMember",model);
  }
  public getPcpOrganization(pcpid:string):Observable<{organizationName:string;providerLastName:string;providerFirstName:string}>{
    return this.http.get<{organizationName:string;providerLastName:string;providerFirstName:string}>("https://localhost:44345/api/Users/getPcpOrganization?pcpid="+pcpid);
  }
  public getBenefitMasterDescription(hpCode:string,benefitcode:string):Observable<string>{
    return this.http.get<string>("https://localhost:44345/api/Users/searchBenefitCode?healthPlanCode="+hpCode+"&benefitCode="+benefitcode);
  }
  public getAllClaims():Observable<ClaimsTable[]>{
    return this.http.get<ClaimsTable[]>("https://localhost:44345/api/Users/allclaims");
  }
  public searchOrganization(query:string=null):Observable<Organization[]>{
    return this.http.post<Organization[]>("https://localhost:44345/api/Users/SearchOrganization?searchquery="+encodeURIComponent(query),{});
  }
  public addBenefitMaster(model:BenefitMasterModel)
  {
    return this.http.post("https://localhost:44345/api/Users/BenefitMasterAdd",model,{headers:new HttpHeaders({'Content-Type':'application/json'})});
  }
  public getBenefitMaster(){
    return this.http.get<BenefitMasterModel[]>("https://localhost:44345/api/Users/GetBenefitMaster");
  }
  public uploadEdi(formData:FormData){
    return this.http.post("https://localhost:44345/api/Users/EdiUpload",formData);
  }
  public addProviders(formData:FormData){
    return this.http.post("https://localhost:44345/api/Users/addProviders",formData,{
      reportProgress:true,
      observe:'events'
    });
  }
  public addProvider(providerdata:Provider){
    return this.http.post("https://localhost:44345/api/Users/addProvider",providerdata);
  
  }
  public checkuser(user:string){
    return this.http.post("https://localhost:44345/api/Account/useridcheck?userid="+user,"");
  }
  public resetPassword(model:ResetPassword){
    this.comm.communicate.emit(true);
    this.http.post("https://localhost:44345/api/Account/RechangePassword",model,{
        headers:new HttpHeaders().set("Content_Type","application/json")
    }).subscribe(
      r=>{
        this.comm.communicate.emit(false);
        this.matDialog.open(MessageComponent,{
          width:'50vw',
          data:{title:'password changed',content:'password changed'}
        });
        this.router.navigate(["login"]);
      },r=>{
        this.comm.communicate.emit(false);
        this.matDialog.open(MessageComponent,{
          width:'50vw',
          data:{title:'password not changed',content:'some error occured please try again'}
        })
      }
    );
  }
  public addOrganiztion(model:Organization){
    model.payToAddress.phone=this.phoneformater(model.payToAddress.phone);
    model.payToAddress.faxNumber=this.phoneformater(model.payToAddress.faxNumber);
    model.billingAddress.phone=this.phoneformater(model.billingAddress.phone);
    model.billingAddress.faxNumber=this.phoneformater(model.billingAddress.faxNumber);
    this.http.post("https://localhost:44345/api/Users/addOrganization",model).subscribe(r=>{
      this.matDialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'organization added',content:'organization has successfully added'}
      }); 
    this.router.navigate(['ipa/organization']);
    },r=>{
      this.matDialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'organization not added',content:'organization has not added'}
      })
    });
  }
  public phoneformater(phone:string):string{
    var newVal=phone.replace(/\D/g,'');
    if(newVal.length<=10){
      newVal = newVal.replace(/^(\d{0,3})(\d{0,3})(.*)/, '($1) $2-$3');
    }
    return newVal;
  }
  public registerUser(model:RegistrationModel){
    this.http.post("https://localhost:44345/api/Account/Register",model).subscribe(r=>{
      this.matDialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'User Registered',content:'user has been registered'}
      });
      this.router.navigate(["ipa"]);
    },r=>{
      this.matDialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'User Not Registered',content:'user not registered some error occured'}
      });
    })
  }

  public getToken(logindetails:{username : string ,password : string}):Observable<any>{
    return this.http.post("https://localhost:44345/token",`username=${logindetails.username}&password=${logindetails.password}&grant_type=password`,
    {
      headers:new HttpHeaders({
        'Content_Type':'application/x-www-formurlencoded'
      })
    });
  }

  public ApiChangePassword(changepassword:ChangePasswordModel):Observable<any>{
    return this.http.post("https://localhost:44345/api/Account/ChangePassword",changepassword);
  }
  public ForgetPasswordToken(emails:string){
    this.comm.communicate.emit(true);
    this.http.post("https://localhost:44345/api/Account/ForgotPasswordToken?email="+emails,{
      // headers:new HttpHeaders().set('Content_Type','application/json')
    }).subscribe(r=>{
        this.comm.communicate.emit(false);
        this.matDialog.open(MessageComponent,{
          width:'50vw',
          data:{title:"confirmation",content:"confirmation mail sent"}
        });
        this.router.navigate(["/login"]);
    },r=>{
      this.comm.communicate.emit(false);
      this.matDialog.open(MessageComponent,{
        width:'50vw',
        data:{title:"change password",content:"a problem occured"}
      });
    });
  }
}

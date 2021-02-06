import { Injectable } from '@angular/core';
import { Observable, Subscriber } from 'rxjs';
import {map, catchError} from 'rxjs/operators';
import {HttpClient, HttpErrorResponse} from '@angular/common/http';
import {Router} from '@angular/router';
import {CommunicateService} from '../services/communicate.service';
import {ChangePasswordModel} from '../models/changepassword.model';
import {ApicontactService} from '../services/apicontact.service';
import {MatDialog} from '@angular/material/dialog';
import {MessageComponent} from '../dialog/message/message.component';

@Injectable({
  providedIn: 'root'
})
export class TokenManagerService {

  constructor(private matDialog:MatDialog,private http:HttpClient,private router:Router,private comm:CommunicateService,private api:ApicontactService) { }
  saveToken(token:string,role:string){
    localStorage.setItem('angularToken',token);
    localStorage.setItem('role',role)
  }
  changepassword(passwords:ChangePasswordModel){
    this.api.ApiChangePassword(passwords).subscribe(r=>{
      this.removeToken();
      this.matDialog.open(MessageComponent,{
        width:'50vw',
        data:{title:"change password",content:"password has been changed"}
      })
    },r=>{
      this.matDialog.open(MessageComponent,{
        width:'50vw',
        data:{title:"change password",content:"password not changed"}
      })
      
    });
  }
  removeToken(){
    this.comm.communicate.emit(true);
    this.http.post("https://localhost:44345/api/Account/Logout",{}).subscribe(r=>{
      this.router.navigate(["/login"]);
      localStorage.removeItem('angularToken');
    })
  }
  isAuthoroized():Observable<boolean>{
      if(!!localStorage.getItem('angularToken')){
      return this.http.get("https://localhost:44345/api/users").pipe(map(r=>{
      return true},r=>{
        console.log(r);
        return false;
      }))
    }
    else{
        return Observable.create(ob=>{
          ob.next(false);
        });
      }
  }
}

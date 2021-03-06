import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import {ApicontactService} from '../services/apicontact.service'
import { NgForm } from '@angular/forms';
import {MatSnackBar,MatSnackBarConfig} from '@angular/material/snack-bar';
import {TokenManagerService} from '../services/token-manager.service';
import {Router} from '@angular/router';
import {CommunicateService} from '../services/communicate.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  encapsulation:ViewEncapsulation.None
})
export class LoginComponent implements OnInit {
  constructor(private contact:ApicontactService,private snackBar : MatSnackBar,private tm:TokenManagerService,private router:Router,private comm:CommunicateService) {
   }
   config:MatSnackBarConfig={
    verticalPosition:'top',
    horizontalPosition:'center',
    panelClass:'notification'
  };
  ngOnInit(): void {
  }
  forgotpassword():void{
    this.router.navigate(["/forgotpassword"]);
  }
  login(details:NgForm){
    if(details.valid){
      this.comm.communicate.emit(true);
    this.contact.getToken({username:details.value.username,password:details.value.password}).subscribe(r=>
      {
        this.tm.saveToken(r.access_token,r.role)
        this.router.navigate(["/ipa"]);
      },r=>{
        this.comm.communicate.emit(false);
      this.snackBar.open("invalid username or password","x",this.config);
    });
    }
    else{
      this.snackBar.open("please enter both user name and password","x",
        this.config
      );
    }
  }
}

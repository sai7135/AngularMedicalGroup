import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Params} from '@angular/router';
import {ApicontactService} from '../services/apicontact.service';
import {MatDialog} from '@angular/material/dialog';
import {MessageComponent} from '../dialog/message/message.component';
import {CommunicateService} from '../services/communicate.service';

@Component({
  selector: 'app-verification',
  templateUrl: './verification.component.html',
  styleUrls: ['./verification.component.css']
})
export class VerificationComponent implements OnInit {

  constructor(private route:ActivatedRoute,private apiContact:ApicontactService,private comm:CommunicateService,private matDialog:MatDialog) { }
  token:string;
  email:string;
  password:string;
  confirmpassword:string;
  ngOnInit(): void {
    this.route.queryParams.subscribe((params:Params)=>{
      this.token=params['token'];
      this.email=params['email'];
    });
  }
  send(){
    if(this.password !== this.confirmpassword){
      this.matDialog.open(MessageComponent,{
        width:"50vw",
        data:{title:"change password",content:"New Password and Confirm Password doesn't match"}
      });
    }
    else{
      this.apiContact.resetPassword({Email:this.email,Password:this.password,ConfirmPassword:this.confirmpassword,token:this.token});
    }
  }
}

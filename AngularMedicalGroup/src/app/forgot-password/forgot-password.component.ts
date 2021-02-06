import { Component, OnInit } from '@angular/core';
import {ApicontactService} from '../services/apicontact.service';

@Component({
  selector: 'app-forgot-password',
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.css']
})
export class ForgotPasswordComponent implements OnInit {
  email:string
  constructor(private apicontact : ApicontactService) { }

  ngOnInit(): void {
  }
  send(){
    this.apicontact.ForgetPasswordToken(this.email);
  }
}

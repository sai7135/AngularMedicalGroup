import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, AbstractControl } from '@angular/forms';
import {ApicontactService} from '../../services/apicontact.service';
import {RegistrationValidatorsService} from '../validators/registration-validators.service';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {
  registerform:FormGroup;
  constructor(private api:ApicontactService,private registerValidator:RegistrationValidatorsService) { 
    
  }
  ngOnInit(): void {
    this.registerform=new FormGroup({
      "username":new FormControl('',[Validators.required],this.registerValidator.validate.bind(this.registerValidator)),
      "email":new FormControl('',Validators.required),
      "password":new FormControl('',[Validators.required,Validators.minLength(5)]),
      "confirmpassword":new FormControl('',[Validators.required]),
      "role":new FormControl('users',Validators.required)
    });
  }
  submit(){
    this.api.registerUser(this.registerform.value);
  }
}

import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl, Validators} from '@angular/forms';
import {ApicontactService} from '../../services/apicontact.service';
import {AddorgValidatorsService} from '../validators/addorg-validators.service';
import {MatDialog} from '@angular/material/dialog';
import {MessageComponent} from '../../dialog/message/message.component';

@Component({
  selector: 'app-addorganization',
  templateUrl: './addorganization.component.html',
  styleUrls: ['./addorganization.component.css']
})
export class AddorganizationComponent implements OnInit {

  constructor(private api:ApicontactService,private addorgvalidator:AddorgValidatorsService,private matDialog:MatDialog) { }
  addOrg:FormGroup;
  show:boolean=false;
  bc:BroadcastChannel;
  showinvalidcolumns={};

  ngOnInit(): void {
    this.addOrg=new FormGroup({
      organizationID:new FormControl('',Validators.required,this.addorgvalidator.validate.bind(this.addorgvalidator)),
      category:new FormControl(''),
      organizationName:new FormControl('',Validators.required),
      organizationLongName:new FormControl('',Validators.required),
      accountingSystemName:new FormControl(''),
      taxID:new FormControl('',[Validators.required,Validators.minLength(9),Validators.maxLength(9)]),
      organizationNPI:new FormControl('',[Validators.required,Validators.minLength(10),Validators.maxLength(10)]),
      ssn:new FormControl(''),
      taxonomyCode:new FormControl('',Validators.required),
      capitationAccount:new FormControl(''),
      claimsAccount:new FormControl(''),
      autoGenerateERA:new FormControl(false),
      payToAddress:new FormGroup({
        address1:new FormControl('',Validators.required),
        address2:new FormControl(''),
        city:new FormControl('',Validators.required),
        state:new FormControl('',Validators.required),
        zip:new FormControl('',Validators.required),
        internationalZip:new FormControl(''),
        countryDistict:new FormControl(''),
        country:new FormControl(''),
        phone:new FormControl(''),
        faxNumber:new FormControl(''),
        eMail:new FormControl(''),
        contactPerson:new FormControl('')
      }),
      billingAddress:new FormGroup({
        address1:new FormControl(''),
        address2:new FormControl(''),
        city:new FormControl(''),
        state:new FormControl(''),
        zip:new FormControl(''),
        internationalZip:new FormControl(''),
        countryDistict:new FormControl(''),
        country:new FormControl(''),
        phone:new FormControl(''),
        faxNumber:new FormControl(''),
        eMail:new FormControl(''),
        contactPerson:new FormControl('')
      })
    });
  }
  billingaddressstatesearchopen(){
    const win=window.open("https://localhost:44344/AngularMedicalGroup/#/statesearch","_blank","width:100;height:100");
    this.bc=new BroadcastChannel("state");
    this.bc.addEventListener('message',this.billingstatelistner.bind(this));
  }
  billingstatelistner(e){
    this.addOrg.get('billingAddress').patchValue({
      'state':e.data
    });
    this.bc.close();
  }
  paytoaddressstatesearchopen(){
    const win=window.open("https://localhost:44344/AngularMedicalGroup/#/statesearch","_blank","width:100;height:100");
    this.bc=new BroadcastChannel("state");
    this.bc.addEventListener('message',this.pahytostatelistner.bind(this));
  }
  pahytostatelistner(e){
    this.addOrg.get('payToAddress').patchValue({
      'state':e.data
    });
    this.bc.close();
  }
  sameasPrimary(e){
    if(e.target.checked){
      this.addOrg.patchValue({
        'billingAddress':this.addOrg.get('payToAddress').value
      });
    }
  }
  onSubmit():void{
    if(this.addOrg.invalid){
      this.matDialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'invalid data',content:'please enter valid information and try again'}
      });
      this.show=true;
    }
    else{
      this.api.addOrganiztion(this.addOrg.value);
    }
    console.log(this.addOrg);
  }
}

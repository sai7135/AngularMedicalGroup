import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl, FormArray, Validators} from '@angular/forms';
import {ApicontactService} from '../../services/apicontact.service';
import {MatDialog} from '@angular/material/dialog';
import {Router} from '@angular/router';
import {MessageComponent} from '../../dialog/message/message.component';
import { title } from 'process';

@Component({
  selector: 'app-add-benefit-master',
  templateUrl: './add-benefit-master.component.html',
  styleUrls: ['./add-benefit-master.component.css']
})
export class AddBenefitMasterComponent implements OnInit {
  benefitMasterForm:FormGroup;
  constructor(private api:ApicontactService,private dialog:MatDialog,private router:Router) { }
  ngOnInit(): void {
    this.benefitMasterForm=new FormGroup(
      {
        'healthPlanCode':new FormControl(null,Validators.required),
        'employerGroup':new FormControl(),
        'benefitCode':new FormControl(null,Validators.required),
        'description':new FormControl(null,Validators.required),
        'dateRange':new FormGroup({
          'effectiveFromDate':new FormControl(null,Validators.required),
          'toDate':new FormControl(),
          'accumuilation':new FormControl()
        }),
        'lineOfbusiness':new FormGroup({
          'lineofbusiness':new FormControl('HMO')
        }),
        'set':new FormGroup({
          'financialResponsibility':new FormControl()
        }),
        'memberFamilyLimit':new FormGroup({
          'HMO':new FormGroup({
            'oopMaximumMember':new FormControl(),
            'oopMaximumSubscriber':new FormControl(),
            'deductableForMember':new FormControl(),
            'deductableForSubscriber':new FormControl()
          }),
          'PPO':new FormGroup({
              'inoopMaximumMember':new FormControl(),
              'inoopMaximumSubscriber':new FormControl(),
              'indeductableForMember':new FormControl(),
              'indeductableForSubscriber':new FormControl(),
              'outoopMaximumMember':new FormControl(),
              'outoopMaximumSubscriber':new FormControl(),
              'outoopdeductableMember':new FormControl(),
              'outoopdeductableSubscriber':new FormControl(),
              'oopMaximumCombinedMember':new FormControl(),
              'oopMaximumCombinedSubscriber':new FormControl(),
              'deductableCombinedMember':new FormControl(),
              'deductableCombinedSubscriber':new FormControl(),
          })
        }),
        'note':new FormGroup({
          'note':new FormControl()
        })
      }
    )
  }
  SaveBenefitMaster(){
    if(this.benefitMasterForm.valid)
    {
      this.api.addBenefitMaster(this.benefitMasterForm.value).subscribe(r=>{console.log(r);
        this.dialog.open(MessageComponent,{
          width:'50vw',
          data:{title:'Benefit Added',content:'Benefit has succesfully added'}
        });
        this.router.navigate(["ipa/benefit-master"]);
      },r=>{
        this.dialog.open(MessageComponent,{
          width:'50vw',
          data:{title:'Some error occured',content:'Some error occured please try again'}
        });
      })
    }
    else
    {
        this.dialog.open(MessageComponent,{
          width:'50vw',
          data:{title:'invalid data',content:'invalid data please enter all required fields'}
        });
    }
  }

}

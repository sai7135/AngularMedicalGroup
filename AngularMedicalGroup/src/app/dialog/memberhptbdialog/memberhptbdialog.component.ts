import { Inject } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-memberhptbdialog',
  templateUrl: './memberhptbdialog.component.html',
  styleUrls: ['./memberhptbdialog.component.css']
})
export class DialogData{
  
  HealthPlanData:MemberHPData[];
}
export class MemberHPData{
  HP:string;
  BenefitCode:string;
  HealthPlanFromDate:string;
  HealthPlanToDate:string;
}
export class MemberhptbdialogComponent implements OnInit {
  constructor(
    public dialogRef: MatDialogRef<MemberhptbdialogComponent>,
    @Inject(MAT_DIALOG_DATA) public datas: DialogData) {}

  ngOnInit(): void {
    
}
  onSubmit=function(){

  }
}
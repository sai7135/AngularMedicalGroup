import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { FormGroup, FormControl } from '@angular/forms';
import { ApicontactService } from 'src/app/services/apicontact.service';
import { Members } from 'src/app/models/member.model';
import { SearchbenefitmasterComponent } from '../searchbenefitmaster/searchbenefitmaster.component';

@Component({
  selector: 'app-membersearch',
  templateUrl: './membersearch.component.html',
  styleUrls: ['./membersearch.component.css']
})
export class MembersearchComponent implements OnInit {

  constructor(public dialogRef:MatDialogRef<MembersearchComponent>,private api:ApicontactService) { }
  membersearchfrom:FormGroup;
  members:Members[]
  ngOnInit(): void {
    this.membersearchfrom=new FormGroup({
      'memberID':new FormControl(),
      'firstName':new FormControl(),
      'lastName':new FormControl(),
      'dob':new FormControl(),
      'hp':new FormControl()
    });
    this.members=[];
  }
  search=function(){
    this.api.searchMember(this.membersearchfrom.value).subscribe(r=>{
      this.members=r;
    });
    console.log(this.members)
  }
}

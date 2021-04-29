import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import { ApicontactService } from 'src/app/services/apicontact.service';

@Component({
  selector: 'app-search-member',
  templateUrl: './search-member.component.html',
  styleUrls: ['./search-member.component.css']
})
export class SearchMemberComponent implements OnInit {
  MemberSearchGroup:FormGroup
  constructor(private api:ApicontactService) { }

  ngOnInit(): void {
    this.MemberSearchGroup=new FormGroup({
      'memid':new FormControl(),
      'lastname':new FormControl(),
      'firstname':new FormControl(),
      'hp':new FormControl(),
      'gender':new FormControl(),
      'dob':new FormControl
    });
    
  }
  
  search(){
    this.api.searchMemberClaim(this.MemberSearchGroup.value).subscribe(r=>{
      console.log(r);
    });
  }
  close(){
    window.close();
  }
}

import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {ApicontactService} from '../../services/apicontact.service';
import { DataSource } from '@angular/cdk/table';
import { Organization } from 'src/app/models/organization.model';
import { MatTableDataSource } from '@angular/material/table';
@Component({
  selector: 'app-organization',
  templateUrl: './organization.component.html',
  styleUrls: ['./organization.component.css']
})
export class OrganizationComponent implements OnInit {
  organizationData:MatTableDataSource<Organization>;
  displayedColumns:string[];
  constructor(private router:Router,private api:ApicontactService) { 

  }

  ngOnInit(): void {
    this.api.searchOrganization().subscribe(r=>
      {
        this.organizationData=new MatTableDataSource<Organization>();
        this.organizationData.data=r;
        this.displayedColumns= ['organizationID', 'organizationName', 'category', 'payToAddress.city','payToAddress.state','payToAddress.phone','taxID','organizationNPI','capitationAccount','claimsAccount'];
          
      }
          );
  }
  add(){
    this.router.navigate(["ipa/addorganization"]);
  }
}

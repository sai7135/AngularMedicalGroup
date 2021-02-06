import { Component, OnInit } from '@angular/core';
import {ApicontactService} from '../../services/apicontact.service'
import { FormGroup, FormControl } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import {Organization} from '../../models/organization.model'

@Component({
  selector: 'app-organizationsearchwindow',
  templateUrl: './organizationsearchwindow.component.html',
  styleUrls: ['./organizationsearchwindow.component.css']
})
export class OrganizationsearchwindowComponent implements OnInit {
  organizationSearchValues:MatTableDataSource<Organization>;
  organizationsearchform:FormGroup;
  displayedColumns=['organizationID','organizationName','payToAddress.address1','payToAddress.city','payToAddress.state','payToAddress.zip','organizationNPI','taxID']
  constructor(private api:ApicontactService) {
   }

  ngOnInit(): void {
    this.organizationsearchform=new FormGroup({
      'organizationId':new FormControl(''),
      'taxId':new FormControl(''),
      'name':new FormControl(''),
      'npi':new FormControl('')
    })
    this.organizationSearchValues=new MatTableDataSource<Organization>();
  }
  search(){
    console.log('organizationId like \'%'+this.organizationsearchform.get('organizationId').value+'%\' and organizationName like \'%'+this.organizationsearchform.get('name').value+'%\' and taxId like \'%'+this.organizationsearchform.get('taxId').value+'%\' and organizationNpi like \'%'+this.organizationsearchform.get('npi').value+'%\'')
    this.api.searchOrganization('organizationId like \'%'+this.organizationsearchform.get('organizationId').value+'%\' and ( upper(organizationName) like \'%'+this.organizationsearchform.get('name').value.toUpperCase()+'%\' or upper(organizationLongName) like \'%'+this.organizationsearchform.get('name').value.toUpperCase()+'%\') and taxId like \'%'+this.organizationsearchform.get('taxId').value+'%\' and organizationNpi like \'%'+this.organizationsearchform.get('npi').value+'%\'').subscribe(r=>{
      console.log(r)
      this.organizationSearchValues.data=r;
    })
  }
  selectOrganization(value:string){
    const bc=new BroadcastChannel('sendorganization');
    bc.postMessage(value);
    window.close();
  }

}

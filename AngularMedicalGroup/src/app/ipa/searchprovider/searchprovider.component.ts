import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { PcpSearchResult } from 'src/app/models/pcpsearchresult.model';
import { ApicontactService } from 'src/app/services/apicontact.service';

@Component({
  selector: 'app-searchprovider',
  templateUrl: './searchprovider.component.html',
  styleUrls: ['./searchprovider.component.css']
})
export class SearchproviderComponent implements OnInit {
  dataSource:MatTableDataSource<PcpSearchResult>;
  pcpid:string="";
  npi:string="";
  lastName:string="";
  firstName:string="";
  organizationName:string="";
  address1:string="";
  address2:string="";
  city:string="";
  state:string="";
  postalCode:string="";
  displayedColumns:string[];
  constructor(private api:ApicontactService) { }

  ngOnInit(): void {
    this.dataSource=new MatTableDataSource<PcpSearchResult>();
    this.displayedColumns=["Pcpid","ProviderNpi","LastName","FirstName","Taxid","Phone","Fax","ContractType","OrganizationName","ContractFromDate","ContractToDate"];
  }
  istermed=function(date):boolean{
    return new Date()>new Date(date);
  }
  search=function(){
    this.api.searchPCP(this.pcpid,this.npi,this.lastName,this.firstName,this.organizationName,this.address1,this.address2,this.city,this.state,this.postalCode).subscribe(r=>{
      this.dataSource.data=r;

    });
  }
  select=function(providerid,providerlastname,providerfirstname,organizationName){
    const bc=new BroadcastChannel('sendpcpid'); 
    const pcp={pcpid:providerid,pcpName:providerlastname+" "+providerfirstname,orgName:organizationName}
    bc.postMessage(pcp);
    window.close();
  }
}

import { Component, OnInit } from '@angular/core';
import { ClaimsTable } from 'src/app/models/claimstable.model';
import { MatTableDataSource } from '@angular/material/table';
import {ApicontactService} from '../../services/apicontact.service';
import {weblink} from '../../raw/defaultdata';

@Component({
  selector: 'app-claim-listing',
  templateUrl: './claim-listing.component.html',
  styleUrls: ['./claim-listing.component.css']
})
export class ClaimListingComponent implements OnInit {
  
  displayedColumns:string[];
  claimsData:MatTableDataSource<ClaimsTable>;
  constructor(private api:ApicontactService) { }

  ngOnInit(): void {
    this.api.getAllClaims().subscribe(r=>{
      this.claimsData=new MatTableDataSource<ClaimsTable>();
      this.claimsData.data=r;
    })
    this.displayedColumns=["fileID","clmid","memberid","membername","dob","renderingprovider","claimNo","dcn","billedamount","tradingPartner","uploadDate"];
  }
  openClaim(clmid:string){
    const win=window.open(weblink+"claim-view?claimid="+clmid,"_blank","width:"+screen.width+",height:"+screen.height+",top=0,left=0,fullscreen=yes");
  }
  downloadfile(fileid:string){
    this.api.getfiletext(fileid);
  }

}

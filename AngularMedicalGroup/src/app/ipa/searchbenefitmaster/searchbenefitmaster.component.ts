import { Component, OnInit } from '@angular/core';
import { ApicontactService } from 'src/app/services/apicontact.service';
import { MatTableDataSource } from '@angular/material/table';
import { BenefitMasterModel } from 'src/app/models/benefitmaster.model';

@Component({
  selector: 'app-searchbenefitmaster',
  templateUrl: './searchbenefitmaster.component.html',
  styleUrls: ['./searchbenefitmaster.component.css']
})
export class SearchbenefitmasterComponent implements OnInit {
  healthPlan:string;
  benefitCode:string;
  displayedColumns:string[];
  dataSource:MatTableDataSource<BenefitMasterModel>;
  constructor(private api:ApicontactService) { }

  ngOnInit(): void {
    this.displayedColumns=['healthPlanCode','benefitCode','description'];
    this.dataSource=new MatTableDataSource<BenefitMasterModel>();
    this.search();
  }
  search=function(){
    this.api.searchBenefitMaster(this.healthPlan,this.benefitCode).subscribe(
      r=>this.dataSource.data=r
    );
  }
  hpselected=function(i){
    const healthPlan=this.dataSource.data[i].healthPlanCode;
    const benefitCodes=this.dataSource.data[i].benefitCode;
    const bc=new BroadcastChannel('sendhp');
    bc.postMessage({
      hp:healthPlan,
      benefitCode:benefitCodes
    });
    window.close();
  }
}

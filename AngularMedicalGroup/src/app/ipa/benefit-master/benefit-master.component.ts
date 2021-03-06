import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {ApicontactService} from '../../services/apicontact.service';
import { MatTableDataSource } from '@angular/material/table';
import { BenefitMasterModel } from 'src/app/models/benefitmaster.model';

@Component({
  selector: 'app-benefit-master',
  templateUrl: './benefit-master.component.html',
  styleUrls: ['./benefit-master.component.css']
})
export class BenefitMasterComponent implements OnInit {
  benefitMasterData:MatTableDataSource<BenefitMasterModel>;
  displayedColumns:string[];
  constructor(private router:Router,private _api:ApicontactService) { }

  ngOnInit(): void {
    this._api.getBenefitMaster().subscribe(r=>{
      this.benefitMasterData=new MatTableDataSource<BenefitMasterModel>();
      this.benefitMasterData.data=r;
      this.displayedColumns=["healthPlanCode","benefitCode","employerGroup","dateRange.effectiveFromDate","dateRange.toDate","set.financialResponsibility"];
    })
  }
  addbenefit(){
    this.router.navigate(["ipa/addbenefit-master"]);
  }
}

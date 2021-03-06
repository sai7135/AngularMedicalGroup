import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AddBenefitMasterComponent } from 'src/app/ipa/add-benefit-master/add-benefit-master.component';
import { Routes, RouterModule } from '@angular/router';


const appRoutes:Routes=[
  {
    path:'',component:AddBenefitMasterComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class AddBenefitMasterRouteModule { }

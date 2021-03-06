import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { BenefitMasterComponent } from '../../ipa/benefit-master/benefit-master.component';

const appRoutes:Routes=[
  {
    path:'',component:BenefitMasterComponent
  }
]


@NgModule({
  declarations: [],
  imports: [RouterModule.forChild(appRoutes)]
})
export class BenfitMasterRouteModule { }

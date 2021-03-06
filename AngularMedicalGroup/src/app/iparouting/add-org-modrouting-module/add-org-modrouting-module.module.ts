import { NgModule } from '@angular/core';
import { AddorganizationComponent } from '../../ipa/addorganization/addorganization.component';
import { Routes, RouterModule } from '@angular/router';

const appRoutes:Routes=[
  {
    path:'',component:AddorganizationComponent
  }
]


@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class AddOrgModroutingModuleModule { }

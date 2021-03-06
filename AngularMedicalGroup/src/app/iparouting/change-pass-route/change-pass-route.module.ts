import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { Routes, RouterModule } from '@angular/router';
import { ChangepasswordComponent } from '../../ipa/changepassword/changepassword.component';
const appRoutes:Routes=[
  {
    path:'',component:ChangepasswordComponent
  }
]
@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    RouterModule.forChild(appRoutes)
  ]
})
export class ChangePassRouteModule { }

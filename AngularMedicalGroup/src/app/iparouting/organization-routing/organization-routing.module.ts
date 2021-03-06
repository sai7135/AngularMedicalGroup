import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule,Routes, Router } from '@angular/router';
import { OrganizationComponent } from '../../ipa/organization/organization.component';

const appRoutes:Routes=[
  {
    path:'',component:OrganizationComponent
  }
]


@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class OrganizationRoutingModule { }

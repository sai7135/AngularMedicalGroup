import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OrganizationsearchwindowComponent } from 'src/app/ipa/organizationsearchwindow/organizationsearchwindow.component';
import { Routes, RouterModule } from '@angular/router';

const appRoutes:Routes=[
  {
    path:'',component:OrganizationsearchwindowComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class OrganizationSearchRouteModule { }

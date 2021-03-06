import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RegistrationComponent } from 'src/app/ipa/registration/registration.component';
import { Routes, RouterModule } from '@angular/router';

const appRoutes:Routes=[
  {
    path:'',component:RegistrationComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class RegistraionRouteModule { }

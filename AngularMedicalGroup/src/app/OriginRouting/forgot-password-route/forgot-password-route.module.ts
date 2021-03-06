import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { ForgotPasswordComponent } from 'src/app/forgot-password/forgot-password.component';

const appRoutes:Routes=[
  {
    path:'',component:ForgotPasswordComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class ForgotPasswordRouteModule { }

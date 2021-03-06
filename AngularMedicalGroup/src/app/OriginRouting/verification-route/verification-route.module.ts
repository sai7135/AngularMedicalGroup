import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { VerificationComponent } from 'src/app/verification/verification.component';

const appRoutes:Routes=[
  {
    path:'',component:VerificationComponent
  }
]


@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class VerificationRouteModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { ClaimViewComponent } from 'src/app/ipa/claim-view/claim-view.component';
const appRoutes:Routes=[
  {
    path:'',component:ClaimViewComponent
  }
]



@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class ClaimViewRouteModule { }

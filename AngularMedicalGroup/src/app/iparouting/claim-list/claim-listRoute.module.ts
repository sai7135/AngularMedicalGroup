import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { ClaimListingComponent } from 'src/app/ipa/claim-listing/claim-listing.component';

const appRoutes:Routes=[
  {
    path:'',component:ClaimListingComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class ClaimListRouteModule { }

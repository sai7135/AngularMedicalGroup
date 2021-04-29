import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {ClaimListingComponent} from '../../ipa/claim-listing/claim-listing.component';
import { MaterialModule } from 'src/app/material/material.module';
import {ClaimListRouteModule} from 'src/app/iparouting/claim-list/claim-listRoute.module';



@NgModule({
  declarations: [ClaimListingComponent],
  imports: [
    CommonModule,
    MaterialModule,
    ClaimListRouteModule
  ]
})
export class ClaimListModule { }

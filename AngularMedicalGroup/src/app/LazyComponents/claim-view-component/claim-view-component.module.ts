import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ClaimViewComponent } from 'src/app/ipa/claim-view/claim-view.component';
import { ReactiveFormsModule } from '@angular/forms';
import { ClaimViewRouteModule } from 'src/app/OriginRouting/claim-view-route/claim-view-route.module';
import { MaterialModule } from 'src/app/material/material.module';
import { MembersModuleModule } from '../members-module/members-module.module';


@NgModule({
  declarations: [ClaimViewComponent],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    ClaimViewRouteModule,
    MaterialModule
  ]
})
export class ClaimViewComponentModule { }

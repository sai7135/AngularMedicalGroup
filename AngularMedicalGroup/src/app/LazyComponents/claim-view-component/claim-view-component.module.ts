import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ClaimViewComponent } from 'src/app/ipa/claim-view/claim-view.component';
import { ReactiveFormsModule } from '@angular/forms';
import { ClaimViewRouteModule } from 'src/app/OriginRouting/claim-view-route/claim-view-route.module';



@NgModule({
  declarations: [ClaimViewComponent],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    ClaimViewRouteModule
  ]
})
export class ClaimViewComponentModule { }

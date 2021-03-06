import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { VerificationComponent } from 'src/app/verification/verification.component';
import { MaterialModule } from 'src/app/material/material.module';
import { FormsModule } from '@angular/forms';
import { VerificationRouteModule } from 'src/app/OriginRouting/verification-route/verification-route.module';



@NgModule({
  declarations: [VerificationComponent],
  imports: [
    CommonModule,
    MaterialModule,
    FormsModule,
    VerificationRouteModule
  ]
})
export class VerificationModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ForgotPasswordComponent } from 'src/app/forgot-password/forgot-password.component';
import { MaterialModule } from 'src/app/material/material.module';
import { FormsModule } from '@angular/forms';
import { ForgotPasswordRouteModule } from 'src/app/OriginRouting/forgot-password-route/forgot-password-route.module';



@NgModule({
  declarations: [ForgotPasswordComponent],
  imports: [
    CommonModule,
    MaterialModule,
    FormsModule,
    ForgotPasswordRouteModule
  ]
})
export class ForgotPasswordModule { }

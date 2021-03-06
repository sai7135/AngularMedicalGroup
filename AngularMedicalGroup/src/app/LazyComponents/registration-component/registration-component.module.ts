import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RegistrationComponent } from 'src/app/ipa/registration/registration.component';
import { MaterialModule } from 'src/app/material/material.module';
import { ReactiveFormsModule } from '@angular/forms';
import { RegistraionRouteModule } from 'src/app/iparouting/registraion-route/registraion-route.module';



@NgModule({
  declarations: [RegistrationComponent],
  imports: [
    CommonModule,
    MaterialModule,
    ReactiveFormsModule,
    RegistraionRouteModule
  ]
})
export class RegistrationComponentModule { }

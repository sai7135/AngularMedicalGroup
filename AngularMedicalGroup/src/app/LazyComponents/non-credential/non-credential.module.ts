import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NonCredentialComponent } from 'src/app/ipa/non-credential/non-credential.component';
import { MaterialModule } from 'src/app/material/material.module';
import { ReactiveFormsModule } from '@angular/forms';
import { NonCredentialRouteModule } from 'src/app/OriginRouting/non-credential-route/non-credential-route.module';



@NgModule({
  declarations: [NonCredentialComponent],
  imports: [
    CommonModule,
    MaterialModule,
    ReactiveFormsModule,
    NonCredentialRouteModule
  ]
})
export class NonCredentialModule { }

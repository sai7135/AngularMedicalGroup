import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AddBenefitMasterComponent } from 'src/app/ipa/add-benefit-master/add-benefit-master.component';
import { MaterialModule } from 'src/app/material/material.module';
import { ReactiveFormsModule } from '@angular/forms';
import { AddBenefitMasterRouteModule } from 'src/app/iparouting/add-benefit-master-route/add-benefit-master-route.module';



@NgModule({
  declarations: [AddBenefitMasterComponent],
  imports: [
    CommonModule,
    MaterialModule,
    ReactiveFormsModule,
    AddBenefitMasterRouteModule
  ]
})
export class AddBenfitMasterModule { }

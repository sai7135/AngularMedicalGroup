import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BenefitMasterComponent } from 'src/app/ipa/benefit-master/benefit-master.component';
import { MaterialModule } from '../../material/material.module';
import { BenfitMasterRouteModule } from '../../iparouting/benfit-master-route/benfit-master-route.module';



@NgModule({
  declarations: [BenefitMasterComponent],
  imports: [
    CommonModule,
    MaterialModule,
    BenfitMasterRouteModule
  ]
})
export class BenefitMasterModule { }

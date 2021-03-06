import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AddorganizationComponent } from '../../ipa/addorganization/addorganization.component';
import { MaterialModule } from '../../material/material.module';
import { ReactiveFormsModule } from '@angular/forms';
import { AddOrgModroutingModuleModule } from '../../iparouting/add-org-modrouting-module/add-org-modrouting-module.module';


@NgModule({
  declarations: [AddorganizationComponent],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MaterialModule,
    AddOrgModroutingModuleModule
  ]
})
export class AddOrganizationModule { }

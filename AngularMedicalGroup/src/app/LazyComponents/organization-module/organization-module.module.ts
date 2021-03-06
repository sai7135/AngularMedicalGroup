import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OrganizationComponent } from '../../ipa/organization/organization.component';
import { MaterialModule } from '../../material/material.module';
import { OrganizationRoutingModule } from '../../iparouting/organization-routing/organization-routing.module';



@NgModule({
  declarations: [OrganizationComponent],
  imports: [
    MaterialModule,
    OrganizationRoutingModule,
    CommonModule
  ]
})
export class OrganizationModuleModule { }

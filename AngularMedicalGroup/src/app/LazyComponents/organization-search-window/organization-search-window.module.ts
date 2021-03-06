import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OrganizationsearchwindowComponent } from 'src/app/ipa/organizationsearchwindow/organizationsearchwindow.component';
import { ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from 'src/app/material/material.module';
import { OrganizationRoutingModule } from 'src/app/iparouting/organization-routing/organization-routing.module';



@NgModule({
  declarations: [OrganizationsearchwindowComponent],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MaterialModule,
    OrganizationRoutingModule
  ]
})
export class OrganizationSearchWindowModule { }

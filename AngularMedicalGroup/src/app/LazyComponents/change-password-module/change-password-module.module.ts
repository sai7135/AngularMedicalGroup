import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChangepasswordComponent } from '../../ipa/changepassword/changepassword.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from '../../material/material.module';
import { ChangePassRouteModule } from 'src/app/iparouting/change-pass-route/change-pass-route.module';



@NgModule({
  declarations: [ChangepasswordComponent],
  imports: [
    CommonModule,
    ChangePassRouteModule,
    FormsModule,
    ReactiveFormsModule,
    MaterialModule
  ]
})
export class ChangePasswordModuleModule { }

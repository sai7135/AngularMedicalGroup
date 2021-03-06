import { NgModule } from '@angular/core';
import { MembersComponent } from '../../ipa/members/members.component';
import {MemberRoutingModule} from '../../iparouting/member-routing/member-routing.module';
import { MemberHPdataComponent } from '../../dialog/member-hpdata/member-hpdata.component';
import { MemberPcpdataComponent } from '../../dialog/member-pcpdata/member-pcpdata.component';
import { DatePickerCustComponent } from '../../date-picker-cust/date-picker-cust.component';
import { MembersearchComponent } from '../../ipa/membersearch/membersearch.component';
import { MaterialModule } from '../../material/material.module';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    MembersComponent,
    MembersearchComponent,
    MemberHPdataComponent,
    MemberPcpdataComponent,
    DatePickerCustComponent
      ],
  imports: [
    MemberRoutingModule,
    MaterialModule,
    CommonModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class MembersModuleModule { }

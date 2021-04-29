import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchMemberComponent } from 'src/app/ipa/search-member/search-member.component';
import { MaterialModule } from 'src/app/material/material.module';
import { SearchMemberRModule } from 'src/app/iparouting/search-member-r/search-member-r.module';
import { ReactiveFormsModule } from '@angular/forms';



@NgModule({
  declarations: [SearchMemberComponent],
  imports: [
    CommonModule,
    SearchMemberRModule,
    MaterialModule,
    ReactiveFormsModule
  ]
})
export class SearchMemberLModule { }

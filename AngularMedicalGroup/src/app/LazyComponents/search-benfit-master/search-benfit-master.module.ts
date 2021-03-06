import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchbenefitmasterComponent } from 'src/app/ipa/searchbenefitmaster/searchbenefitmaster.component';
import { MaterialModule } from 'src/app/material/material.module';
import { FormsModule } from '@angular/forms';
import { SearchBenfitMasterRouteModule } from 'src/app/OriginRouting/search-benfit-master-route/search-benfit-master-route.module';



@NgModule({
  declarations: [SearchbenefitmasterComponent],
  imports: [
    CommonModule,
    MaterialModule,
    FormsModule,
    SearchBenfitMasterRouteModule
  ]
})
export class SearchBenfitMasterModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PractesionarDataComponent } from '../../ipa/practesionar-data/practesionar-data.component';
import { MaterialModule } from 'src/app/material/material.module';
import { PractionarDataRouteModule } from 'src/app/iparouting/practionar-data-route/practionar-data-route.module';



@NgModule({
  declarations: [PractesionarDataComponent],
  imports: [
    CommonModule,
    MaterialModule,
    PractionarDataRouteModule
  ]
})
export class PractionarDataModule { }

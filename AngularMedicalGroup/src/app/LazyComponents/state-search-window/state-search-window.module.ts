import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MaterialModule } from 'src/app/material/material.module';
import { FormsModule } from '@angular/forms';
import { StateSearchWindowComponent } from 'src/app/ipa/state-search-window/state-search-window.component';
import { StateSearchRouteModule } from 'src/app/OriginRouting/state-search-route/state-search-route.module';



@NgModule({
  declarations: [StateSearchWindowComponent],
  imports: [
    CommonModule,
    MaterialModule,
    FormsModule,
    StateSearchRouteModule
  ]
})
export class StateSearchWindowModule { }

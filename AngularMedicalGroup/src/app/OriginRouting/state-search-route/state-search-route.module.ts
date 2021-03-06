import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StateSearchWindowComponent } from 'src/app/ipa/state-search-window/state-search-window.component';
import { Routes, RouterModule } from '@angular/router';

const appRoutes:Routes=[
  {
    path:'',component:StateSearchWindowComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class StateSearchRouteModule { }

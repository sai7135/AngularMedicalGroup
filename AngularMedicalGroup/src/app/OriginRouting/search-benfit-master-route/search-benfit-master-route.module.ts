import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { SearchbenefitmasterComponent } from 'src/app/ipa/searchbenefitmaster/searchbenefitmaster.component';

const appRoutes:Routes=[
  {
    path:'',component:SearchbenefitmasterComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class SearchBenfitMasterRouteModule { }

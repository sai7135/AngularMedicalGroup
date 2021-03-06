import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PractesionarDataComponent } from 'src/app/ipa/practesionar-data/practesionar-data.component';
import { Routes, RouterModule } from '@angular/router';

const appRoutes:Routes=[
  {
    path:'',component:PractesionarDataComponent
  }
]



@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class PractionarDataRouteModule { }

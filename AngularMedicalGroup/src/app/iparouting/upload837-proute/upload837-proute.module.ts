import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { Upload837PComponent } from 'src/app/ipa/upload837-p/upload837-p.component';


const appRoutes:Routes=[
  {
    path:'',component:Upload837PComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class Upload837PRouteModule { }

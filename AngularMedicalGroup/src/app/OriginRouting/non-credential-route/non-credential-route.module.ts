import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { NonCredentialComponent } from 'src/app/ipa/non-credential/non-credential.component';


const appRoutes:Routes=[
  {
    path:'',component:NonCredentialComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class NonCredentialRouteModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchproviderComponent } from 'src/app/ipa/searchprovider/searchprovider.component';
import { Routes, RouterModule } from '@angular/router';


const appRoutes:Routes=[
  {
    path:'',component:SearchproviderComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class SearchProviderRouteModule { }

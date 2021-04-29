import { NgModule } from '@angular/core';
import {RouterModule,Routes} from '@angular/router'
import { SearchMemberComponent } from 'src/app/ipa/search-member/search-member.component';


const appRoutes:Routes=[{
  path:'',component:SearchMemberComponent
}]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class SearchMemberRModule { }

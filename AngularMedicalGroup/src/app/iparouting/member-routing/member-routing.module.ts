import { NgModule } from '@angular/core';
import { MembersComponent } from 'src/app/ipa/members/members.component';
import { RouterModule,Routes } from '@angular/router';

const appRoutes:Routes=[
  {
    path:'',component:MembersComponent
  }
]

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(appRoutes)
  ]
})
export class MemberRoutingModule { }

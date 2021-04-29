import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {LoginComponent} from './login/login.component';
import {IpaComponent} from './ipa/ipa.component';
import {LoginGaurdService} from './login/login-gaurd.service';
import {IpaactivateService} from './ipa/ipaactivate.service';
import {ForgotPasswordComponent} from './forgot-password/forgot-password.component';
import {StateSearchWindowComponent} from './ipa/state-search-window/state-search-window.component';
import {NonCredentialComponent} from './ipa/non-credential/non-credential.component';
import {OrganizationsearchwindowComponent} from './ipa/organizationsearchwindow/organizationsearchwindow.component'
import { ClaimViewComponent } from './ipa/claim-view/claim-view.component';
import { SearchbenefitmasterComponent } from './ipa/searchbenefitmaster/searchbenefitmaster.component';
import { SearchproviderComponent } from './ipa/searchprovider/searchprovider.component';

const routes: Routes = [
  {path:'',redirectTo:'login',pathMatch:"full"},
  {path:'verification',loadChildren:()=>import('./LazyComponents/verification/verification.module').then(m=>m.VerificationModule)},
  {path:'statesearch',loadChildren:()=>import('./LazyComponents/state-search-window/state-search-window.module').then(m=>m.StateSearchWindowModule)},
  {path:'login',loadChildren:()=>import('./LazyComponents/login/login.module').then(m=>m.LoginModule),canActivate:[LoginGaurdService]},
  {path:'ipa',component:IpaComponent,canActivate:[IpaactivateService],loadChildren:()=>import('./iparouting/iparouting.module').then(m=>m.IparoutingModule)
  },
  {path:'searchpcp',loadChildren:()=>import('./LazyComponents/search-pcp/search-pcp.module').then(m=>m.SearchPcpModule),canActivate:[IpaactivateService]},
  {path:'searchbenefitmaster',loadChildren:()=>import('./LazyComponents/search-benfit-master/search-benfit-master.module').then(m=>m.SearchBenfitMasterModule),canActivate:[IpaactivateService]},
  {path:'non-cred',loadChildren:()=>import('./LazyComponents/non-credential/non-credential.module').then(m=>m.NonCredentialModule),canActivate:[IpaactivateService]},
  {path:'claim-view',loadChildren:()=>import('./LazyComponents/claim-view-component/claim-view-component.module').then(m=>m.ClaimViewComponentModule),canActivate:[IpaactivateService]},
  {path:'forgotpassword',loadChildren:()=>import('./LazyComponents/forgot-password/forgot-password.module').then(m=>m.ForgotPasswordModule)},
  {path:'organizationsearch',loadChildren:()=>import('./LazyComponents/organization-search-window/organization-search-window.module').then(m=>m.OrganizationSearchWindowModule),canActivate:[IpaactivateService]},
  {path:'searchmember',loadChildren:()=>import('./LazyComponents/search-member-l/search-member-l.module').then(m=>m.SearchMemberLModule),canActivate:[IpaactivateService]},
  {path:'**',redirectTo:'ipa'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes,{useHash:true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }

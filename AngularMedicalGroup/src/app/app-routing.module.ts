import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {LoginComponent} from './login/login.component';
import {IpaComponent} from './ipa/ipa.component';
import {LoginGaurdService} from './login/login-gaurd.service';
import {IpaactivateService} from './ipa/ipaactivate.service';
import {ForgotPasswordComponent} from './forgot-password/forgot-password.component';
import { VerificationComponent } from './verification/verification.component';
import {StateSearchWindowComponent} from './ipa/state-search-window/state-search-window.component';
import {NonCredentialComponent} from './ipa/non-credential/non-credential.component';
import {OrganizationsearchwindowComponent} from './ipa/organizationsearchwindow/organizationsearchwindow.component'
import { ClaimViewComponent } from './ipa/claim-view/claim-view.component';
import { SearchbenefitmasterComponent } from './ipa/searchbenefitmaster/searchbenefitmaster.component';
import { SearchproviderComponent } from './ipa/searchprovider/searchprovider.component';

const routes: Routes = [
  {path:'',redirectTo:'login',pathMatch:"full"},
  {path:'verification',component:VerificationComponent},
  {path:'statesearch',component:StateSearchWindowComponent},
  {path:'login',component:LoginComponent,canActivate:[LoginGaurdService]},
  {path:'ipa',component:IpaComponent,canActivate:[IpaactivateService],loadChildren:()=>import('./iparouting/iparouting.module').then(m=>m.IparoutingModule)
  },
  {path:'searchpcp',component:SearchproviderComponent,canActivate:[IpaactivateService]},
  {path:'searchbenefitmaster',component:SearchbenefitmasterComponent,canActivate:[IpaactivateService]},
  {path:'non-cred',component:NonCredentialComponent,canActivate:[IpaactivateService]},
  {path:'claim-view',component:ClaimViewComponent,canActivate:[IpaactivateService]},
  {path:'forgotpassword',component:ForgotPasswordComponent},
  {path:'organizationsearch',component:OrganizationsearchwindowComponent,canActivate:[IpaactivateService]},
  {path:'**',redirectTo:'ipa'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes,{useHash:true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }

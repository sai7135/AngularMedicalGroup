import { NgModule } from '@angular/core';
import {RouterModule,Routes} from '@angular/router';
import {Upload837PComponent} from '../ipa/upload837-p/upload837-p.component';
import {AddBenefitMasterComponent} from '../ipa/add-benefit-master/add-benefit-master.component';
import { Upload837PModule } from '../LazyComponents/upload837-p/upload837-p.module';


const route:Routes=[
  {path:'organization',loadChildren:()=>import('../LazyComponents/organization-module/organization-module.module').then(m=>m.OrganizationModuleModule)},
  {path:'addorganization',loadChildren:()=>import('../LazyComponents/add-organization/add-organization.module').then(m=>m.AddOrganizationModule)},
  {path:'changepassword',loadChildren:()=>import('../LazyComponents/change-password-module/change-password-module.module').then(m=>m.ChangePasswordModuleModule)},
  {path:'members',loadChildren:()=>import('../LazyComponents/members-module/members-module.module').then(m=>m.MembersModuleModule)},
  {path:'register',loadChildren:()=>import('../LazyComponents/registration-component/registration-component.module').then(m=>m.RegistrationComponentModule)},
  {path:'practesionar-data',loadChildren:()=>import('../LazyComponents/practionar-data/practionar-data.module').then(m=>m.PractionarDataModule)},
  {path:'benefit-master',loadChildren:()=>import('../LazyComponents/benefit-master/benefit-master.module').then(m=>m.BenefitMasterModule)},
  {path:'addbenefit-master',loadChildren:()=>import('../LazyComponents/add-benfit-master/add-benfit-master.module').then(m=>m.AddBenfitMasterModule)},
  {path:'837PUpload',loadChildren:()=>import('../LazyComponents/upload837-p/upload837-p.module').then(m=>m.Upload837PModule)},
  {path:'Claim-list',loadChildren:()=>import('../LazyComponents/claim-list/claim-list.module').then(m=>m.ClaimListModule)}
];


@NgModule({
  declarations: [],
  imports: [RouterModule.forChild(route)]
})
export class IparoutingModule { }

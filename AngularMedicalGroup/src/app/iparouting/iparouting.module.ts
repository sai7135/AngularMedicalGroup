import { NgModule } from '@angular/core';
import {RouterModule,Routes} from '@angular/router';
import {IpaComponent} from '../ipa/ipa.component';
import {OrganizationComponent} from '../ipa/organization/organization.component';
import {AddorganizationComponent} from '../ipa/addorganization/addorganization.component';
import {ChangepasswordComponent} from '../ipa/changepassword/changepassword.component';
import {MembersComponent} from '../ipa/members/members.component';
import {RegistrationComponent} from '../ipa/registration/registration.component';
import {PractesionarDataComponent} from '../ipa/practesionar-data/practesionar-data.component';
import {BenefitMasterComponent} from '../ipa/benefit-master/benefit-master.component';
import {Upload837PComponent} from '../ipa/upload837-p/upload837-p.component';
import {AddBenefitMasterComponent} from '../ipa/add-benefit-master/add-benefit-master.component';
import {SearchbenefitmasterComponent} from '../ipa/searchbenefitmaster/searchbenefitmaster.component';

const route:Routes=[
  {path:'organization',component:OrganizationComponent},
  {path:'addorganization',component:AddorganizationComponent},
  {path:'changepassword',component:ChangepasswordComponent},
  {path:'members',component:MembersComponent},
  {path:'register',component:RegistrationComponent},
  {path:'practesionar-data',component:PractesionarDataComponent},
  {path:'benefit-master',component:BenefitMasterComponent},
  {path:'addbenefit-master',component:AddBenefitMasterComponent},
  {path:'837PUpload',component:Upload837PComponent}
];


@NgModule({
  declarations: [],
  imports: [RouterModule.forChild(route)]
})
export class IparoutingModule { }

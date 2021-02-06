import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { IpaComponent } from './ipa/ipa.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './material/material.module';
import {HttpClientModule, HTTP_INTERCEPTORS} from '@angular/common/http';
import {FormsModule,ReactiveFormsModule} from '@angular/forms';
import { AuthInterceptService } from './services/auth-intercept.service';
import { OrganizationComponent } from './ipa/organization/organization.component';
import { AddComponent } from './ipa/organization/add/add.component';
import { AddorganizationComponent } from './ipa/addorganization/addorganization.component';
import { ChangepasswordComponent } from './ipa/changepassword/changepassword.component';
import { MessageComponent } from './dialog/message/message.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { VerificationComponent } from './verification/verification.component';
import { StateSearchWindowComponent } from './ipa/state-search-window/state-search-window.component';
import { PhoneMaskDirective } from './ipa/directives/phone-mask.directive';
import { MembersComponent } from './ipa/members/members.component';
import { RegistrationComponent } from './ipa/registration/registration.component';
import {PractesionarDataComponent} from './ipa/practesionar-data/practesionar-data.component';
import { NonCredentialComponent } from './ipa/non-credential/non-credential.component';
import { NavbarvaluesService,navbartoken } from './ipa/navbar/navbarvalues.service';
import { PortalModule } from '@angular/cdk/portal';
import { PopUpComponent } from './pop-up/pop-up.component';
import { OrganizationsearchwindowComponent } from './ipa/organizationsearchwindow/organizationsearchwindow.component';
import { BenefitMasterComponent } from './ipa/benefit-master/benefit-master.component';
import { AddBenefitMasterComponent } from './ipa/add-benefit-master/add-benefit-master.component';
import { Upload837PComponent } from './ipa/upload837-p/upload837-p.component';
import { ClaimViewComponent } from './ipa/claim-view/claim-view.component';
import { DatePickerCustComponent } from './date-picker-cust/date-picker-cust.component';
import { SearchbenefitmasterComponent } from './ipa/searchbenefitmaster/searchbenefitmaster.component';
import { SearchproviderComponent } from './ipa/searchprovider/searchprovider.component';
import { MembersearchComponent } from './ipa/membersearch/membersearch.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    IpaComponent,
    OrganizationComponent,
    AddComponent,
    AddorganizationComponent,
    ChangepasswordComponent,
    MessageComponent,
    ForgotPasswordComponent,
    VerificationComponent,
    StateSearchWindowComponent,
    PhoneMaskDirective,
    MembersComponent,
    RegistrationComponent,
    PractesionarDataComponent,
    NonCredentialComponent,
    PopUpComponent,
    OrganizationsearchwindowComponent,
    BenefitMasterComponent,
    AddBenefitMasterComponent,
    Upload837PComponent,
    ClaimViewComponent,
    DatePickerCustComponent,
    SearchbenefitmasterComponent,
    SearchproviderComponent,
    MembersearchComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    PortalModule
  ],
  providers: [{provide:HTTP_INTERCEPTORS,multi:true,useClass:AuthInterceptService},{provide:navbartoken,useClass:NavbarvaluesService}],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { IpaComponent } from './ipa/ipa.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './material/material.module';
import {HttpClientModule, HTTP_INTERCEPTORS} from '@angular/common/http';
import { AuthInterceptService } from './services/auth-intercept.service';
import { NavbarvaluesService,navbartoken } from './ipa/navbar/navbarvalues.service';
import { PortalModule } from '@angular/cdk/portal';

@NgModule({
  declarations: [
    AppComponent,
    IpaComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    HttpClientModule,
    PortalModule
  ],
  providers: [{provide:HTTP_INTERCEPTORS,multi:true,useClass:AuthInterceptService},{provide:navbartoken,useClass:NavbarvaluesService}],
  bootstrap: [AppComponent]
})
export class AppModule { }

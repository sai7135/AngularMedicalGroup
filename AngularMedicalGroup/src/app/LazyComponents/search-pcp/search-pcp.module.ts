import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchproviderComponent } from 'src/app/ipa/searchprovider/searchprovider.component';
import { MaterialModule } from 'src/app/material/material.module';
import { SearchProviderRouteModule } from 'src/app/OriginRouting/search-provider-route/search-provider-route.module';
import { FormsModule } from '@angular/forms';



@NgModule({
  declarations: [SearchproviderComponent],
  imports: [
    CommonModule,
    MaterialModule,
    SearchProviderRouteModule,
    FormsModule
  ]
})
export class SearchPcpModule { }

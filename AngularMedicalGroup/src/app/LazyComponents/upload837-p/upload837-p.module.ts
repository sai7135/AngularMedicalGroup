import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Upload837PComponent } from 'src/app/ipa/upload837-p/upload837-p.component';
import { MaterialModule } from 'src/app/material/material.module';
import { Upload837PRouteModule } from 'src/app/iparouting/upload837-proute/upload837-proute.module';



@NgModule({
  declarations: [Upload837PComponent],
  imports: [
    CommonModule,
    MaterialModule,
    Upload837PRouteModule
  ]
})
export class Upload837PModule { }

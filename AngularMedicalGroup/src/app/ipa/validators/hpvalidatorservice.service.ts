import { Injectable } from '@angular/core';
import { AbstractControl, ValidationErrors } from '@angular/forms';
import { Observable } from 'rxjs';
import {ApicontactService} from '../../services/apicontact.service';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class HpvalidatorserviceService {

  constructor(private api:ApicontactService) { }
  validate(control:AbstractControl):Observable<ValidationErrors|null>
  {
    return this.api.getBenefitMasterDescription(control.parent.get("hp").value,control.parent.get("hpcode").value).pipe(map(r=>{
      if(r==""){
        control.parent.get('description').setValue(r);
        return null;
      }
      else{
        control.parent.get('description').setValue(r);
        return null;
      }
    })); 
  }
}

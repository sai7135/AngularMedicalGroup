import { Injectable } from '@angular/core';
import { Validator, AbstractControl, ValidationErrors } from '@angular/forms';
import { Observable } from 'rxjs';
import {ApicontactService} from '../../services/apicontact.service';
import { map } from 'rxjs/operators';
import { conditionallyCreateMapObjectLiteral } from '@angular/compiler/src/render3/view/util';


@Injectable({
  providedIn: 'root'
})
export class AddorgValidatorsService {

  constructor(private api:ApicontactService) { 
  }
  validate(control:AbstractControl):Observable<ValidationErrors|null>
  {
    return this.api.searchOrganization("organizationId="+control.value).pipe(map(r=>{
      if(r.length>0){
        return {"organizationexist":true}
      }
      else{
        return null;
      }
    })); 
  }
}

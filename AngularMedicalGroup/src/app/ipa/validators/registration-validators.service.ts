import { Injectable } from '@angular/core';
import {ApicontactService} from '../../services/apicontact.service';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { ValidationErrors, AbstractControl } from '@angular/forms';

@Injectable({
  providedIn: 'root'
})
export class RegistrationValidatorsService {

  constructor(private api:ApicontactService) { }
  validate(control:AbstractControl):Observable<ValidationErrors|null>
  {
    return this.api.checkuser(control.value).pipe(map(r=>{
      if(r){
        return {"usernameexist":true}
      }
      else{
        return null;
      }
    }
      ))
  }
}

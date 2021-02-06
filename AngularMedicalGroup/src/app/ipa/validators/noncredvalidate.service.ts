import { Injectable } from '@angular/core';
import { AbstractControl, ValidationErrors } from '@angular/forms';
import { Observable, of } from 'rxjs';
import {map} from 'rxjs/operators'
import {ApicontactService} from '../../services/apicontact.service'

@Injectable({
  providedIn: 'root'
})
export class NoncredvalidateService {

  constructor(private apicont:ApicontactService) { }

  validorganization(group:AbstractControl):Observable<null|ValidationErrors>{
    return this.apicont.searchOrganization('organizationId='+group.value).pipe(map(r=>{
      if(r!=null){
        group.parent.get('organizationName').patchValue(r[0].organizationName);
        return null;
      }
      else{
        return {"invalid organization":true};
      }
    }));
    // if(group.value=="1234"){
    //   group.parent.get('organizationName').patchValue("1234testorganization");
    //   return null;
    // }
    // else{
    //   return of({'invalidorganization':true});
    // }
  }
}

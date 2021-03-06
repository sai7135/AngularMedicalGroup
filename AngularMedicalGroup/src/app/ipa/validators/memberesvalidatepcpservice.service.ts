import { Injectable } from '@angular/core';
import { AbstractControl, ValidationErrors } from '@angular/forms';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { ApicontactService } from 'src/app/services/apicontact.service';

@Injectable({
  providedIn: 'root'
})
export class MemberesvalidatepcpserviceService {

  constructor(private api:ApicontactService) { }
  validate(control:AbstractControl):Observable<ValidationErrors|null>
  {
    return this.api.getPcpOrganization(control.value).pipe(map(r=>{
      if(r==null){
        control.parent.get('organizationName').setValue(r);
        return {'invalidhp':true};
      }
      else{
        control.parent.get('providerlastname').setValue(r.providerLastName);
        control.parent.get('providerfirstname').setValue(r.providerFirstName);
        control.parent.get('organizationName').setValue(r.organizationName);
      }
    })); 
  }
}

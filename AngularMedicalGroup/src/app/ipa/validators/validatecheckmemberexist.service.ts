import { Injectable } from '@angular/core';
import { AbstractControl, ValidationErrors } from '@angular/forms';
import { Observable, of } from 'rxjs';
import { ApicontactService } from 'src/app/services/apicontact.service';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ValidatecheckmemberexistService {

  constructor(private api:ApicontactService) { }
  validate(control:AbstractControl):Observable<ValidationErrors|null>
  {
    if(control.get('mode').value=="select"){
      return this.api.selectMember(control.get("memberId").value,control.get("hp").value).pipe(map(r=>{
        control.reset(r);
        control.patchValue({'mode':'saved'});
        control.get('BirthDate').setValue(new Date(r.BirthDate));
        control.get('hpfromdate').setValue(new Date(r.hpfromdate));
        control.get('hptoDate').setValue(new Date(r.hptoDate));
        control.get('pcpfromdate').setValue(new Date(r.pcpfromdate));
        control.get('pcptodate').setValue(new Date(r.pcptodate));
        return null;
      }));
    }
    return of(null);
  }
}

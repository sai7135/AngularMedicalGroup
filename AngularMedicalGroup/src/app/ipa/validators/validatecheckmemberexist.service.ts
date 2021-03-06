import { Injectable } from '@angular/core';
import { AbstractControl, ValidationErrors } from '@angular/forms';
import { Observable, of } from 'rxjs';
import { ApicontactService } from 'src/app/services/apicontact.service';
import { map } from 'rxjs/operators';
import { Members } from 'src/app/models/member.model';

@Injectable({
  providedIn: 'root'
})
export class ValidatecheckmemberexistService {

  constructor(private api:ApicontactService) { }
  public validate(control:AbstractControl):Observable<ValidationErrors|null>
  {
    if(control.get('mode').value=="select"){
      return this.api.selectMember(control.get("memberId").value,control.get("hp").value).pipe(map(r=>{
        if(r.length!=0){
        let latestHpMember:Members=r.find(v=>v.hptoDate=="");

        let latestPCPMember:Members=r.find(v=>v.pcptodate=="");
        if(latestHpMember==undefined){
          latestHpMember=r.find(v=>v.hptoDate!="")
        }
        if(latestPCPMember==undefined){
          latestPCPMember=r.find(v=>v.pcptodate!="")
        }
        control.reset(latestHpMember);
        control.patchValue({'mode':'saved'});
        control.get('BirthDate').setValue(new Date(latestHpMember.BirthDate));
        control.get('hpfromdate').setValue(new Date(latestHpMember.hpfromdate));
        control.get('hptoDate').setValue(new Date(latestHpMember.hptoDate));
        control.get('pcpid').setValue(latestPCPMember.pcpid);
        control.get('pcpfromdate').setValue(new Date(latestPCPMember.pcpfromdate));
        control.get('pcptodate').setValue(new Date(latestPCPMember.pcptodate));
        control.get('pcpMaintRes').setValue(latestPCPMember.pcpMaintRes);
        control.get('organizationName').setValue(latestPCPMember.organizationName);
        return of("memberexist");
      }}));
      
    }
    return of(null);
  }
}

import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import { TokenManagerService } from '../services/token-manager.service';
import { map } from 'rxjs/operators';
import {Router} from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class IpaactivateService implements CanActivate {

  constructor(private tm:TokenManagerService,private router:Router) { }
  canActivate():Observable<boolean>{
    return this.tm.isAuthoroized().pipe(map(r=>{
      if(r){
        return r;
      }
      else{
        this.router.navigate(["/login"]);
      }
    }));
  }
}

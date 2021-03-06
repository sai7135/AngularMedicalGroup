import { Injectable } from '@angular/core';
import {CanActivate} from '@angular/router';
import {Router} from '@angular/router';
import { Observable } from 'rxjs';
import { TokenManagerService } from '../services/token-manager.service';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class LoginGaurdService implements CanActivate {
  
  constructor(private router:Router,private tm:TokenManagerService) { }
  canActivate():Observable<boolean>{
       return this.tm.isAuthoroized().pipe(map(r=>{
          if(r){
            this.router.navigate(["/ipa"]);
          }
          else{
            return true;
          }
        }));
        // if(localStorage.getItem("angularToken")===null){
        //   return true;
        // }
        // else{
        //   this.router.navigate(["/ipa"]);
        // }
  }

}

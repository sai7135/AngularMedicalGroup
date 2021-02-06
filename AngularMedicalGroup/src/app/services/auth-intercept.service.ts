import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpHandler,HttpRequest, HttpEvent, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthInterceptService implements HttpInterceptor{

  constructor(private router:Router) { }
  intercept(req :HttpRequest<any>,next:HttpHandler):Observable<HttpEvent<any>>{

    if(!!localStorage.getItem('angularToken')){
    var nreq=req.clone(
      {
        headers:req.headers.append('authorization','bearer '+localStorage.getItem('angularToken'))
      }
    );
    return next.handle(nreq).pipe(tap(() => {},
    (err: any) => {
    if (err instanceof HttpErrorResponse) {
      if (err.status !== 401) {
       return;
      }
      localStorage.removeItem('angularToken');
      this.router.navigate(['login']);
    }
  }));
    }
    else{
      return next.handle(req);
    }
  }

}

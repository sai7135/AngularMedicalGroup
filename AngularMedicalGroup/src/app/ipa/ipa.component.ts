import { Component, OnInit, ViewEncapsulation, Inject, Optional } from '@angular/core';
import { TokenManagerService } from '../services/token-manager.service';
import {Router,ActivatedRoute} from '@angular/router';
import {NavbarvaluesService,navbartoken} from './navbar/navbarvalues.service';

@Component({
  selector: 'app-ipa',
  templateUrl: './ipa.component.html',
  styleUrls: ['./ipa.component.css'],
})

export class IpaComponent implements OnInit {
  today;
  open=true;
  isAdmin:boolean;
  displayedColumns: string[] =["name"];
  constructor(private tm:TokenManagerService,private router:Router,@Inject(navbartoken) public values:NavbarvaluesService,private route:ActivatedRoute) { }

  ngOnInit(): void {
    this.today=new Date();
    this.isAdmin=localStorage.getItem("role")==="admin";
  }
  logout(){
    this.tm.removeToken();
  }
  changepassword(){
    this.router.navigate(["changepassword"],{relativeTo:this.route});
  }
  navlink(link:string){
    this.router.navigate([link],{relativeTo:this.route});
  }
  drawer(){
    this.open=this.open?false:true;
  }
}

import { Component } from '@angular/core';
import {Router,NavigationStart,NavigationEnd,Event} from '@angular/router';
import {CommunicateService} from './services/communicate.service'

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  spin:boolean=true;
  constructor(private router: Router,private comm:CommunicateService) {
    this.router.events.subscribe((event: Event) =>
    {
        if (event instanceof NavigationStart) {
            this.spin = true;
        }
        if (event instanceof NavigationEnd) {
            this.spin = false;
        }
    });
    this.comm.communicate.subscribe(shouldspin=>{
      this.spin=shouldspin;
    })
}
}

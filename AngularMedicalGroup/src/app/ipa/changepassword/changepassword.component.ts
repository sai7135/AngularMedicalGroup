import { Component, OnInit } from '@angular/core';
import { NgModel, NgForm } from '@angular/forms';
import {TokenManagerService} from '../../services/token-manager.service';
import {CommunicateService} from '../../services/communicate.service';

@Component({
  selector: 'app-changepassword',
  templateUrl: './changepassword.component.html',
  styleUrls: ['./changepassword.component.css']
})
export class ChangepasswordComponent implements OnInit {

  constructor(private tm:TokenManagerService,private comm:CommunicateService) { }

  ngOnInit(): void {
  }
  changepassword(form:NgForm):void{
      this.comm.communicate.emit(true);
      this.tm.changepassword(form.value);
      this.comm.communicate.emit(false);    
  }
}

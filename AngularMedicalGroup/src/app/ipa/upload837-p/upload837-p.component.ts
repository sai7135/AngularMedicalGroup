import { Component, OnInit, ViewChild } from '@angular/core';
import {ApicontactService} from '../../services/apicontact.service';
import {MatDialog} from '@angular/material/dialog';
import { MessageComponent } from 'src/app/dialog/message/message.component';
import { CommunicateService } from '../../services/communicate.service';

@Component({
  selector: 'app-upload837-p',
  templateUrl: './upload837-p.component.html',
  styleUrls: ['./upload837-p.component.css']
})
export class Upload837PComponent implements OnInit {
  constructor(private api:ApicontactService,private dialog:MatDialog,private comm:CommunicateService)
   {

    }
  ediFile:File;
  @ViewChild("fileUpload") fileUpload;
  @ViewChild("filename") fileName;
  ngOnInit(): void {
    
  }
  
  browseedi(){
    this.fileUpload.nativeElement.click();
  }
  changediselection(files:File[]){
    this.fileName.nativeElement.value=files[0].name;
    this.ediFile=files[0];
  }
  uploadEdi(){
    const ediForm:FormData=new FormData();
    ediForm.append("ediFile",this.ediFile);
    this.comm.communicate.emit(true);
    this.api.uploadEdi(ediForm).subscribe(r=>{
      this.comm.communicate.emit(false);
      this.dialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'File Added',content:'File Added succesfully'}
      })
    },r=>{
      this.comm.communicate.emit(false);
    });
  }
}

import { Component, OnInit, ViewChild, HostBinding, ChangeDetectorRef } from '@angular/core';
import {ApicontactService} from '../../services/apicontact.service';
import {MatDialog} from '@angular/material/dialog';
import { MessageComponent } from 'src/app/dialog/message/message.component';
import { CommunicateService } from '../../services/communicate.service';
import { FormGroup, FormControl } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import {FileData} from 'src/app/models/filedata.model'

@Component({
  selector: 'app-upload837-p',
  templateUrl: './upload837-p.component.html',
  styleUrls: ['./upload837-p.component.css']
})
export class Upload837PComponent implements OnInit {
  @HostBinding('tabindex') tabindex=0;
  search837Group:FormGroup;
  displayedColumns:string[];
  showinvalidcolumns:boolean;
  fileData:MatTableDataSource<FileData>;
  constructor(private cdref:ChangeDetectorRef,private api:ApicontactService,private dialog:MatDialog,private comm:CommunicateService)
  {

  }
  ngAfterContentChecked() {
    this.cdref.detectChanges();
    
     }
  ediFile:File;
  @ViewChild("fileUpload") fileUpload;
  @ViewChild("filename") fileName;
  ngOnInit(): void {
    this.showinvalidcolumns=false;
    this.fileData=new MatTableDataSource<FileData>();
    this.fileData.data=[new FileData()]
    this.search837Group=new FormGroup({
      'FileId':new FormControl(''),
      'FileError':new FormControl(''),
      'TP':new FormControl(''),
      'UploadDate':new FormControl('10'),
      'Format':new FormControl(''),
      'UploadedBy':new FormControl(''),
      'UploadFrom':new FormControl(new Date(new Date().getTime()-10*24*60*60*1000)),
      'UploadTo':new FormControl(new Date()),
      'UsageIndicator':new FormControl(''),
      'FileName':new FormControl('')
    })
    this.api.getFileData(this.search837Group.value).subscribe(r=>{
      this.displayedColumns=["Fileid","TP","UploadDate","UploadedBy","ClaimCount","Pending","Postinginproc","Posted","Failed","BilledAmount","Format"];
      this.fileData.data=r;
    })
    this.search837Group.get("UploadFrom").disable();
    this.search837Group.get("UploadTo").disable();
  }
  dateTypeChanges(){
    switch(this.search837Group.get("UploadDate").value){
      case "10":
        this.search837Group.get("UploadFrom").enable();
        this.search837Group.get("UploadTo").enable();
        this.search837Group.get("UploadFrom").setValue(new Date(new Date().getTime()-10*24*60*60*1000));
        this.search837Group.get("UploadTo").setValue(new Date());
        this.search837Group.get("UploadFrom").disable();
        this.search837Group.get("UploadTo").disable();
        break;
      case "6":
        this.search837Group.get("UploadFrom").enable();
        this.search837Group.get("UploadTo").enable();
        this.search837Group.get("UploadFrom").setValue(new Date(new Date().getTime()-6*25*24*60*60*1000));
        this.search837Group.get("UploadTo").setValue(new Date());
        this.search837Group.get("UploadFrom").disable();
        this.search837Group.get("UploadTo").disable();
        break;
      case "2":
        this.search837Group.get("UploadFrom").enable();
        this.search837Group.get("UploadTo").enable();
        this.search837Group.get("UploadFrom").setValue(new Date(new Date().getTime()-2*12*25*24*60*60*1000));
        this.search837Group.get("UploadTo").setValue(new Date());
        this.search837Group.get("UploadFrom").disable();
        this.search837Group.get("UploadTo").disable();
        break;
      case "c":
        this.search837Group.get("UploadFrom").enable();
        this.search837Group.get("UploadTo").enable();
        break;
    }
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

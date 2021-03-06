import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import {HpvalidatorserviceService} from '../validators/hpvalidatorservice.service';
import {MemberesvalidatepcpserviceService} from '../validators/memberesvalidatepcpservice.service';
import { ApicontactService } from 'src/app/services/apicontact.service';
import { CommunicateService } from 'src/app/services/communicate.service';
import { MessageComponent } from 'src/app/dialog/message/message.component';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import {MembersearchComponent} from '../membersearch/membersearch.component';
import {ValidatecheckmemberexistService} from '../validators/validatecheckmemberexist.service';
import { Members } from 'src/app/models/member.model';
import {MemberHPdataComponent} from '../../dialog/member-hpdata/member-hpdata.component';
import {MemberPcpdataComponent} from '../../dialog/member-pcpdata/member-pcpdata.component';
import {HPTableData} from '../../dialog/member-hpdata/member-hpdata.component';
import {ChangeDetectorRef} from '@angular/core';
import {weblink} from '../../raw/defaultdata';

@Component({
  selector: 'app-members',
  templateUrl: './members.component.html',
  styleUrls: ['./members.component.css']
})
export class MembersComponent implements OnInit {
  formDisabled:boolean;
  editmode:boolean;
  selectedMember:Number;
  hpvalue:string;
  invalid:string[];
  membersGroup:FormGroup;
  membersaved:boolean;
  membersinlist:Members[];
  memform:FormGroup;
  show:boolean;
  addmode:boolean;
  memberidautogenerate:boolean;
  memberviewmode:boolean;
  tabledata:HPTableData[]=[];
  constructor(private cdref:ChangeDetectorRef,private validatecheckmem:ValidatecheckmemberexistService,private dialog:MatDialog,private comm:CommunicateService,private api:ApicontactService,private hpvalidator:HpvalidatorserviceService,private validatepcp:MemberesvalidatepcpserviceService) { }
  search=function(){
    const dialogref=this.dialog.open(MembersearchComponent);
    dialogref.afterClosed().subscribe(r=>{
      this.memberviewmode=true;
      this.formDisabled=true;
      this.membersinlist=r;
      this.selectedMember=0;
      this.membersGroup.get("mode").setValue("select");
      this.membersGroup.get("memberId").setValue(this.membersinlist[0].memberId);
      this.membersGroup.get("hp").setValue(this.membersinlist[0].hp);
     
    })
  }
  ngAfterContentChecked() {
    this.cdref.detectChanges();
    
     }
  prevMember=function(){
    
    if(this.selectedMember>0 && !this.editmode){
      this.selectedMember--;
      this.memberindexchange(this.selectedMember);
    }
  }
  nextMember=function(){
    if(this.selectedMember<(this.membersinlist.length-1)&& !this.editmode){
      this.selectedMember++;
      this.memberindexchange(this.selectedMember)
    }
  }
  memberindexchange=function(r){
      this.memberviewmode=true;
      this.formDisabled=true;
      this.membersGroup.enable=true;
      this.membersGroup.get("mode").setValue("select");
      this.membersGroup.get("memberId").setValue(this.membersinlist[r].memberId);
      this.membersGroup.get("hp").setValue(this.membersinlist[r].hp);
      this.validatecheckmem.validate(this.membersGroup).subscribe(r=>console.log(r));
  }
  editHP=function(){
    this.api.getMemberHps(this.memform.get("memberId").value,this.memform.get("hp").value).subscribe(r=>{
        
      const dialogref=this.dialog.open(MemberHPdataComponent,{
          width:'70vw',
          data:{value:r},
          autoFocus:false,
          disableClose:true
        });
        dialogref.afterClosed().subscribe(r=>{
          if(r!=undefined){
           
            this.api.saveMemberHPs(r,this.memform.get("memberId").value,this.memform.get("hp").value).subscribe(r=>{
              this.memberviewmode=true;
      this.formDisabled=true;
      this.membersGroup.enable=true;
              this.membersGroup.get("hp").enable();
            this.membersGroup.get("hpcode").enable();
            this.membersGroup.get("pcpid").enable();
            this.membersGroup.get("mode").setValue("select");
              this.validatecheckmem.validate(this.membersGroup).subscribe(r=>console.log(r));
              this.validatepcp.validate(this.membersGroup.get("pcpid")).subscribe(r=>console.log(r));
              this.membersGroup.get("hp").disable();
              this.membersGroup.get("hpcode").disable();
              this.membersGroup.get("pcpid").disable();
            });;
          }
        })
      })
      
  }
  editPCP=function(){
    this.api.getMemberPCPs(this.memform.get("memberId").value,this.memform.get("hp").value).subscribe(r=>{
        
      const dialogref=this.dialog.open(MemberPcpdataComponent,{
          width:'70vw',
          data:{value:r},
          autoFocus:false,
          disableClose:true
        });
        dialogref.afterClosed().subscribe(r=>{
          if(r!=undefined){
            
            this.api.saveMemberPCPs(r,this.memform.get("memberId").value,this.memform.get("hp").value).subscribe(r=>{ 
             
              this.membersGroup.get("hp").enable();
            this.membersGroup.get("hpcode").enable();
            this.membersGroup.get("pcpid").enable();
            this.membersGroup.get("mode").setValue("select");
              this.validatecheckmem.validate(this.membersGroup).subscribe(r=>console.log(r));
              this.validatepcp.validate(this.membersGroup.get("pcpid")).subscribe(r=>console.log(r));
              this.membersGroup.get("hp").disable();
              this.membersGroup.get("hpcode").disable();
              this.membersGroup.get("pcpid").disable();});;
            
          }
        })
      })
  }
  close=function(){
    this.show=false;
    if(this.editmode){
    this.editmode=false;
   this.memberviewmode=true;
   this.membersGroup.get("memberId").setValue(this.membersinlist[0].memberId);
   this.membersGroup.get("hp").setValue(this.membersinlist[0].hp);
   this.membersGroup.get("mode").setValue("saved");
    }
    else if(this.addmode){
      this.membersGroup.reset({pcpMaintRes:"1",hpMaintRes:"1"});
      this.addmode=false;
      this.formDisabled=true;
      this.editmode=false;
      this.membersaved=false;
      this.memberidautogenerate=false;
    }
  }
  ngOnInit(): void {
    this.formDisabled=true;
    this.editmode=false;
    this.membersaved=false;
    this.memberidautogenerate=false;
    
    this.memform=new FormGroup({
      'memberId':new FormControl(null,Validators.required),
      'firstName':new FormControl(null),
      'lastName':new FormControl(null,Validators.required),
      'middleName':new FormControl(),
      'gender':new FormControl(null,Validators.required),
      'suffixName':new FormControl(),
      'BirthDate':new FormControl(null,Validators.required),
      'address1':new FormControl(null,Validators.required),
      'address2':new FormControl(),
      'city':new FormControl(null,Validators.required),
      'state':new FormControl(null,Validators.required),
      'zip':new FormControl(null,Validators.required),
      'autogenmemid':new FormControl(),
      'country':new FormControl(),
      'providerlastname':new FormControl(null,Validators.required),
      'providerfirstname':new FormControl(null,Validators.required),
      'hp':new FormControl(null,Validators.required,this.hpvalidator.validate.bind(this.hpvalidator)),
      'hpcode':new FormControl('',Validators.required,this.hpvalidator.validate.bind(this.hpvalidator)),
      'hpfromdate':new FormControl(null,Validators.required),
      'hptoDate':new FormControl(),
      'empGrp':new FormControl(),
      'hpMaintRes':new FormControl(1),
      'pcpid':new FormControl('',Validators.required,this.validatepcp.validate.bind(this.validatepcp)),
      'organizationName':new FormControl(''),
      'pcpfromdate':new FormControl(null,Validators.required),
      'pcptodate':new FormControl(),
      'pcpMaintRes':new FormControl(1),
      'age':new FormControl(),
      'description':new FormControl("",Validators.required),
      'mode':new FormControl()
    },null,this.validatecheckmem.validate.bind(this.validatecheckmem));
    this.membersGroup=this.memform;
    this.membersGroup.get("BirthDate").valueChanges.subscribe((r)=>{
      const today=new Date();
      const birthDate=new Date(r);
      var age=today.getFullYear()-birthDate.getFullYear();
      const m=today.getMonth()-birthDate.getMonth();
      if(m<0 || (m===0 && today.getDate()<birthDate.getDate())){
        age--;
      }
      this.membersGroup.get("age").setValue(age);
    });
    
  }
  checkexist=function(){
    this.membersGroup.get("mode").setValue("select");
    this.validatecheckmem.validate(this.membersGroup).subscribe(r=>{
      if(r!=null){
        this.show=false;
    this.editmode=true;
    this.membersGroup.get("memberId").disable();
    this.membersGroup.get("hp").disable();
    this.membersGroup.get("hpcode").disable();
    this.membersGroup.get("hpfromdate").disable();
    this.membersGroup.get("hptoDate").disable();
    this.membersGroup.get("pcpid").disable();
    this.membersGroup.get("pcpfromdate").disable();
    this.membersGroup.get("pcptodate").disable();
      this.membersGroup.get("pcpMaintRes").disable();
      this.membersGroup.get("hpMaintRes").disable();
      this.membersGroup.get("organizationName").disable();
    
      }
    }
    );
  }
  edit=function(){
    this.show=false;
    this.editmode=true;
    this.membersGroup.get("memberId").disable();
    this.membersGroup.get("hp").disable();
    this.membersGroup.get("hpcode").disable();
    this.membersGroup.get("hpfromdate").disable();
    this.membersGroup.get("hptoDate").disable();
    this.membersGroup.get("pcpid").disable();
    this.membersGroup.get("pcpfromdate").disable();
    this.membersGroup.get("pcptodate").disable();
      this.membersGroup.get("pcpMaintRes").disable();
      this.membersGroup.get("hpMaintRes").disable();
      this.membersGroup.get("organizationName").disable();
    
    
  }
  memberidautogen(checked:boolean){
    if(checked){
      this.membersGroup.get("memberId").disable();
    }
    else{
      this.membersGroup.get("memberId").enable();
    }
  }
  savemember=function(){
    if(this.membersGroup.invalid){
      console.log(this.membersGroup);
      this.show=true;
      return;
    }
    if(this.editmode){
      this.membersGroup.get("memberId").enable();
    this.membersGroup.get("hp").enable();
    this.membersGroup.get("hpcode").enable();
    this.membersGroup.get("hpfromdate").enable();
    this.membersGroup.get("hptoDate").enable();
    this.membersGroup.get("pcpid").enable();
    this.membersGroup.get("pcpfromdate").enable();
    this.membersGroup.get("pcptodate").enable();
      this.comm.communicate.emit(true);
      this.api.modifyMember(this.membersGroup.value).subscribe(r=>{
        this.editmode=false;
        this.membersaved=true;
        this.formDisabled=true;
        this.comm.communicate.emit(false);
        this.dialog.open(MessageComponent,{
          width:'50vw',
          data:{title:'Member Changed',content:'Member details changed succesfully'}
        });
        console.log(r);
      });   
    }
    else{
    this.comm.communicate.emit(true);
    this.api.createMember(this.membersGroup.value).subscribe(r=>{
      this.editmode=false;
      this.membersaved=true;
      this.formDisabled=true;
      this.comm.communicate.emit(false);
      this.dialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'Member Added',content:'Member Added succesfully'}
      });
      console.log(r);
    });   
  } 
  }
  pophpsearch=function(){
    window.open(weblink+"searchbenefitmaster","_blank","width:100,height:100");
    const bc=new BroadcastChannel("sendhp");
    bc.addEventListener('message',r=>{
      
      const data=r.data;
      this.membersGroup.get("hp").setValue(data.hp);
      this.membersGroup.get("hpcode").setValue(data.benefitCode);
    })
  }
  searchpcp=function(){
    window.open(weblink+"searchpcp","_blank","width:200,height:100");
    const bc=new BroadcastChannel("sendpcpid");
    bc.addEventListener('message',r=>{
      this.membersGroup.get("pcpid").setValue(r.data.pcpid);
    })
  }
  
  add=function(){
    this.membersGroup.reset({pcpMaintRes:"1",hpMaintRes:"1",BirthDate:null});
    this.memberviewmode=false;
    this.formDisabled=false; 
    this.addmode=true;
    this.membersinlist=null;
    this.membersGroup.get("memberId").enable();
    this.membersGroup.get("hp").enable();
    this.membersGroup.get("hpcode").enable();
    this.membersGroup.get("hpfromdate").enable();
    this.membersGroup.get("hptoDate").enable();
    this.membersGroup.get("pcpid").enable();
    this.membersGroup.get("pcpfromdate").enable();
    this.membersGroup.get("pcptodate").enable();
    this.membersGroup.get("pcpMaintRes").enable();
    this.membersGroup.get("hpMaintRes").enable();
    this.membersGroup.get("organizationName").enable();
  }
  dtchange=function(event){
    console.log(event);
  }
}

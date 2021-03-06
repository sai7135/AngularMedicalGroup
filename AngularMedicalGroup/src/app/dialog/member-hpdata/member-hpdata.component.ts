import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef,MatDialog,MAT_DIALOG_DATA } from '@angular/material/dialog';
import {MatTableDataSource} from '@angular/material/table';
import {CommonTasksService} from '../../services/common-tasks.service';
import {ApicontactService} from '../../services/apicontact.service';
import { MessageComponent } from 'src/app/dialog/message/message.component';
import {weblink} from '../../raw/defaultdata';

export class HPTableData{
  Add:string="add";
  public c:string;
  public HPCode:string;
  public BenefitCode:string;
  public MaintannceReason:string;
  public BenefitFrom?:Date=undefined;
  public BenefitTo?:Date=undefined;
  public EmpGrp:string;
}
@Component({
  selector: 'app-member-hpdata',
  templateUrl: './member-hpdata.component.html',
  styleUrls: ['./member-hpdata.component.css']
})
export class MemberHPdataComponent implements OnInit { 
  HpData:MatTableDataSource<HPTableData>;
  tabledata:any[];
  displayedColumns:string[];
  hpCode:string;
  constructor(private api:ApicontactService,private dialog:MatDialog,private commTask:CommonTasksService,public dialogRef:MatDialogRef<MemberHPdataComponent>,@Inject(MAT_DIALOG_DATA) public data:{value:HPTableData[]}) {
    
   }

  ngOnInit(): void {
    this.data.value.sort((a:HPTableData,b:HPTableData)=>{ return a.BenefitTo==null?-1:((a.BenefitTo > b.BenefitTo )?-1:((a.BenefitTo < b.BenefitTo)?1:0))});
    this.data.value[0].c="C";
    this.HpData=new MatTableDataSource<HPTableData>(this.data.value);
    this.displayedColumns=['Add','c','HPCode','BenefitCode','MaintannceReason','BenefitFrom','BenefitTo','EmpGrp'];
    
  }
  
  searchBenefit(value:string,i:any){
    if(value=='F2'){
      window.open(weblink+"searchbenefitmaster","_blank","width:100,height:100");
    const bc=new BroadcastChannel("sendhp");
    bc.addEventListener('message',r=>{
      this.data.value[i].BenefitCode=r.data.benefitCode;
      this.HpData=new MatTableDataSource<HPTableData>(this.data.value);
    })
    }
  }
  add():void{
    this.data.value.push( {Add:"",c: "H", HPCode: this.data.value[0].HPCode, BenefitCode: "", MaintannceReason: "1", BenefitFrom:null,BenefitTo:null,EmpGrp:""});
    this.HpData=new MatTableDataSource<HPTableData>(this.data.value);
  }
  checkbnfexist(target):void{
    this.api.getBenefitMasterDescription(this.data.value[0].HPCode,target.value).subscribe(r=>{
      if(r==""){
        target.value=null;
      }
    })
  }
  save():void{
    console.log(this.data.value);
    for(let i=0;i<this.data.value.length;i++){
      for(let j=0;j<this.data.value.length;j++){
        if(this.data.value[i]!=this.data.value[j]){
       if(this.commTask.datesCollide(new Date(this.data.value[i].BenefitFrom),new Date(this.data.value[i].BenefitTo),new Date(this.data.value[j].BenefitFrom),new Date(this.data.value[j].BenefitTo))){
          this.dialog.open(MessageComponent,{
          width:'50vw',
          data:{title:'Dates Collide',content:'Cant save dates are colliding please check'}
          });  
          return;
       }
      } 
    } 
    }
    var countc=0;
    var benftodtcount=0;
    
    for(let value of this.data.value){
      if(value.c=="C"){
        countc++;
      }
      if(value.BenefitTo==null){
        benftodtcount++;
      }
      if(value.BenefitFrom==null){
        this.dialog.open(MessageComponent,{
          width:'50vw',
          data:{title:'Dates Collide',content:'Benefit from date is needed'}
          });  
          return;
      }
    }
    if(benftodtcount>1){
      this.dialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'Dates Collide',content:'Cant save dates are colliding please check'}
        });
        return;
    }
    if(countc<=0){
      this.dialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'Current Records',content:'select one current record'}
        });  
      return;
    }
    if(countc>1){
      this.dialog.open(MessageComponent,{
        width:'50vw',
        data:{title:'Current Records',content:'There will be only one current record'}
        });  
      return;
    }
    var currentrec=this.data.value.sort((a:HPTableData,b:HPTableData)=>{ return a.BenefitTo==null?-1:((a.BenefitTo > b.BenefitTo )?-1:((a.BenefitTo < b.BenefitTo)?1:0))})[0];
      if(currentrec.c!="C"){
          this.dialog.open(MessageComponent,{
            width:'50vw',
            data:{title:'Current Records',content:'Please select latest record as current record'}
            });  
          return;
    }
    this.dialogRef.close(this.data.value);
  }
  remove(i:number):void{
    if(this.data.value.length>1){
      this.data.value.splice(i,1);
      this.HpData=new MatTableDataSource<HPTableData>(this.data.value);
    }
  }
  cancel():void{
    this.dialogRef.close();
  }
  
  formatDate(target):void{
      const value:Date=new Date(target.value);
      if(value.toString()=="Invalid Date"){
        target.value=null;
      }
  }
}

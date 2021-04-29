import { Component, OnInit, Inject} from '@angular/core';
import { MatDialogRef,MAT_DIALOG_DATA,MatDialog } from '@angular/material/dialog';
import {CommonTasksService} from '../../services/common-tasks.service';
import {MatTableDataSource} from '@angular/material/table';
import { MessageComponent } from 'src/app/dialog/message/message.component';
import {ApicontactService} from '../../services/apicontact.service';
import { apilink, weblink } from 'src/app/raw/defaultdata';

export class PcpTableData{
  public Add:string="add";
  public c:string;
  public pcpid:string;
  public pcpName:string;
  public pcpprimorg:string;
  public maintanancereason:string;
  public pcpfromdt:Date;
  public pcptodt:Date;
}
@Component({
  selector: 'app-member-pcpdata',
  templateUrl: './member-pcpdata.component.html',
  styleUrls: ['./member-pcpdata.component.css']
})
export class MemberPcpdataComponent implements OnInit {

  constructor(private api:ApicontactService,private dialog:MatDialog,private commTask:CommonTasksService,public dialogRef:MatDialogRef<MemberPcpdataComponent>,@Inject(MAT_DIALOG_DATA) public data:{value:PcpTableData[]}) 
  {

  }
  PcpData:MatTableDataSource<PcpTableData>;
  displayedColumns:string[];
  ngOnInit(): void {
    this.data.value.sort((a:PcpTableData,b:PcpTableData)=>{
      return a.pcptodt==null?-1:((a.pcptodt > b.pcptodt )?-1:((a.pcptodt < b.pcptodt)?1:0))});
      this.data.value[0].c="C";
      this.PcpData=new MatTableDataSource<PcpTableData>(this.data.value);
    this.displayedColumns=['Add','c','pcpid','pcpName','pcpprimorg','maintanancereason','pcpfromdt','pcptodt'];
  }
  add():void{
    this.data.value.push( {Add:"",c: "H", pcpid:"", pcpName: "", pcpprimorg: "", maintanancereason:"1",pcpfromdt:null,pcptodt:null});
    this.PcpData=new MatTableDataSource<PcpTableData>(this.data.value);
  }
  remove(i:number):void{
    if(this.data.value.length>1){
      this.data.value.splice(i,1);
      this.PcpData=new MatTableDataSource<PcpTableData>(this.data.value);
    }
  }
  searchPcp(value:string,i:any){
    if(value=='F2'){
      window.open(weblink+"searchpcp","_blank","width:200,height:100");
      const bc=new BroadcastChannel("sendpcpid");
      bc.addEventListener('message',r=>{
        this.data.value[i].pcpid=r.data.pcpid;
        this.data.value[i].pcpName=r.data.pcpName;
        this.data.value[i].pcpprimorg=r.data.orgName;
        this.PcpData=new MatTableDataSource<PcpTableData>(this.data.value);
      })
    }
  }
  save():void{
    for(let i=0;i<this.data.value.length;i++){
      for(let j=0;j<this.data.value.length;j++){
        if(this.data.value[i]!=this.data.value[j]){
       if(this.commTask.datesCollide(this.data.value[i].pcpfromdt,this.data.value[i].pcptodt==null?new Date('1/1/5000'):this.data.value[i].pcptodt,this.data.value[j].pcpfromdt,this.data.value[j].pcptodt==null?new Date('1/1/5000'):this.data.value[j].pcptodt)){
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
    var pcptodtcount=0;
    
    for(let value of this.data.value){
      if(value.c=="C"){
        countc++;
      }
      if(value.pcptodt==null){
        pcptodtcount++;
      }
    }
    if(pcptodtcount>1){
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
    var currentrec=this.data.value.sort((a:PcpTableData,b:PcpTableData)=>{ return a.pcptodt==null?-1:((a.pcptodt > b.pcptodt )?-1:((a.pcptodt < b.pcptodt)?1:0))})[0];
      if(currentrec.c!="C"){
          this.dialog.open(MessageComponent,{
            width:'50vw',
            data:{title:'Current Records',content:'Please select latest record as current record'}
            });  
          return;
    }

    this.dialogRef.close(this.data.value);
  }
  formatDate(target):void{
    const value:Date=new Date(target.value);
    if(value.toString()=="Invalid Date"){
      target.value=null;
    }
  }
  chkpcpexist(target,i):void{
    this.api.getPcpOrganization(target.value).subscribe(r=>
      {
        if(r.providerLastName==""){
          target.value=null;
        }
        else{
          this.data.value[i].pcpName=r.providerLastName+' '+r.providerFirstName;
          this.data.value[i].pcpprimorg=r.organizationName;
        }
      })
  }
  cancel=function(){
    this.dialogRef.close();
  }
}
  
  

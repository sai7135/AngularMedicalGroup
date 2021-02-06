import { Component, OnInit, ViewChild } from '@angular/core';
import {StateService} from '../../raw/state.service';
import { MatTableDataSource } from '@angular/material/table';
import {MatPaginator} from '@angular/material/paginator'


@Component({
  selector: 'app-state-search-window',
  templateUrl: './state-search-window.component.html',
  styleUrls: ['./state-search-window.component.css']
})
export class StateSearchWindowComponent implements OnInit {
  code:string="";
  filter:string="contains";
  discription:string="";
  state:{name:string,abbreviation:string}[];
  dataSource:MatTableDataSource<{name:string,abbreviation:string}>;
  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  constructor(private states:StateService) { }
  displayedColumns:string[];
  ngOnInit(): void {
    this.displayedColumns=['abbreviation','name'];
    this.state=this.states.states;
    this.dataSource=new MatTableDataSource<{name:string,abbreviation:string}>(this.state);
    this.dataSource.paginator=this.paginator;
    }
  selectstate(value:string){
    const bc=new BroadcastChannel("state");
    bc.postMessage(value);
    window.close();
  }
  search(){
    if(this.discription!=""){
      switch(this.filter){
        case "contains":{
          this.dataSource.filterPredicate=(data:{name:string,abbreviation:string},filter:string)=>
          {
            return new RegExp(filter).test(data.name);
          }
          break;
        }
        case "notcontains":{
          this.dataSource.filterPredicate=(data:{name:string,abbreviation:string},filter:string)=>
          {
            return !(new RegExp(filter).test(data.name));
          }
          break;
        }
        case "beginswith":{
          this.dataSource.filterPredicate=(data:{name:string,abbreviation:string},filter:string)=>
          {
            return (new RegExp("^"+filter).test(data.name));
          }
          break;
        }
        case "endswith":{
          this.dataSource.filterPredicate=(data:{name:string,abbreviation:string},filter:string)=>
          {
            return new RegExp(filter+"$").test(data.name);
          }
          break;
        }
        case "equalsto":{
          this.dataSource.filterPredicate=(data:{name:string,abbreviation:string},filter:string)=>
          {
            return data.name==filter;
          }
          break;
        }
        case "notequalsto":{
          this.dataSource.filterPredicate=(data:{name:string,abbreviation:string},filter:string)=>
          {
            return data.name!=filter;
          }
          break;
        }
      }
      this.dataSource.filter=this.discription;
    }
    else{
      this.dataSource.filterPredicate=(data:{name:string,abbreviation:string},filter:string)=>data.abbreviation==filter.toUpperCase();
      this.dataSource.filter=this.code;
    }
  }
}

import { Component, OnInit, forwardRef, Input } from '@angular/core';
import { ControlValueAccessor, NG_VALUE_ACCESSOR } from '@angular/forms';
import { stringify } from 'querystring';

@Component({
  selector: 'app-date-picker-cust',
  templateUrl: './date-picker-cust.component.html',
  styleUrls: ['./date-picker-cust.component.css'],
  providers:[
    {
      provide:NG_VALUE_ACCESSOR,
      useExisting:DatePickerCustComponent,
      multi:true
    }
  ]
})
export class DatePickerCustComponent implements OnInit,ControlValueAccessor {
  value1:string;
  @Input() pickerref;
  @Input() showErrors:boolean;
  uqvalue:string;
  onChange: (vl:string) => void;
  onTouched:() => void;
  disabled:boolean=false;
  vl:string;
  constructor() { }
  writeValue(obj: string): void {
    this.value1=obj;
    // if(obj){
    // const dt=new Date(obj);
    // this.value=dt.getDate()+"/";
    // this.value+=dt.getMonth()+"/";
    // this.value+=dt.getFullYear();
    // console.log("write value");
    // }
    // else{
    //   this.value="";
    // }
  }
  onChanged(obj){
    var date=new Date(obj);
    if(! isNaN (date.getMonth())){
      this.vl=(date.getMonth()+1)+"/";
      this.vl+=date.getDate()+"/";
      this.vl+=date.getFullYear();
      this.onChange(this.vl);
      }
      else{
        (<HTMLInputElement>document.getElementById(this.uqvalue)).value=null;
      }
  }
  onTouches(vl){
    this.onTouched();
  }
  registerOnChange(fn: any): void {

    this.onChange=fn;

  }
  registerOnTouched(fn: any): void {
    this.onTouched=fn;
  }
  setDisabledState?(isDisabled: boolean): void {
    this.disabled=isDisabled;
  }

  ngOnInit(): void {
    setTimeout(()=>{
      this.uqvalue=this.pickerref.id;
    });
  }

}

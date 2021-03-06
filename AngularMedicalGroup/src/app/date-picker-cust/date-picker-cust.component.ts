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
  value:string;
  @Input() pickerref:string;
  @Input() showErrors:boolean;
  onChange: (vl:string) => void;
  onTouched:() => void;
  disabled:boolean=false;
  vl:string;
  constructor() { }
  writeValue(obj: string): void {
    this.value=obj;
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
  onChanged(obj:Date){
    console.log("on changed");
    if(obj){
      this.vl=(obj.getMonth())+"/";
      this.vl+=obj.getDate()+"/";
      this.vl+=obj.getFullYear();
      this.onChange(this.vl);
      }
      else{
        this.value="";
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
  }

}

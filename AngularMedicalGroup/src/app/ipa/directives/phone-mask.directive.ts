import { Directive, HostListener, HostBinding } from '@angular/core';
import { NgControl } from '@angular/forms';

@Directive({
  selector: '[PhoneMask]'
})
export class PhoneMaskDirective {


  constructor(public model:NgControl){}
  
  @HostListener("ngModelChange",['$event']) changed(event){
    console.log(event)
    var newVal=event.replace(/\D/g,'');
    if(newVal.length==0){
      newVal='';
    }
    else if(newVal.length<=3){
      newVal=newVal.replace(/^(\d{0,3})/, '($1)');
    }
    else if(newVal.length<=6){
      newVal = newVal.replace(/^(\d{0,3})(\d{0,3})/, '($1) $2');
    }
    else if(newVal.length<=10){
      newVal = newVal.replace(/^(\d{0,3})(\d{0,3})(.*)/, '($1) $2-$3');
    }
    this.model.valueAccessor.writeValue(newVal);
  }
}

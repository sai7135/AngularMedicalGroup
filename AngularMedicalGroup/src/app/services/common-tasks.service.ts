import { Injectable } from '@angular/core';
import { apilink } from '../raw/defaultdata';

@Injectable({
  providedIn: 'root'
})
export class CommonTasksService {

  constructor() { }
  public datesCollide(a_start, a_end, b_start, b_end) {
    if (a_start <= b_start && b_start <= a_end) return true; // b starts in a
    if (a_start <= b_end   && b_end   <= a_end) return true; // b ends in a
    if (b_start <  a_start && a_end   <  b_end) return true; // a in b
    return false;
}
// (startdate1:Date,enddate1:Date,startdate2:Date,enddate2:Date):boolean{
//     if(((startdate1<=enddate2 && (enddate2!=null))&&(startdate2<=enddate1 && (enddate1!=null)))){
//       return true;
//     }
//     return false;
//   }
}

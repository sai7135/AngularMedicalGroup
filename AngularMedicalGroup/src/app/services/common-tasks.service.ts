import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CommonTasksService {

  constructor() { }
  public datesCollide(startdate1:Date,enddate1:Date,startdate2:Date,enddate2:Date):boolean{
    if(((startdate1<=enddate2 && (enddate2!=null))||(startdate2<=enddate1 && (enddate1!=null)))){
      return true;
    }
    return false;
  }
}

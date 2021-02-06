import { Injectable,EventEmitter } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CommunicateService {
  public communicate:EventEmitter<boolean>=new EventEmitter<boolean>();
  constructor() { }
}

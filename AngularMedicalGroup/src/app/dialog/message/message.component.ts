import { Component, OnInit, Inject } from '@angular/core';
import {MatDialogRef,MAT_DIALOG_DATA} from '@angular/material/dialog';

@Component({
  selector: 'app-message',
  templateUrl: './message.component.html',
  styleUrls: ['./message.component.css']
})
export class MessageComponent implements OnInit {

  constructor(public dialogRef:MatDialogRef<MessageComponent>,@Inject(MAT_DIALOG_DATA) public data:{title:string;content:string}) { }

  ngOnInit(): void {
  }
  ok():void{
    this.dialogRef.close();
  }

}

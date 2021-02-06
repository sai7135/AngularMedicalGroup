import { Component, OnInit, ViewChild, ComponentFactoryResolver, ApplicationRef, Injector, AfterContentChecked, AfterViewInit, OnDestroy } from '@angular/core';
import { CdkPortal, DomPortalHost } from '@angular/cdk/portal';

@Component({
  selector: 'pop-up',
  template: `
  <ng-container *cdkPortal>
    <ng-content></ng-content>
  </ng-container>
  `,
  styles: [
  ]
})

export class PopUpComponent implements OnInit,AfterViewInit,OnDestroy {

  @ViewChild(CdkPortal)
  private portal:CdkPortal;

  private dom:DomPortalHost;

  private integratedWindow;

  constructor(private componentFactoryResolver:ComponentFactoryResolver,private applicationRef:ApplicationRef,private injector:Injector) { }

  ngOnInit(): void {
    this.integratedWindow=window.open('','','width=100;height=100');
  }
  ngAfterViewInit(){
    this.dom=new DomPortalHost(this.integratedWindow.document.body,this.componentFactoryResolver,this.applicationRef,this.injector);
    this.dom.attach(this.portal);
  }
  ngOnDestroy(){
    this.dom.detach();
  }
}

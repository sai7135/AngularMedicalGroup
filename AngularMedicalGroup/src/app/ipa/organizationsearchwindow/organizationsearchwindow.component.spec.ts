import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OrganizationsearchwindowComponent } from './organizationsearchwindow.component';

describe('OrganizationsearchwindowComponent', () => {
  let component: OrganizationsearchwindowComponent;
  let fixture: ComponentFixture<OrganizationsearchwindowComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OrganizationsearchwindowComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OrganizationsearchwindowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

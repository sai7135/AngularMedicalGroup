import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MemberhptbdialogComponent } from './memberhptbdialog.component';

describe('MemberhptbdialogComponent', () => {
  let component: MemberhptbdialogComponent;
  let fixture: ComponentFixture<MemberhptbdialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MemberhptbdialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MemberhptbdialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

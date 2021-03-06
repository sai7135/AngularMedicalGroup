import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DatePickerCustComponent } from './date-picker-cust.component';

describe('DatePickerCustComponent', () => {
  let component: DatePickerCustComponent;
  let fixture: ComponentFixture<DatePickerCustComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DatePickerCustComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DatePickerCustComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddBenefitMasterComponent } from './add-benefit-master.component';

describe('AddBenefitMasterComponent', () => {
  let component: AddBenefitMasterComponent;
  let fixture: ComponentFixture<AddBenefitMasterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddBenefitMasterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddBenefitMasterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

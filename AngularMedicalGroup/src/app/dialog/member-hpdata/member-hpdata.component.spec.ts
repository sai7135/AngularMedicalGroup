import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MemberHPdataComponent } from './member-hpdata.component';

describe('MemberHPdataComponent', () => {
  let component: MemberHPdataComponent;
  let fixture: ComponentFixture<MemberHPdataComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MemberHPdataComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MemberHPdataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

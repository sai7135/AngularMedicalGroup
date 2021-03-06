import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MemberPcpdataComponent } from './member-pcpdata.component';

describe('MemberPcpdataComponent', () => {
  let component: MemberPcpdataComponent;
  let fixture: ComponentFixture<MemberPcpdataComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MemberPcpdataComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MemberPcpdataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

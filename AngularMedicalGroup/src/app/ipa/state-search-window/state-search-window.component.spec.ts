import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StateSearchWindowComponent } from './state-search-window.component';

describe('StateSearchWindowComponent', () => {
  let component: StateSearchWindowComponent;
  let fixture: ComponentFixture<StateSearchWindowComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StateSearchWindowComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StateSearchWindowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

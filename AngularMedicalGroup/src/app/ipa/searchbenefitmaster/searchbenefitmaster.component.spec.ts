import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SearchbenefitmasterComponent } from './searchbenefitmaster.component';

describe('SearchbenefitmasterComponent', () => {
  let component: SearchbenefitmasterComponent;
  let fixture: ComponentFixture<SearchbenefitmasterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SearchbenefitmasterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SearchbenefitmasterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

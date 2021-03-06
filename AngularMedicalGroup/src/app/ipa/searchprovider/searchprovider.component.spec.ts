import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SearchproviderComponent } from './searchprovider.component';

describe('SearchproviderComponent', () => {
  let component: SearchproviderComponent;
  let fixture: ComponentFixture<SearchproviderComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SearchproviderComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SearchproviderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PractesionarDataComponent } from './practesionar-data.component';

describe('PractesionarDataComponent', () => {
  let component: PractesionarDataComponent;
  let fixture: ComponentFixture<PractesionarDataComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PractesionarDataComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PractesionarDataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

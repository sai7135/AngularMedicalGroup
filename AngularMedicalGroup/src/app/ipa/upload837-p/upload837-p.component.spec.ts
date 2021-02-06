import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Upload837PComponent } from './upload837-p.component';

describe('Upload837PComponent', () => {
  let component: Upload837PComponent;
  let fixture: ComponentFixture<Upload837PComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Upload837PComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Upload837PComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

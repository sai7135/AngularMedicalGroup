import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NonCredentialComponent } from './non-credential.component';

describe('NonCredentialComponent', () => {
  let component: NonCredentialComponent;
  let fixture: ComponentFixture<NonCredentialComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NonCredentialComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NonCredentialComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

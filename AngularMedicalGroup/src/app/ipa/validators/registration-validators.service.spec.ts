import { TestBed } from '@angular/core/testing';

import { RegistrationValidatorsService } from './registration-validators.service';

describe('RegistrationValidatorsService', () => {
  let service: RegistrationValidatorsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(RegistrationValidatorsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

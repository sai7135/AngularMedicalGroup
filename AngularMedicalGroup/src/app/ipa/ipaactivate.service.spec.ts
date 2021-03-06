import { TestBed } from '@angular/core/testing';

import { IpaactivateService } from './ipaactivate.service';

describe('IpaactivateService', () => {
  let service: IpaactivateService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(IpaactivateService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

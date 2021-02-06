import { TestBed } from '@angular/core/testing';

import { HpvalidatorserviceService } from './hpvalidatorservice.service';

describe('HpvalidatorserviceService', () => {
  let service: HpvalidatorserviceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(HpvalidatorserviceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

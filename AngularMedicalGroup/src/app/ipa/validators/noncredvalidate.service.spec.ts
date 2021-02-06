import { TestBed } from '@angular/core/testing';

import { NoncredvalidateService } from './noncredvalidate.service';

describe('NoncredvalidateService', () => {
  let service: NoncredvalidateService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(NoncredvalidateService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

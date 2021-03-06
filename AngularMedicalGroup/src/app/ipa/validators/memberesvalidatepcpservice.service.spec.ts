import { TestBed } from '@angular/core/testing';

import { MemberesvalidatepcpserviceService } from './memberesvalidatepcpservice.service';

describe('MemberesvalidatepcpserviceService', () => {
  let service: MemberesvalidatepcpserviceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MemberesvalidatepcpserviceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

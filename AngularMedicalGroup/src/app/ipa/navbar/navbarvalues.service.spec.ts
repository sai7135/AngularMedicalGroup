import { TestBed } from '@angular/core/testing';

import { NavbarvaluesService } from './navbarvalues.service';

describe('NavbarvaluesService', () => {
  let service: NavbarvaluesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(NavbarvaluesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

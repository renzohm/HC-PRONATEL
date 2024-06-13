import { TestBed } from '@angular/core/testing';

import { VisitRegistrationService } from './visit.registration.service';

describe('VisitRegistrationService', () => {
  let service: VisitRegistrationService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(VisitRegistrationService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

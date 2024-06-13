import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewTriageComponent } from './new-triage.component';

describe('NewTriageComponent', () => {
  let component: NewTriageComponent;
  let fixture: ComponentFixture<NewTriageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NewTriageComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(NewTriageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

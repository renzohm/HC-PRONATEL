import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssignmentProcedureComponent } from './assignment-procedure.component';

describe('AssignmentProcedureComponent', () => {
  let component: AssignmentProcedureComponent;
  let fixture: ComponentFixture<AssignmentProcedureComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AssignmentProcedureComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AssignmentProcedureComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

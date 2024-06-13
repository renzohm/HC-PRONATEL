import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PersonalDetailComponentComponent } from './personal-detail-component.component';

describe('PersonalDetailComponentComponent', () => {
  let component: PersonalDetailComponentComponent;
  let fixture: ComponentFixture<PersonalDetailComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PersonalDetailComponentComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PersonalDetailComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

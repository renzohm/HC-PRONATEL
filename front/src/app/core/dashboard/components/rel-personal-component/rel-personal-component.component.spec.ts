import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RelPersonalComponentComponent } from './rel-personal-component.component';

describe('RelPersonalComponentComponent', () => {
  let component: RelPersonalComponentComponent;
  let fixture: ComponentFixture<RelPersonalComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RelPersonalComponentComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(RelPersonalComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

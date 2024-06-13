import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SupportTechComponentComponent } from './support-tech-component.component';

describe('SupportTechComponentComponent', () => {
  let component: SupportTechComponentComponent;
  let fixture: ComponentFixture<SupportTechComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SupportTechComponentComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(SupportTechComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

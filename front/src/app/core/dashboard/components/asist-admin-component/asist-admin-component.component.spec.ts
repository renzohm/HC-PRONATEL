import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AsistAdminComponentComponent } from './asist-admin-component.component';

describe('AsistAdminComponentComponent', () => {
  let component: AsistAdminComponentComponent;
  let fixture: ComponentFixture<AsistAdminComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AsistAdminComponentComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AsistAdminComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { Component,OnInit } from '@angular/core';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzUploadModule } from 'ng-zorro-antd/upload'
import { NzButtonComponent } from "ng-zorro-antd/button";
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { CommonModule } from '@angular/common';
import { NewRecipeComponent } from '../new-recipe/new-recipe.component';
import { StateService } from '../../../../services/state-service/state.service';
import { ReactiveFormsModule } from '@angular/forms';
import { FormBuilder, FormGroup } from '@angular/forms';
import { DataService } from '../../../../services/data-service/data.service';
import { ConsultationService } from '../../../../services/consultation-service/consultation.service';
import { RecipeService } from '../../../../services/recipe-service/recipe.service';
import { AuthService } from '../../../../services/auth-service/auth.service';
import { ProcedureService } from '../../../../services/procedure-service/procedure.service';
import { VisitRegistrationService } from '../../../../services/visit-registration-service/visit.registration.service';
@Component({
  selector: 'app-assignment-procedure',
  standalone: true,
  imports: [
    CommonModule,
    NzFormModule,
    NzUploadModule,
    NzButtonComponent,
    NzSelectModule,
    NzIconModule,
    NewRecipeComponent,
    ReactiveFormsModule
  ],
  templateUrl: './assignment-procedure.component.html',
  styleUrl: './assignment-procedure.component.css'
})
export class AssignmentProcedureComponent implements OnInit {
  registerForm: FormGroup;


  constructor(public stateService: StateService, private dataService: DataService,
    private fbaux: FormBuilder, private consultationService: ConsultationService,
    private recipeService: RecipeService, private visitRegistrationService: VisitRegistrationService,
    private procedureService: ProcedureService
  ) {
    this.registerForm = this.fbaux.group({
      treatment: [''],
      additionalDetails: ['']

    });
  }
  checkIfAllFieldsAreEmpty() {
    const fields = [
      'treatment','additionalDetails'
    ];

    const allEmpty = fields.every(field => {
      const control = this.registerForm.get(field);
      return !control?.value || control?.value.trim() === '';
    });

    return allEmpty;
  }
  ngOnInit(): void {
    this.procedureService.getProcedureByVisitRegistrationId(this.dataService.getFormIdVisitRegistration()).subscribe({
      next: (data) => {
        this.registerForm.controls['treatment'].setValue(data.treatment);
        this.registerForm.controls['additionalDetails'].setValue(data.additionalDetails);


      },
      error: (error) => {
        console.error('Error fetching workers', error);
      }
    });
  }

  onSubmit(): void {


    if (this.checkIfAllFieldsAreEmpty()) {
      alert('Por favor, rellene los campos.');
      return;
    }


    if (this.registerForm.valid) {


 const putVisitRegistration={
      id: this.dataService.getFormIdVisitRegistration(),
      madeProcedure: true
    }
    this.visitRegistrationService.putMadeProcedure(putVisitRegistration).subscribe({
      next: (data) => {
        console.log(data);
      },
      error: (error) => {
        console.error('Error fetching workers', error);
      }
    });


    const values = this.registerForm.value;

    const requestPayloadProcedure = {
      visitRegistration: { id: this.dataService.getFormIdVisitRegistration() },
      treatment: values.treatment.trim(),
      additionalDetails: values.additionalDetails.trim()
    };

    this.procedureService.putProcedure(requestPayloadProcedure).subscribe({
      next: (data) => {
        console.log('Procedure',data);
      },
      error: (error) => {
        console.error('Error fetching workers', error);
      }
    });

    }

    this.stateService.closeAssignmentProcedure();
    this.dataService.setHasResults(true);
    this.dataService.setLoader(false);
    //this.stateService.closeNewRecipe();
    //this.stateService.closeNewConsult();
    //this.stateService.closeViewButtonNewConsult();
  }




  onGoBack(): void {
    this.stateService.closeAssignmentProcedure();
  }

  onGoBackFull(): void {
    this.stateService.closeAssignmentProcedure();
    this.stateService.closeNewRecipe();
    this.stateService.closeNewConsult();
  }
}

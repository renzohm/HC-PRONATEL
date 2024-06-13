import { Component,OnInit } from '@angular/core';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzUploadModule } from 'ng-zorro-antd/upload'
import { NzButtonComponent } from "ng-zorro-antd/button";
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { CommonModule } from '@angular/common';
import { AssignmentProcedureComponent } from '../assignment-procedure/assignment-procedure.component';
import { StateService } from '../../../../services/state-service/state.service';
import { DataService } from '../../../../services/data-service/data.service';
import { ReactiveFormsModule } from '@angular/forms';
import { FormBuilder, FormGroup } from '@angular/forms';
import { FormRecord, NonNullableFormBuilder, Validators } from '@angular/forms';
import { ConsultationService } from '../../../../services/consultation-service/consultation.service';
import { RecipeService } from '../../../../services/recipe-service/recipe.service';
import { AuthService } from '../../../../services/auth-service/auth.service';
import { VisitRegistrationService } from '../../../../services/visit-registration-service/visit.registration.service';
import { UserService } from '../../../../services/user-service/user.service';
@Component({
  selector: 'app-new-recipe',
  standalone: true,
  imports: [
    CommonModule,
    NzFormModule,
    NzUploadModule,
    NzButtonComponent,
    NzSelectModule,
    NzIconModule,
    AssignmentProcedureComponent,
    ReactiveFormsModule
  ],
  templateUrl: './new-recipe.component.html',
  styleUrl: './new-recipe.component.css'
})
export class NewRecipeComponent implements OnInit{

  registerForm: FormGroup;


  valuesUser:any={};

  constructor(public stateService: StateService, private dataService: DataService,
    private fbaux: FormBuilder, private consultationService: ConsultationService,
    private recipeService: RecipeService, private visitRegistrationService: VisitRegistrationService,
    private userService: UserService
  ) {
    this.registerForm = this.fbaux.group({
      recipeDetail: ['']

    });
    
    console.log('User:', this.dataService.getFormIdUser());
    this.userService.getUserId().subscribe(
      (response) => {
        console.log('Response:', response);
        this.valuesUser = response;
      }
    );


  }

  checkIfAllFieldsAreEmpty() {
    const fields = [
      'recipeDetail'
    ];

    const allEmpty = fields.every(field => {
      const control = this.registerForm.get(field);
      return !control?.value || control?.value.trim() === '';
    });

    return allEmpty;
  }

  ngOnInit(): void {
    this.recipeService.getRecipeByVisitRegistrationId(this.dataService.getFormIdVisitRegistration()).subscribe({
      next: (data) => {
        this.registerForm.controls['recipeDetail'].setValue(data.recipeDetail);
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
        madeRecipe: true
      }
      this.visitRegistrationService.putMadeRecipe(putVisitRegistration).subscribe({
        next: (data) => {
          console.log(data);
        },
        error: (error) => {
          console.error('Error fetching workers', error);
        }
      });

      const values = this.registerForm.value;

      const requestPayloadRecipe = {
        visitRegistration: { id: this.dataService.getFormIdVisitRegistration() },
        recipeDetail: values.recipeDetail.trim()
      };

      this.recipeService.putRecipe(requestPayloadRecipe).subscribe({
        next: (data) => {
          console.log('Recipe',data);
        },
        error: (error) => {
          console.error('Error fetching workers', error);
        }
      });
      
      
      this.stateService.closeNewRecipe();
      //this.stateService.onViewButtonNewConsult();
      this.dataService.setHasResults(true);
      this.dataService.setLoader(false);


    }
  }

  


  closeAssignmentProcedure(): void {
    this.stateService.closeAssignmentProcedure();
  }
  onViewAssignmentProcedure(): void {
    const values = this.registerForm.value;

    const formValue = {
      recipeDetail: values.recipeDetail.trim(),

    };
    this.dataService.setFormDataRecipe(formValue);


    this.stateService.onViewAssignmentProcedure();
  }
  onGoBack(): void {
    this.stateService.closeNewRecipe();
  }

  onGoBackFull(): void {
    this.stateService.closeNewRecipe();
    this.stateService.closeNewConsult();
  }
}

import { Component,OnInit} from '@angular/core';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzUploadModule } from 'ng-zorro-antd/upload'
import { NzButtonComponent } from "ng-zorro-antd/button";
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { CommonModule } from '@angular/common';
import { NewRecipeComponent } from '../new-recipe/new-recipe.component';
import { StateService } from '../../../../services/state-service/state.service';
import { DataService } from '../../../../services/data-service/data.service';
import { ReactiveFormsModule } from '@angular/forms';
import { FormBuilder, FormGroup } from '@angular/forms';
import { FormRecord, NonNullableFormBuilder, Validators } from '@angular/forms';
import { VisitRegistrationService } from '../../../../services/visit-registration-service/visit.registration.service';
import { ConsultationService } from '../../../../services/consultation-service/consultation.service';

@Component({
  selector: 'app-new-consult',
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
  templateUrl: './new-consult.component.html',
  styleUrl: './new-consult.component.css'
})
export class NewConsultComponent implements OnInit{
 
  registerForm: FormGroup;

  constructor(public stateService: StateService, private dataService: DataService,
    private fbaux: FormBuilder,private visitRegistrationService:VisitRegistrationService,
    private consultationService:ConsultationService
  ) {
    this.registerForm = this.fbaux.group({
      summaryReason: ['', Validators.required],
      detailReason: ['', Validators.required],
      cide10: ['', Validators.required],
      diagnosis: ['', Validators.required]

    });

  }

  ngOnInit() {



      // Luego cargar los datos
  this.consultationService.getConsultationByVisitRegistrationId(this.dataService.getFormIdVisitRegistration()).subscribe(
    {
      next: (data) => {
        console.log('Datos de consulta:', data);
        this.registerForm.controls['summaryReason'].setValue(data.summaryReason);
        this.registerForm.controls['detailReason'].setValue(data.detailReason);
        this.registerForm.controls['cide10'].setValue(data.cide10);
        this.registerForm.controls['diagnosis'].setValue(data.diagnosis);
      },
      error: (error) => {
        console.error('Error al obtener los datos de registro de consulta:', error);
      }
    }
  );
  }


  checkIfAllFieldsAreEmpty() {
    const fields = [
      'summaryReason','detailReason', 'cide10', 'diagnosis'
    ];

    const allEmpty = fields.every(field => {
      const control = this.registerForm.get(field);
      return !control?.value || control?.value.trim() === '';
    });

    return allEmpty;
  }


  onSubmit(): void {
    if (this.registerForm.valid) {

      let dateVisit = new Date();
      let year = dateVisit.getFullYear();
      let month = (dateVisit.getMonth() + 1).toString().padStart(2, '0');
      let day = dateVisit.getDate().toString().padStart(2, '0');

      let formattedDate = `${year}-${month}-${day}`;


 

      const putVisitRegistration={
        id: this.dataService.getFormIdVisitRegistration(),
        madeConsultation: true
      }
      this.visitRegistrationService.putMadeConsultation(putVisitRegistration).subscribe({
        next: (data) => {
          console.log(data);
        },
        error: (error) => {
          console.error('Error fetching workers', error);
        }
      });


      const values = this.registerForm.value;



      const formValue = {
        dateVisit: formattedDate,
        summaryReason: values.summaryReason.trim(),
        detailReason: values.detailReason.trim(),
        cide10: values.cide10.trim(),
        diagnosis: values.diagnosis.trim()
      };

      this.consultationService.updateConsultation(formValue).subscribe(
        {
          next: (data) => {
            console.log('Datos de consulta actualizados:', data);
          },
          error: (error) => {
            console.error('Error al actualizar los datos de registro de consulta:', error);
          }
        }
      )

      this.stateService.closeNewConsult();
      //this.stateService.onViewButtonNewConsult();
      this.dataService.setHasResults(true);
      this.dataService.setLoader(false);


     // this.onViewNewRecipe();
      //this.dataService.setFormDataConsult(formValue);


    } else {
      const summaryReasonControl = this.registerForm.get('summaryReason');
      const detailReasonControl = this.registerForm.get('detailReason');
      const cide10Control = this.registerForm.get('cide10');
      const diagnosisControl = this.registerForm.get('diagnosis');


      if (this.checkIfAllFieldsAreEmpty()) {
        alert('Por favor, rellene los campos.');
        return;
      }

      if (summaryReasonControl?.invalid) {
        const summaryReasonValue = summaryReasonControl.value;
        if (!summaryReasonValue || summaryReasonValue.trim() === '') {
          alert('El resumen del motivo de la consulta no puede estar vacío.');
        } else {
          alert('El resumen del motivo de la consulta no puede estar vacío.');
        }
      }

      if (detailReasonControl?.invalid) {
        const detailReasonValue = detailReasonControl.value;
        if (!detailReasonValue || detailReasonValue.trim() === '') {
          alert('El detalle del motivo de la consulta no puede estar vacío.');
        } else {
          alert('El detalle del motivo de la consulta no puede estar vacío.');
        }
      }

      if (cide10Control?.invalid) {
        const cide10Value = cide10Control.value;
        if (!cide10Value || cide10Value.trim() === '') {
          alert('El CIE 10 no puede estar vacío.');
        } else {
          alert('El CIE 10 no puede estar vacío.');
        }
      }


      if (diagnosisControl?.invalid) {
        const diagnosisValue = diagnosisControl.value;
        if (!diagnosisValue || diagnosisValue.trim() === '') {
          alert('El diagnostico no puede estar vacío.');
        } else {
          alert('El diagnostico no puede estar vacío.');
        }
      }

    }
  }

  closeNewRecipe(): void {
    this.stateService.closeNewRecipe();
  }
  onViewNewRecipe(): void {
    this.stateService.onViewNewRecipe();
  }
  onGoBack(): void {
    this.stateService.closeNewConsult();
  }
}

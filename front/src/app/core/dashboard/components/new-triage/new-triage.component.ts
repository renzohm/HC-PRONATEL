import { Component,OnInit } from '@angular/core';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzUploadModule } from 'ng-zorro-antd/upload'
import { NzButtonComponent } from "ng-zorro-antd/button";
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { FormBuilder, FormGroup } from '@angular/forms';
import { FormRecord, NonNullableFormBuilder, Validators } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { FormsModule } from '@angular/forms';
import { TriageService } from '../../../../services/triage-service/triage.service';
import { AuthService } from '../../../../services/auth-service/auth.service';
import { StateService } from '../../../../services/state-service/state.service';
import { DataService } from '../../../../services/data-service/data.service';
import { VisitRegistrationService } from '../../../../services/visit-registration-service/visit.registration.service';
import { ConsultationService } from '../../../../services/consultation-service/consultation.service';
import { OPCIONES_GLASGOWEYEOPENING,OPCIONES_GLASGOWVERBALRESPONSE, OPCIONES_GLASGOWMOTORRESPONSE} from '../../../../shared/interfaces/Glasgow';
import { CommonModule } from '@angular/common';
import { AbstractControl, ValidationErrors, ValidatorFn } from '@angular/forms';

@Component({
  selector: 'app-new-triage',
  standalone: true,
  imports: [
    NzFormModule,
    NzUploadModule,
    NzButtonComponent,
    NzSelectModule,
    NzIconModule,
    ReactiveFormsModule,
    FormsModule,
    CommonModule
  ],
  templateUrl: './new-triage.component.html',
  styleUrl: './new-triage.component.css'
})
export class NewTriageComponent implements OnInit {

  glasgowEyeOpening = OPCIONES_GLASGOWEYEOPENING;
  glasgowVerbalResponse=OPCIONES_GLASGOWVERBALRESPONSE;
  glasgowMotorResponse= OPCIONES_GLASGOWMOTORRESPONSE;

  registerForm: FormGroup;
  constructor(private fbaux: FormBuilder, private triageService: TriageService,
    private authService: AuthService, private stateService: StateService,
    private dataService: DataService,private visitRegistrationService:VisitRegistrationService,
    private consultationService:ConsultationService) {

    this.registerForm = this.fbaux.group({
      heartRate: [''],
      breathingFrequency: [''],
      bloodPressure: [''],
      bodyTemperature: [''],
      oxygenSaturation: [''],
      conscienceLevel: [''],
      glasgowEyeOpening: [''],
      glasgowVerbalResponse: [''],
      glasgowMotorResponse: ['']
    },{ validators: this.glasgowFieldsValidator() });
  }


  ngOnInit(): void {
    this.triageService.getTriageByVisitRegistrationId(this.dataService.getFormIdVisitRegistration()).subscribe({
      next: (data) => {
        console.log(data);
        if(data && 'id' in data){
          console.log(data)
          console.log(data.id)
          this.registerForm.controls['heartRate'].setValue(data.heartRate === 0 ? '' : data.heartRate);
          this.registerForm.controls['breathingFrequency'].setValue(data.breathingFrequency=== 0 ? '' :data.breathingFrequency);
          this.registerForm.controls['bloodPressure'].setValue(data.bloodPressure=== 0 ? '' :data.bloodPressure);
          this.registerForm.controls['bodyTemperature'].setValue(data.bodyTemperature=== 0 ? '' :data.bodyTemperature);
          this.registerForm.controls['oxygenSaturation'].setValue(data.oxygenSaturation=== 0 ? '' :data.oxygenSaturation);
          this.registerForm.controls['conscienceLevel'].setValue(data.conscienceLevel=== 0 ? '' :data.conscienceLevel);
          
            // Para el select glasgowEyeOpening
        const glasgowEyeOpeningValue = OPCIONES_GLASGOWEYEOPENING.find(option => option.id === data.glasgowEyeOpening);
        if (glasgowEyeOpeningValue) {
          this.registerForm.controls['glasgowEyeOpening'].setValue(glasgowEyeOpeningValue.id);
        } else {
          this.registerForm.controls['glasgowEyeOpening'].setValue(''); // o cualquier valor por defecto que consideres apropiado
        }
        // Para el select glasgowVerbalResponse
        const glasgowVerbalResponseValue = OPCIONES_GLASGOWVERBALRESPONSE.find(option => option.id === data.glasgowVerbalResponse);
        if (glasgowVerbalResponseValue) {
          this.registerForm.controls['glasgowVerbalResponse'].setValue(glasgowVerbalResponseValue.id);
        }
        else {
          this.registerForm.controls['glasgowVerbalResponse'].setValue(''); // o cualquier valor por defecto que consideres apropiado
        }
        // Para el select glasgowMotorResponse
        const glasgowMotorResponseValue = OPCIONES_GLASGOWMOTORRESPONSE.find(option => option.id === data.glasgowMotorResponse);
        if (glasgowMotorResponseValue) {
          this.registerForm.controls['glasgowMotorResponse'].setValue(glasgowMotorResponseValue.id);
        }
        else {
          this.registerForm.controls['glasgowMotorResponse'].setValue(''); // o cualquier valor por defecto que consideres apropiado
        }
          
          //this.registerForm.controls['glasgowEyeOpening'].setValue(data.glasgowEyeOpening);
          //this.registerForm.controls['glasgowVerbalResponse'].setValue(data.glasgowVerbalResponse);
          //this.registerForm.controls['glasgowMotorResponse'].setValue(data.glasgowMotorResponse);


         
        }
      },
      error: (error) => {
        console.error('Error fetching workers', error);
      }
    });
  }


  glasgowFieldsValidator(): ValidatorFn {
    return (formGroup: AbstractControl): ValidationErrors | null => {
      const glasgowEyeOpening = formGroup.get('glasgowEyeOpening')?.value;
      const glasgowVerbalResponse = formGroup.get('glasgowVerbalResponse')?.value;
      const glasgowMotorResponse = formGroup.get('glasgowMotorResponse')?.value;
  
      // Verifica que todos los campos de Glasgow estén llenos
      const areAllFieldsFilled = glasgowEyeOpening && glasgowVerbalResponse && glasgowMotorResponse;
  
      if (!areAllFieldsFilled) {
        // Si alguno de los campos está vacío, retorna un error de validación
        return { glasgowFieldsRequired: true };
      }
  
      return null;  // No hay errores
    };
  }
  


  onSubmit() {

          //console.log(requestPayload);
          let dateVisitAux = new Date();
          let year = dateVisitAux.getFullYear();
          let month = (dateVisitAux.getMonth() + 1).toString().padStart(2, '0');
          let day = dateVisitAux.getDate().toString().padStart(2, '0');
    
          let formattedDate = `${year}-${month}-${day}`;
    
         /* if (this.checkIfAllFieldsAreEmpty()) {
            alert('Por favor, rellene al menos un campo.');
            return;
          }*/
          if (this.registerForm.invalid) {
            if (this.registerForm.errors && this.registerForm.errors['glasgowFieldsIncomplete']) {
              alert('Si uno de los campos de Glasgow está lleno, todos deben estar llenos.');
            } else {
              alert('Por favor, rellene los campos de Glasgow.');
            }
            
            return;
          }


    const putVisitRegistration={
      id: this.dataService.getFormIdVisitRegistration(),
      madeTriage: true
    }
    console.log(putVisitRegistration);
    this.visitRegistrationService.putMadeTriage(putVisitRegistration).subscribe({
      next: (data) => {
        console.log(data);
      },
      error: (error) => {
        console.error('Error fetching workers', error);
      }
    });

      const values = this.registerForm.value;
      console.log(values);
      const requestPayload = {
        visitRegistration: { id: this.dataService.getFormIdVisitRegistration() },
        heartRate: parseInt(values.heartRate),
        breathingFrequency: parseInt(values.breathingFrequency),
        bloodPressure: parseInt(values.bloodPressure),
        bodyTemperature: parseFloat(values.bodyTemperature),
        oxygenSaturation: parseInt(values.oxygenSaturation),
        conscienceLevel: values.conscienceLevel.trim(),
        glasgowEyeOpening:parseInt(values.glasgowEyeOpening),
        glasgowVerbalResponse:parseInt(values.glasgowVerbalResponse),
        glasgowMotorResponse:parseInt(values.glasgowMotorResponse)
      };

      this.triageService.putTriage(requestPayload).subscribe({
        next: (data) => {
          console.log(data);
        },
        error: (error) => {
          console.error('Error fetching workers', error);
        }



      });

      this.stateService.closeTriage();
      //this.stateService.onViewButtonNewConsult();
      this.dataService.setHasResults(true);
      this.dataService.setLoader(false);

      /*this.triageService.createTriage(requestPayload).subscribe(
        (response) => {
  
          if (response && 'id' in response) {
            this.dataService.setFormIdTriage(response.id);
            console.log(formattedDate)

            const requestPayloadVisit = {
              triage: { id: this.dataService.getFormIdTriage() },
              dateVisit: formattedDate,
              cide10: "",
              diagnosis: "",
            };
            console.log(requestPayloadVisit)
            this.consultationService.createVisitRegistration(requestPayloadVisit).subscribe(
              (response1) => {
        
                if (response1 && 'id' in response1) {
                  this.dataService.setFormIdVisitRegistration(response1.id);
                  console.log(response1)

                  this.doSomethingWithAuxConsult(response1);



                } else {
                  console.error('La respuesta no contiene la propiedad id');
                }
                //this.stateService.closeTriage();
                //this.stateService.onViewButtonNewConsult();
        
              }
            );
            console.log(response);

          } else {
            console.error('La respuesta no contiene la propiedad id');
          }
         
        }
      );*/
     

     
      



  
    
  }

  /*doSomethingWithAuxConsult(auxConsult: any) {
    if (auxConsult) {
      const values = auxConsult;

      const requestPayloadConsult = {
        visitRegistration: { id: this.dataService.getFormIdVisitRegistration()},
        dateVisit: values.dateVisit,
        summaryReason: values.summaryReason,
        detailReason: "",
        cide10: "",
        diagnosis:"",
      };
      console.log("Request",requestPayloadConsult)
      this.consultationService.createConsultation(requestPayloadConsult).subscribe(
        (response) => {
          console.log('Response:', response);
          if (response && 'id' in response) {
            this.dataService.setFormIdConsultation(response.id);

          }

        }
      );
      //this.dataService.setHasResults(true);
      //this.dataService.setLoader(false);

    }
  }*/

  



 /* checkIfAllFieldsAreEmpty() {
    const fields = [
      'heartRate', 'breathingFrequency', 'bloodPressure', 'bodyTemperature',
      'oxygenSaturation', 'conscienceLevel'
    ];

    const allEmpty = fields.every(field => {
      const control = this.registerForm.get(field);
      return !control?.value || control?.value.trim() === '';
    });

    return allEmpty;
  }*/


}

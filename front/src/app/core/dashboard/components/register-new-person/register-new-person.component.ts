import { Component, ElementRef, ViewChild, OnInit } from '@angular/core';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzUploadModule } from 'ng-zorro-antd/upload'
import { NzButtonComponent } from "ng-zorro-antd/button";
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzTagModule } from 'ng-zorro-antd/tag';
import { CommonModule } from '@angular/common';
import { FormControl, ValidationErrors } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { FormBuilder, FormGroup } from '@angular/forms';
import { FormRecord, NonNullableFormBuilder, Validators } from '@angular/forms';
import { ValidatorFn, AbstractControl } from '@angular/forms';
import { PersonService } from '../../../../services/person-service/person.service';
import Person from '../../../../shared/interfaces/User';
import { NzDatePickerModule } from 'ng-zorro-antd/date-picker';
import { FormsModule } from '@angular/forms';
import { OPCIONES_DEPARTAMENTOS } from '../../../../shared/interfaces/Dependences';
import { OPCIONES_GENEROS } from '../../../../shared/interfaces/Genders';
import { OPCIONES_TIPO_DOCUMENTO } from '../../../../shared/interfaces/TypeDocument';

@Component({
  selector: 'app-register-new-person',
  standalone: true,
  imports: [
    NzFormModule,
    NzUploadModule,
    NzButtonComponent,
    NzSelectModule,
    NzIconModule,
    NzTagModule,
    CommonModule,
    ReactiveFormsModule,
    NzDatePickerModule,
    FormsModule
  ],
  templateUrl: './register-new-person.component.html',
  styleUrl: './register-new-person.component.css'
})

export class RegisterNewPersonComponent implements OnInit {
  opcionesDepartamentos = OPCIONES_DEPARTAMENTOS;
  opcionesGeneros = OPCIONES_GENEROS;
  opcionesTipoDocumento = OPCIONES_TIPO_DOCUMENTO;


  documentLengthValidator(): ValidatorFn {
    return (control: AbstractControl): ValidationErrors | null => {
        const typeDocument = this.registerForm.get('typeDocument')?.value;
        if (!control.value) {
            return null;  // No validar si no hay valor
        }
        const value = control.value as string;
        if (typeDocument === '0' && value.length !== 8) {  // 0 es el ID para DNI
            return { 'dniLength': true };
        } else if (typeDocument === '1' && value.length !== 9) {  // 1 es el ID para CE
            return { 'ceLength': true };
        }
        return null;  // No hay errores de validación
    };
}

  

  registerForm: FormGroup;

  constructor(private fb: NonNullableFormBuilder, private fbaux: FormBuilder, private personService: PersonService) {
    this.registerForm = this.fbaux.group({
      typeDocument: ['', Validators.required], // Control para el tipo de documento
      position: ['', Validators.required],
      names: ['', Validators.required],
      gender: ['', Validators.required],
      document: [{ value: '', disabled: true }, [Validators.required, Validators.pattern(/^\d+$/)]],
      dependence: ['', Validators.required],
      phoneNumber: ['', [Validators.required, Validators.pattern(/^9\d{8}$/)]],
      email: ['', [Validators.required, Validators.email, this.emailAtSymbolValidator()]],
      birthdate: ['', Validators.required],
      allergies: [''],
      emergencyPhoneNumber: ['', [Validators.pattern(/^9\d{8}$/)]],
      precedents: ['']

    });

    console.log(this.opcionesDepartamentos)
    //this.applyTrimOnChanges('dni');
    this.applyTrimOnChanges('document');
    this.applyTrimOnChanges('phoneNumber');
    this.applyTrimOnChanges('emergencyPhoneNumber');
    this.applyTrimOnChanges('email');
  }


  ngOnInit(): void {
    this.registerForm.get('typeDocument')!.valueChanges.subscribe(tipo => {
        const documentControl = this.registerForm.get('document')!;
        if (tipo === '0' || tipo === '1') {  // Verificando por números
            documentControl.enable();
            documentControl.setValidators([
                Validators.required,
                Validators.pattern(/^\d+$/),
                this.documentLengthValidator()
            ]);
            documentControl.updateValueAndValidity();
        } else {
            documentControl.disable();
            documentControl.setValue('');
        }
    });
    this.addField();

}

  


  date = null;

  onChange(result: Date): void {
    if (result) {
      this.registerForm.value.birthdate = result.toISOString().split('T')[0];
    } else {
    }

  }

  applyTrimOnChanges(fieldName: string): void {
    const control = this.registerForm.get(fieldName);

    if (control) {
      control.valueChanges.subscribe(value => {
        if (typeof value === 'string') {
          control.setValue(value.trim(), { emitEvent: false });
        }
      });
    }
  }



  emailAtSymbolValidator(): ValidatorFn {
    return (control: AbstractControl): { [key: string]: any } | null => {
      if (!control.value) {
        return null;
      }
      const hasAtSymbol = control.value.includes('@');
      return hasAtSymbol ? null : { 'emailAtSymbol': { value: control.value } };
    };
  }

  checkIfAllFieldsAreEmpty() {
    const fields = [
      'typeDocument', 'phoneNumber', 'email', 'position', 'names', 'gender',
      'dependence', 'birthdate', 'emergencyPhoneNumber'
    ];

    const allEmpty = fields.every(field => {
      const control = this.registerForm.get(field);
      return !control?.value || control?.value.trim() === '';
    });

    return allEmpty;
  }


  onSubmit(): void {
    if (this.registerForm.valid) {
      const values = this.registerForm.value;
    console.log(this.registerForm.value.dependence);


      const formValue = {
        ...values,
        position: values.position.trim(),
        names: values.names.trim(),
      };

      const requestPayload: any = {
        position: formValue.position,
        names: formValue.names,
        gender: Number(formValue.gender),
        typeDocument: Number(formValue.typeDocument),
        document: formValue.document,
        dependence: Number(formValue.dependence), // Convertir el valor de dependencia a número si es necesario
        phoneNumber: formValue.phoneNumber,
        email: formValue.email,
        birthdate: formValue.birthdate,
        allergies: formValue.allergies,
        emergencyPhoneNumber: formValue.emergencyPhoneNumber,
        precedents: formValue.precedents

      };

      console.log('Request:', requestPayload);

      this.personService.createUser(requestPayload).subscribe(
        (response) => {
        }
      );
      window.location.reload();
    } else {
      const dniControl = this.registerForm.get('dni');
      const ceControl = this.registerForm.get('ce');

      const phoneNumberControl = this.registerForm.get('phoneNumber');
      const emailControl = this.registerForm.get('email');
      const positionControl = this.registerForm.get('position');
      const namesControl = this.registerForm.get('names');
      const genderControl = this.registerForm.get('gender');
      const dependenceControl = this.registerForm.get('dependence');
      const typeDocumentControl = this.registerForm.get('typeDocument');

      const birthdateControl = this.registerForm.get('birthdate');
      const emergencyPhoneNumberControl = this.registerForm.get('emergencyPhoneNumber');


     


      if (this.checkIfAllFieldsAreEmpty()) {
        alert('Por favor, rellene los campos.');
        return;
      }



      if (birthdateControl?.invalid || !birthdateControl?.value) {
        alert('Debe seleccionar una fecha de nacimiento.');
        return;
      }
      if (genderControl?.invalid || !genderControl?.value || genderControl.value.trim() === '') {
        alert('Debe seleccionar un género.');
      }

      if (dependenceControl?.invalid || !dependenceControl?.value || dependenceControl.value.trim() === '') {
        alert('Debe seleccionar una dependencia.');
      }

      if (typeDocumentControl?.invalid || !typeDocumentControl?.value || typeDocumentControl.value.trim() === '') {
        alert('Debe seleccionar un tipo de documento.');
      }

      if (positionControl?.invalid) {
        const positionValue = positionControl.value;
        if (!positionValue || positionValue.trim() === '') {
          alert('El cargo no puede estar vacío.');
        } else {
          alert('El cargo no puede estar vacío.');
        }
      }

      if (namesControl?.invalid) {
        const namesValue = namesControl.value;
        if (!namesValue || namesValue.trim() === '') {
          alert('Los nombres y apellidos no pueden estar vacíos.');
        } else {
          alert('Los nombres y apellidos no pueden estar vacíos.');
        }
      }



      if (dniControl?.invalid) {
        alert('El DNI debe tener exactamente 8 dígitos.');
      }

      if (ceControl?.invalid) {
        alert('El CE debe tener exactamente 9 dígitos.');
      }

      if (phoneNumberControl?.invalid) {
        alert('El número de teléfono debe empezar con 9 y tener 9 dígitos.');
      }

      if (emergencyPhoneNumberControl?.invalid) {
        alert('El número de contacto de emergencia debe empezar con 9 y tener 9 dígitos.');
      }

      if (emailControl?.invalid) {
        const emailValue = emailControl.value;
        if (!emailValue || emailValue.trim() === '') {
          alert('El correo electrónico no puede estar vacío.');
        } else if (!emailValue.includes('@') || emailValue.split('@')[1].trim() === '') {
          alert('El correo electrónico debe ser válido y contener un @ con un dominio.');
        } else {
          alert('El correo electrónico debe ser válido.');
        }
      }

      Object.values(this.registerForm.controls).forEach(control => {
        if (control.invalid) {
          control.markAsDirty();
          control.updateValueAndValidity({ onlySelf: true });
        }
      });
    }
  }
  /*
    calculateAge(birthDateString: string): number {
      const birthDate = new Date(birthDateString);
      const today = new Date();
      let age = today.getFullYear() - birthDate.getFullYear();
      const m = today.getMonth() - birthDate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }
      return age;
    }*/

  validateForm: FormRecord<FormControl<string>> = this.fb.record({});
  listOfControl: Array<{ id: number; controlInstance: string }> = [];

  addField(e?: MouseEvent): void {
    e?.preventDefault();

    const id = this.listOfControl.length > 0 ? this.listOfControl[this.listOfControl.length - 1].id + 1 : 0;

    const control = {
      id,
      controlInstance: `passenger${id}`
    };
    const index = this.listOfControl.push(control);
    this.validateForm.addControl(
      this.listOfControl[index - 1].controlInstance,
      this.fb.control('', Validators.required)
    );
  }

  removeField(i: { id: number; controlInstance: string }, e: MouseEvent): void {
    e.preventDefault();
    if (this.listOfControl.length > 1) {
      const index = this.listOfControl.indexOf(i);
      if (index !== -1) {
        this.validateForm.removeControl(i.controlInstance);
        this.listOfControl.splice(index, 1);
      }
    } else {
      const control = this.validateForm.get(i.controlInstance);
      if (control) {
        control.setValue('');

      }
    }
  }

  submitForm(): void {
    if (this.validateForm.valid) {
      const trimmedValues: { [key: string]: string | null | undefined } = {};

      Object.keys(this.validateForm.value).forEach(key => {
        const value = this.validateForm.value[key];
        if (value === undefined) {
          trimmedValues[key] = null;
        } else {
          trimmedValues[key] = typeof value === 'string' ? value.trim() : value;
        }
      });

      const commaSeparatedValues = Object.values(trimmedValues).filter(v => v !== null && v !== undefined).join(',');
      this.registerForm.value.allergies = commaSeparatedValues;
    } else {
      Object.values(this.validateForm.controls).forEach(control => {
        if (control.invalid) {
          control.markAsDirty();
          control.updateValueAndValidity({ onlySelf: true });
        }
      });
    }
  }



}


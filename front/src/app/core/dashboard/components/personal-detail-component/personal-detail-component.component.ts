import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NzTableModule } from 'ng-zorro-antd/table';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzDropDownModule } from 'ng-zorro-antd/dropdown';
import { NzIconModule,NZ_ICONS } from 'ng-zorro-antd/icon';
import { NzMenuModule } from 'ng-zorro-antd/menu';
import { NewTriageComponent } from '../new-triage/new-triage.component';
import { PersonService } from '../../../../services/person-service/person.service';
import Person from '../../../../shared/interfaces/User'
import { AuthService } from '../../../../services/auth-service/auth.service';
import { NewConsultComponent } from '../new-consult/new-consult.component';
import { StateService } from '../../../../services/state-service/state.service';
import { ConsultationService } from '../../../../services/consultation-service/consultation.service';
import { NzEmptyComponent } from "ng-zorro-antd/empty";
import { DataService } from '../../../../services/data-service/data.service';
import { NzSpinModule } from 'ng-zorro-antd/spin';
import { VisitRegistrationService } from '../../../../services/visit-registration-service/visit.registration.service';
import { OPCIONES_DEPARTAMENTOS } from '../../../../shared/interfaces/Dependences';
import { OPCIONES_GENEROS } from '../../../../shared/interfaces/Genders';
import { OPCIONES_TIPO_DOCUMENTO } from '../../../../shared/interfaces/TypeDocument';
import { EyeOutline, CloseOutline } from '@ant-design/icons-angular/icons';
import { TriageService } from '../../../../services/triage-service/triage.service';
import { RecipeService } from '../../../../services/recipe-service/recipe.service';
import { ProcedureService } from '../../../../services/procedure-service/procedure.service';
import { NewRecipeComponent } from '../new-recipe/new-recipe.component';
import { AssignmentProcedureComponent } from '../assignment-procedure/assignment-procedure.component';
@Component({
  selector: 'app-personal-detail-component',
  standalone: true,
  imports: [
    CommonModule,
    NzTableModule,
    NzButtonModule,
    NzDropDownModule,
    NzIconModule,
    NzMenuModule,
    NewTriageComponent,
    NewConsultComponent,
    NzEmptyComponent,
    NzSpinModule,
    NewRecipeComponent,
    AssignmentProcedureComponent
  ],
  providers: [
    { provide: NZ_ICONS, useValue: [ EyeOutline, CloseOutline ] }
  ],
  templateUrl: './personal-detail-component.component.html',
  styleUrl: './personal-detail-component.component.css'
})
export class PersonalDetailComponentComponent implements OnInit {
  isFirstRowActive: boolean = false;

  constructor(public personService: PersonService, private authService: AuthService,
    public stateService: StateService, private consultationService: ConsultationService,
    public dataService: DataService, private visitRegistrationService: VisitRegistrationService,
    private triageService: TriageService, private recipeService: RecipeService, private procedureService: ProcedureService) {



  }
  personData: any = {};
  consultationData: any;

  allergiesData: any;
  numContactEmergencyData: any;
  precedentsData: any;
  ageData: any;

  formatAllergies(allergies: string): string {
    if (!allergies) return '';
    return allergies.split(',')
      .map(allergy => allergy.trim().toUpperCase())
      .join(', ');
  }

  viewFormTriage(id: any){
    this.dataService.setFormIdVisitRegistration(id);

    this.stateService.onViewTriage();
  }

  viewFormConsultation(id: any){
    this.dataService.setFormIdVisitRegistration(id);
    this.stateService.onViewNewConsult();

  }

  viewFormRecipe(id: any){ 
    this.dataService.setFormIdVisitRegistration(id);
    this.stateService.onViewNewRecipe();

  }
  
  viewFormProcedure(id:any){
    this.dataService.setFormIdVisitRegistration(id);
    this.stateService.onViewAssignmentProcedure();

  }
  calculateAge(birthDateString: string): number {
    const birthDate = new Date(birthDateString);
    const today = new Date();
    let age = today.getFullYear() - birthDate.getFullYear();
    const m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
      age--;
    }
    return age;
  }


  ngOnInit(): void {
    this.loadInitialData();
    this.consultationService.fetchConsultations();


    this.consultationService.visitRegistrationsUpdated.subscribe({
      next: (data: any) => {

        this.consultationData = data;
      },
      error: (error) => {
        console.error('Error fetching consultations', error);
      }
    });

  }
  getDependenceName(dependenceId: number): string {
    const dependence = OPCIONES_DEPARTAMENTOS.find(doc => doc.id === dependenceId);
    return dependence ? dependence.nombre : 'Desconocido';
  }
  getGenderName(genderId: number): string {
    const gender = OPCIONES_GENEROS.find(doc => doc.id === genderId);
    return gender ? gender.nombre : 'Desconocido';
  }
  getDocumentName(typeDocumentId: number): string {
    const documento = OPCIONES_TIPO_DOCUMENTO.find(doc => doc.id === typeDocumentId);
    return documento ? documento.nombre : 'Desconocido';
  }

  loadInitialData() {

    this.personService.getPersonId().subscribe({
      next: (data) => {
        console.log(data); // Muestra la estructura de los datos recibidos

        // Mapeo de datos antes de la asignación a `personData`
        const mappedData = {
          ...data,
          typeDocument: this.getDocumentName(data.typeDocument),
          gender: this.getGenderName(data.gender),
          dependence: this.getDependenceName(data.dependence),
          age: this.calculateAge(data.birthdate),
          emergencyPhoneNumber: data.emergencyPhoneNumber.length < 1 ? "No especificado" : data.emergencyPhoneNumber,
          precedents: data.precedents.length < 1 ? "No especificado" : data.precedents,
          allergies: data.allergies.length < 1 ? "No especificado" : this.formatAllergies(data.allergies)
        };

        // Solo una asignación a `personData`
        this.personData = mappedData;

        console.log(this.personData);

      },
      error: (error) => {
        console.error('Error fetching workers', error);
      }
    });
  }


  loadConsultations() {

    this.consultationService.getAllConsultations().subscribe({
      next: (data: any) => {
        this.consultationData = data;
        console.log(data);
      },
      error: (error) => {
        console.error('Error fetching workers', error);
      }
    });

  }

  editTriage(id: any) {
    this.dataService.setFormIdVisitRegistration(id);
    console.log(this.dataService.getFormIdVisitRegistration());
    //console.log(this.dataService.getFormIdTriage());
    
    //console.log(this.dataService.getFormIdTriage());
    this.stateService.onViewTriage();
  }

  editConsultation(id: any) {
    this.dataService.setFormIdVisitRegistration(id);
    this.stateService.onViewNewConsult();



  }

  editRecipe(id: any) {
    this.dataService.setFormIdVisitRegistration(id);
    this.stateService.onViewNewRecipe();
    

  
  }
  editProcedure(id: any) {
    this.dataService.setFormIdVisitRegistration(id);
    this.stateService.onViewAssignmentProcedure();

  

   
  }



 



  closeNewConsult(): void {
    this.stateService.closeNewConsult();
  }
  onViewNewConsult(): void {
    this.stateService.onViewNewConsult();

  }

  onViewTriage(): void {
    this.stateService.onViewTriage();
  }

  formadate(): string {

    let dateVisit = new Date();
    let year = dateVisit.getFullYear();
    let month = (dateVisit.getMonth() + 1).toString().padStart(2, '0');
    let day = dateVisit.getDate().toString().padStart(2, '0');

    let formattedDate = `${year}-${month}-${day}`;
    return formattedDate;
  }

  onViewDisabledButtonVisit(): void {
    const formValue = {
      person: { id: this.dataService.getFormIdPerson() },
      dateVisit: this.formadate(),
      madeTriage: false,
      madeConsultation: false,
      madeRecipe: false,
      madeProcedure: false

    };
    this.stateService.setViewButtonNewConsult(true);


    this.visitRegistrationService.createVisitRegistration(formValue).subscribe({
      next: (data) => {
        console.log(data);
          
        if (data && 'id' in data) {
          this.dataService.setFormIdVisitRegistration(data.id);


          const formValueTriage = {
            visitRegistration: {id: this.dataService.getFormIdVisitRegistration()},
            heartRate: null,
            breathingFrequency: null,
            bloodPressure: null,
            bodyTemperature: null,
            oxygenSaturation: null,
            conscienceLevel: "",
            glasgowEyeOpening:null,
            glasgowVerbalResponse:null,
            glasgowMotorResponse:null
          };
          console.log(formValueTriage);
      
          this.triageService.createTriage(formValueTriage).subscribe({
            next: (data) => {
              console.log("Triage",data);
            }
          });

          const formValueConsultation = {
            visitRegistration: {id: this.dataService.getFormIdVisitRegistration()},
            dateVisit: "",
            summaryReason: "",
            detailReason: "",
            cide10: "",
            diagnosis: ""
          };
          console.log(formValueConsultation);

          this.consultationService.createConsultation(formValueConsultation).subscribe({
            next: (data) => {
              console.log("Consultation",data);
            }
          });


          const formValueRecipe = {
            visitRegistration: {id: this.dataService.getFormIdVisitRegistration()},
            recipeDetail: ""
          };
          this.recipeService.createRecipe(formValueRecipe).subscribe({
            next: (data) => {
              console.log("Recipe",data);
            }
          });


          const formValueProcedure= {
            visitRegistration: {id: this.dataService.getFormIdVisitRegistration()},
            treatment: "",
            additionalDetails: ""
          };
          this.procedureService.createProcedure(formValueProcedure).subscribe({
            next: (data) => {
              console.log("Procedure",data);
            }
          });





        }

        








      },
      error: (error) => {
        console.error('Error fetching workers', error);
      }
    });
    
  }

  refresh(): void {
    //this.loadInitialData();
    this.consultationService.fetchConsultations();




  }

  closeTriage(): void {
    this.stateService.closeTriage();
  }
  closeNewRecipe(): void {
    this.stateService.closeNewRecipe();
  }


  closeEditConsultation(): void {
    this.stateService.closeViewEditConsultation();
  }
  
  closeAssignmentProcedure(): void {
    this.stateService.closeAssignmentProcedure();
  }
}

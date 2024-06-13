import { Component, OnInit } from '@angular/core';
import { NzTypographyComponent } from "ng-zorro-antd/typography";
import { NzInputDirective } from "ng-zorro-antd/input";
import {
  FormControl,
  FormGroup,
  FormRecord,
  FormsModule,
  NonNullableFormBuilder,
  ReactiveFormsModule
} from "@angular/forms";
import { NgClass, NgForOf, NgIf, UpperCasePipe } from "@angular/common";
import { NzEmptyComponent } from "ng-zorro-antd/empty";
import { NzColDirective, NzRowDirective } from "ng-zorro-antd/grid";
import { NzFormDirective, NzFormLabelComponent } from "ng-zorro-antd/form";
import { NzButtonComponent } from "ng-zorro-antd/button";
import { NzIconDirective } from "ng-zorro-antd/icon";
import { NzTableComponent } from "ng-zorro-antd/table";
import { NzDividerComponent } from "ng-zorro-antd/divider";
import { NzOptionComponent, NzSelectComponent } from "ng-zorro-antd/select";
import { NzFlexDirective } from "ng-zorro-antd/flex";
import { PersonalDetailComponentComponent } from '../personal-detail-component/personal-detail-component.component';
import { RegisterNewPersonComponent } from '../register-new-person/register-new-person.component';
import Person from '../../../../shared/interfaces/User';
import { PersonService } from '../../../../services/person-service/person.service';
import { AuthService } from '../../../../services/auth-service/auth.service';
import { StateService } from '../../../../services/state-service/state.service';
import { DataService } from '../../../../services/data-service/data.service';
import { OPCIONES_DEPARTAMENTOS } from '../../../../shared/interfaces/Dependences';
import { OPCIONES_GENEROS } from '../../../../shared/interfaces/Genders';
import { OPCIONES_TIPO_DOCUMENTO } from '../../../../shared/interfaces/TypeDocument';
import { VisitRegistrationService } from '../../../../services/visit-registration-service/visit.registration.service';
@Component({
  selector: 'app-rel-personal-component',
  standalone: true,
  imports: [
    NzTypographyComponent,
    NzInputDirective,
    FormsModule,
    NgIf,
    NzEmptyComponent,
    ReactiveFormsModule,
    NzRowDirective,
    NzColDirective,
    NzFormLabelComponent,
    NzButtonComponent,
    NzIconDirective,
    NzTableComponent,
    NzDividerComponent,
    NgForOf,
    NzOptionComponent,
    NzSelectComponent,
    NzFormDirective,
    NgClass,
    UpperCasePipe,
    NzFlexDirective,
    PersonalDetailComponentComponent,
    RegisterNewPersonComponent
  ],
  templateUrl: './rel-personal-component.component.html',
  styleUrl: './rel-personal-component.component.css'
})
export class RelPersonalComponentComponent implements OnInit {
  searchForm: FormGroup;

  dependencies=[
    'TODOS',
    ...OPCIONES_DEPARTAMENTOS.map(dep => dep.nombre),
  ];

  hasResults = false;

  personalData: any[] = [];
  filteredPersonalData: any[] = [];
  currentPlace2: any[] = [];

  showNewPerson = false;

  detalleData: any;


  personData: any[] = [];


  ngOnInit() {
    
    this.personService.getAllPersons().subscribe({
      next: (data: any[]) => {
       
        this.personData = data.map(person => ({
          ...person,
          typeDocument: this.getDocumentName(person.typeDocument),
          gender: this.getGenderName(person.gender),
          dependence: this.getDependenceName(person.dependence),
        }));
        console.log('Person data', this.personData);
      },
      error: (error) => {
        console.error('Error fetching workers', error);
      }
    });

    this.authService.fetchUserDetails().subscribe(user => {
      console.log('User details', user);
      this.dataService.setFormIdUser(user.id);
      console.log('User:', this.dataService.getFormIdUser());
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

  constructor(private fb: NonNullableFormBuilder, private personService: PersonService,
    private authService: AuthService, public stateService: StateService,
    private dataService: DataService,private visitRegistrationService: VisitRegistrationService) {

    this.searchForm = this.fb.group({
      position: [''],
      document: [''],
      dependence: ['']
    });




  }

  onSearch(): void {

    const position = this.searchForm.get('position')?.value.trim().toLowerCase();
    const namesDNI = this.searchForm.get('document')?.value.trim().toLowerCase();
    const dependence = this.searchForm.get('dependence')?.value;

    if (position === 'TODOS' || namesDNI === 'TODOS' || dependence === 'TODOS') {
      this.filteredPersonalData = this.personData;
      this.hasResults = true;
    } else {
      //      if (position || namesDNI || (dependence && dependence !== 'NINGUNO')) {

      if (position || namesDNI || dependence) {
        this.filteredPersonalData = this.personData.filter(person => {
          const matchesPosition = position ? this.matchExactWords(person.position, position) : true;
          const matchesNamesDNI = namesDNI ? (this.matchExactWords(person.names, namesDNI) || this.matchExactWords(person.document, namesDNI)) : true;
          const matchesDependence = dependence ? this.matchExactWords(person.dependence, dependence) : true;

          return matchesPosition && matchesNamesDNI && matchesDependence;
        });
        this.hasResults = this.filteredPersonalData.length > 0;
      } else {
        this.filteredPersonalData = [];
        this.hasResults = false;
      }
    }
  }

  private matchExactWords(text: string, searchText: string): boolean {
    const searchWords = searchText.trim().toLowerCase().split(/\s+/);
    const textWords = text.toLowerCase().split(/\s+/);

    return searchWords.every(word => textWords.includes(word));
  }



  onReset(): void {
    this.searchForm.reset({ cargo: '', nombresDNI: '', centro: '' });
    this.filteredPersonalData = [];
    this.hasResults = false;
  }

  onViewDetail(id: any): void {
    this.dataService.setFormIdPerson(id);

    this.stateService.onViewPersonDetail();
  }

  onViewRegisterNewPerson(): void {
    this.stateService.onViewNewPerson();

  }

  closePersonDetail(): void {
    this.dataService.setHasResults(true);
    this.dataService.setLoader(true);
    this.stateService.closeViewButtonNewConsult();
    this.stateService.closePersonDetail();
  }
  closeNewPerson(): void {
    this.stateService.closeNewPerson();
  }
  protected readonly top = top;
}

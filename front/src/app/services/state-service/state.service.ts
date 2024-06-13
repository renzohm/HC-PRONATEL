import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class StateService {
  showPersonDetail = false;
  showNewPerson = false;
  showNewConsult = false;
  showTriage = false;
  showNewRecipe = false;
  showAssignmentProcedure = false;
  showViewButtonNewConsult = false;

  showViewEditConsultation=false;


  constructor() { }

  onViewEditConsultation(): void {
    this.showViewEditConsultation = true;
  }
  closeViewEditConsultation(): void {
    this.showViewEditConsultation = false;
  }
  getViewEditConsultation(): boolean {
    return this.showViewEditConsultation;
  }

  setViewButtonNewConsult(aux:any): void 
  {
    this.showViewButtonNewConsult = aux;
  }
  onViewButtonNewConsult(): void {
    this.showViewButtonNewConsult = true;
  }
  closeViewButtonNewConsult(): void {
    this.showViewButtonNewConsult = false;
  }
  getViewButtonNewConsult(): boolean {
    return this.showViewButtonNewConsult;
  }
  onViewAssignmentProcedure(): void {
    this.showAssignmentProcedure = true;
  }
  closeAssignmentProcedure(): void {
    this.showAssignmentProcedure = false;
  }
  getAssignmentProcedure(): boolean {
    return this.showAssignmentProcedure;
  }

  onViewNewRecipe(): void {
    this.showNewRecipe = true;
  }
  closeNewRecipe(): void {
    this.showNewRecipe = false;
  }
  getNewRecipe(): boolean {
    return this.showNewRecipe;
  }

  onViewTriage(): void {
    this.showTriage = true;
  }
  closeTriage(): void {
    this.showTriage = false;
  }
  getTriage(): boolean {
    return this.showTriage;
  }

  onViewNewConsult(): void {
    this.showNewConsult = true;
  }
  closeNewConsult(): void {
    this.showNewConsult = false;
  }
  getNewConsult(): boolean {
    return this.showNewConsult;
  }


  onViewPersonDetail(): void {
    this.showPersonDetail = true;
  }

  closePersonDetail(): void {
    this.showPersonDetail = false;

  }

  getPersonDetail(): boolean {
    return this.showPersonDetail;
  }

  getViewNewPerson(): boolean {
    return this.showNewPerson;
  }
  onViewNewPerson(): void {
    this.showNewPerson = true;
  }
  closeNewPerson(): void {
    this.showNewPerson = false;
  }



}

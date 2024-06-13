import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private formDataIdUser: any;

  private formDataConsult: any;
  private formDataRecipe: any;
  private formDataIdPerson: any;
  private formDataIdTriage: any;
  private formDataIdVisitRegistration: any;

  private formDataIdConsultation: any;


  private  hasResults = true;
  private  loading  = true;
  private formDataReason: any;

  constructor() { }

  setFormIdConsultation(id: any) {
    this.formDataIdConsultation = id;
  }

  getFormIdConsultation() {
    return this.formDataIdConsultation;
  }

  setFormIdUser(id: any) {
    this.formDataIdUser = id;
  }
  getFormIdUser() {
    return this.formDataIdUser;
  }

  setFormIdVisitRegistration(id: any) {
    this.formDataIdVisitRegistration = id;
  }

  getFormIdVisitRegistration() {
    return this.formDataIdVisitRegistration;
  }

  setFormDataReason(data: any) {
    this.formDataReason = data;
  }
  getFormDataReason() {
    return this.formDataReason;
  }

  setLoader(value: boolean) {
    this.loading = value;
  }
  getLoader() {
    return this.loading;
  }

  setHasResults(value: boolean) {
    this.hasResults = value;
  }
  getHasResults() {
    return this.hasResults;
  }


  setFormIdTriage(id: any) {
    this.formDataIdTriage = id;
  }

  getFormIdTriage() {
    return this.formDataIdTriage;
  }

  setFormIdPerson(id: any) {
    this.formDataIdPerson = id;
  }

  getFormIdPerson() {
    return this.formDataIdPerson;
  }

  setFormDataConsult(data: any) {
    this.formDataConsult = data;
  }

  getFormDataConsult() {
    return this.formDataConsult;
  }

  clearFormDataConsult() {
    this.formDataConsult = {};
  }


  setFormDataRecipe(data: any) {
    this.formDataRecipe = data;
  }

  getFormDataRecipe() {
    return this.formDataRecipe;
  }

  clearFormDataRecipe() {
    this.formDataRecipe = {};
  }


}

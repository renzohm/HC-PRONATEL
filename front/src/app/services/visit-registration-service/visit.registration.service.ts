import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Observable, catchError, pipe, retry, throwError } from 'rxjs';
import { environment } from '../../../environments/environment';
import Person from '../../shared/interfaces/User';
import { AuthService } from '../auth-service/auth.service';
import { DataService } from '../data-service/data.service';

@Injectable({
  providedIn: 'root'
})
export class VisitRegistrationService {
  base_Url: string = environment.baseURL;

  constructor(private http: HttpClient, private dataService: DataService) { }
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  }

  handleError(error: HttpErrorResponse) {
    if (error.error instanceof ErrorEvent) {
      console.log(
        `An error occurred ${error.status}, body was: ${error.error}`
      );
    } else {
      console.log(
        `Backend returned code ${error.status}, body was: ${error.error}`
      );
    }
    return throwError(
      'Something happened with request, please try again later.'
    );
  }

  //SE USA EN PERSONAL DETAIL COMPONENT
  createVisitRegistration(item: any) {
    return this.http.post(`${this.base_Url}/visitRegistrations`, JSON.stringify(item), this.httpOptions)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }

  getVisitRegistrationId(): Observable<any> {
    const visitRegistrationId = this.dataService.getFormIdVisitRegistration();
    return this.http
      .get(`${this.base_Url}/${visitRegistrationId}/visitRegistrations`)
      .pipe(retry(2), catchError(this.handleError));
  }

  putVisitRegistration(item: any) {
    const visitRegistrationId = this.dataService.getFormIdVisitRegistration();

    return this.http.put(`${this.base_Url}/visitRegistrations/${visitRegistrationId}`, JSON.stringify(item), this.httpOptions)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }

  getPersonConsultation(): Observable<any> {
    const personId = this.dataService.getFormIdPerson();
    return this.http
      .get(`${this.base_Url}/persons/${personId}/consultation`)
      .pipe(retry(2), catchError(this.handleError));
  }

  //SE USA EN PERSONAL DETAIL COMPONENT
  putMadeTriage(item: any) {
    const visitRegistrationId = this.dataService.getFormIdVisitRegistration();
    console.log(visitRegistrationId);
    return this.http.put(`${this.base_Url}/updateMadeTriage/${visitRegistrationId}`, JSON.stringify(item), this.httpOptions)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }

    //SE USA EN PERSONAL DETAIL COMPONENT
    putMadeRecipe(item: any) {
      const visitRegistrationId = this.dataService.getFormIdVisitRegistration();
      return this.http.put(`${this.base_Url}/updateMadeRecipe/${visitRegistrationId}`, JSON.stringify(item), this.httpOptions)
        .pipe(
          retry(2),
          catchError(this.handleError)
        );
    }

      //SE USA EN PERSONAL DETAIL COMPONENT
  putMadeConsultation(item: any) {
    const visitRegistrationId = this.dataService.getFormIdVisitRegistration();
    return this.http.put(`${this.base_Url}/updateMadeConsultation/${visitRegistrationId}`, JSON.stringify(item), this.httpOptions)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }

    //SE USA EN PERSONAL DETAIL COMPONENT
    putMadeProcedure(item: any) {
      const visitRegistrationId = this.dataService.getFormIdVisitRegistration();
      return this.http.put(`${this.base_Url}/updateMadeProcedure/${visitRegistrationId}`, JSON.stringify(item), this.httpOptions)
        .pipe(
          retry(2),
          catchError(this.handleError)
        );
    }



}

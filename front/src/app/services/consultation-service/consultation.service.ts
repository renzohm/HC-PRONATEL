import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Observable, catchError, pipe, retry, throwError, Subject, BehaviorSubject } from 'rxjs';
import { tap } from 'rxjs/operators';
import { DataService } from '../data-service/data.service';

@Injectable({
  providedIn: 'root'
})
export class ConsultationService {
  base_Url: string = environment.baseURL;
  public visitRegistrationsUpdated = new BehaviorSubject<any[]>([]);

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

  getAllConsultations(): Observable<any[]> {
    return this.visitRegistrationsUpdated.asObservable();
  }

    fetchConsultations() {
      const personId = this.dataService.getFormIdPerson();
      this.http.get<any[]>(`${this.base_Url}/persons/${personId}/visitRegistrations`).pipe(
          retry(2),
          catchError(this.handleError)
      ).subscribe({
          next: (data) => {
              this.visitRegistrationsUpdated.next(data);
              this.dataService.setHasResults(data.length > 0);   
              this.dataService.setLoader(false);
            },
          error: (error) => {
              console.error('Error fetching consultations', error);
              this.visitRegistrationsUpdated.next([]);
              this.dataService.setHasResults(false);  
              this.dataService.setLoader(false);

            }
      });
  }
  

  

  getPersonConsultationsId(): Observable<any> {
    const personId = this.dataService.getFormIdPerson();
    return this.http
      .get(`${this.base_Url}/persons/${personId}/consultations`)
      .pipe(retry(2), catchError(this.handleError));
  }

  createConsultation(item: any) {
    return this.http.post(`${this.base_Url}/consultations`, JSON.stringify(item), this.httpOptions)
    .pipe(
      
      retry(2),
      catchError(this.handleError)
    );
}


putVisitRegistration(item: any) {
  const visitRegistrationId = this.dataService.getFormIdVisitRegistration();
  console.log('Visit registration ID:', visitRegistrationId);
  return this.http.put(`${this.base_Url}/visitRegistrations/${visitRegistrationId}`, JSON.stringify(item), this.httpOptions)
  .pipe(
    retry(2),
    catchError(this.handleError)
  );




}


  createVisitRegistration(item: any) {
    return this.http.post(`${this.base_Url}/visitRegistrations`, JSON.stringify(item), this.httpOptions)
      .pipe(
        tap((newConsultation) => {
          this.visitRegistrationsUpdated.next([...this.visitRegistrationsUpdated.value, newConsultation]);
          //this.visitRegistrationsUpdated.next([newConsultation, ...this.visitRegistrationsUpdated.value]);
        }),
        retry(2),
        catchError(this.handleError)
      );
  }




  getConsultationId(): Observable<any> {
    const consultationId = this.dataService.getFormIdVisitRegistration();
    return this.http
      .get(`${this.base_Url}/${consultationId}/consultations`)
      .pipe(retry(2), catchError(this.handleError));
  }

  updateConsultation(item: any) {
    const visitID=this.dataService.getFormIdVisitRegistration()

    return this.http.put(`${this.base_Url}/consultations/${visitID}`, JSON.stringify(item), this.httpOptions)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }


    //Mediante el id del Visit registration obtengo la consulta
    getConsultationByVisitRegistrationId(item: any): Observable<any> {
    return this.http
      .get(`${this.base_Url}/consultations/${item}/visitRegistrations`)
      .pipe(retry(2), catchError(this.handleError));
  }


 


}

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
export class PersonService {

  base_Url: string = environment.baseURL;

  constructor(private http: HttpClient, private authService: AuthService,
    private dataService: DataService
  ) { }
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

  //SE USA
  createUser(item: any) {
    return this.http.post(`${this.base_Url}/persons`, JSON.stringify(item), this.httpOptions)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }
  //SE USA
  getAllPersons(): Observable<any> {
    return this.http
      .get(`${this.base_Url}/persons`)
      .pipe(retry(2), catchError(this.handleError));
  }
  //SE USA
  getPersonId(): Observable<any> {
    const personId = this.dataService.getFormIdPerson();
    return this.http
      .get(`${this.base_Url}/${personId}/persons`)
      .pipe(retry(2), catchError(this.handleError));
  }

}



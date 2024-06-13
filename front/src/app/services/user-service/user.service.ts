import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient, HttpHeaders, HttpErrorResponse, HttpParams } from '@angular/common/http';
import { Observable, catchError, pipe, retry, throwError } from 'rxjs';
import { DataService } from '../data-service/data.service';
@Injectable({
  providedIn: 'root'
})
export class UserService {

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


  createUser(item: any) {
    return this.http
      .post(`${this.base_Url}/users/register`, JSON.stringify(item), this.httpOptions)
      .pipe(retry(2), catchError(this.handleError));
  }

  getUsers(): Observable<any> {
    return this.http
      .get(`${this.base_Url}/users`)
      .pipe(retry(2), catchError(this.handleError));
  }
  getUserByEmailAndPassword(email: string, password: string) {
    return this.http.post<any>(`${this.base_Url}/users/login`, { email, password }, { observe: 'response' })
      .pipe(
        catchError(this.handleError)
      );
  }

  getUserId(): Observable<any> {
    const userId = this.dataService.getFormIdUser();
    return this.http
      .get(`${this.base_Url}/${userId}/users`)
      .pipe(retry(2), catchError(this.handleError));
  }

}

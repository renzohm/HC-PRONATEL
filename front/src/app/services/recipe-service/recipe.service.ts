import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Observable, catchError, pipe, retry, throwError } from 'rxjs';
import { DataService } from '../data-service/data.service';

@Injectable({
  providedIn: 'root'
})
export class RecipeService {
  base_Url: string = environment.baseURL;

  constructor(private http: HttpClient,private dataService:DataService) { }
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

  createRecipe(item: any) {
    return this.http.post(`${this.base_Url}/recipes`, JSON.stringify(item), this.httpOptions)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }

  getAllRecipes(): Observable<any> {
    return this.http
      .get(`${this.base_Url}/recipes`)
      .pipe(retry(2), catchError(this.handleError));
  }

  putRecipe(item: any) {
    const visitID=this.dataService.getFormIdVisitRegistration()
    return this.http.put(`${this.base_Url}/recipes/${visitID}`, JSON.stringify(item), this.httpOptions)
      .pipe(
        retry(2),
        catchError(this.handleError)
      );
  }

      //Mediante el id del Visit registration obtengo la receta
      getRecipeByVisitRegistrationId(item: any): Observable<any> {
        return this.http
          .get(`${this.base_Url}/recipes/${item}/visitRegistrations`)
          .pipe(retry(2), catchError(this.handleError));
      }
    
}

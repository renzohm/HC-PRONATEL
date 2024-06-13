import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import * as flatted from 'flatted';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  base_Url: string = environment.baseURL;

 

  private tokenKey = 'authToken';

  constructor(private http: HttpClient) { }


  setUser(token: string): void {
    sessionStorage.setItem(this.tokenKey, token);
  }
  fetchUserDetails(): Observable<any> {
    const token = this.getToken();
    const headers = new HttpHeaders().set("Authorization", `Bearer ${token}`);
    return this.http.get(`${this.base_Url}/users/me`, { headers: headers });
  }



  getToken() {
    return sessionStorage.getItem(this.tokenKey);
  }
  logout(): void {
    sessionStorage.removeItem(this.tokenKey);
  }


  isAuthenticated(): boolean {
    const token = this.getToken();
    return !!token;
  }

}

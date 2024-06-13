import { Component } from '@angular/core';
import { NzFlexDirective } from "ng-zorro-antd/flex";
import { NzRadioComponent, NzRadioGroupComponent } from "ng-zorro-antd/radio";
import {
  FormControl,
  FormBuilder,
  FormGroup,
  FormsModule,

  NonNullableFormBuilder,
  ReactiveFormsModule,
  Validators
} from "@angular/forms";
import {
  NzLayoutComponent,
} from "ng-zorro-antd/layout";
import { NzFormControlComponent, NzFormDirective, NzFormItemComponent } from "ng-zorro-antd/form";
import { NzInputDirective, NzInputGroupComponent } from "ng-zorro-antd/input";
import { NzColDirective, NzRowDirective } from "ng-zorro-antd/grid";
import { NzButtonComponent } from "ng-zorro-antd/button";
import { NzCheckboxComponent } from "ng-zorro-antd/checkbox";
import { NzTypographyComponent } from "ng-zorro-antd/typography";
import { NzDividerComponent } from "ng-zorro-antd/divider";
import { NzIconDirective } from "ng-zorro-antd/icon";
import { Router } from "@angular/router";
import { UserService } from "../../services/user-service/user.service";
import { AuthService } from "../../services/auth-service/auth.service";
import { DataService } from '../../services/data-service/data.service';
@Component({
  selector: 'app-login-page',
  standalone: true,
  imports: [
    NzFlexDirective,
    NzRadioGroupComponent,
    FormsModule,
    NzRadioComponent,
    ReactiveFormsModule,
    NzFormItemComponent,
    NzFormControlComponent,
    NzInputGroupComponent,
    NzColDirective,
    NzButtonComponent,
    NzFormDirective,
    NzCheckboxComponent,
    NzRowDirective,
    NzInputDirective,
    NzTypographyComponent,
    NzDividerComponent,
    NzIconDirective,
    NzLayoutComponent

  ],
  templateUrl: './login-page.component.html',
  styleUrl: './login-page.component.css'
})
export class LoginPageComponent {
  passwordVisible = false;
  validateForm!: FormGroup;

  fakeUser = {
    email: 'lucas.hernandez@hotmail.com',
    password: 'lucas123'
  };

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private userService: UserService,
    private authService: AuthService,
    private dataService:DataService
  ) {

  }
  currentUser: any;

  ngOnInit() {
    this.authService.logout();
    this.validateForm = this.fb.group({
      email: ['', [Validators.required]],
      password: ['', [Validators.required]],

    })
  }

  submitForm(): void {
    if (!this.validateForm.valid) {
      this.markFormGroupAsDirty(this.validateForm);
      return;
    }

    const { email, password } = this.validateForm.value;


    const fullEmail = email.trim() + '@hotmail.com';
    this.userService.getUserByEmailAndPassword(fullEmail, password).subscribe(response => {
      if (response && response.body && response.body.token) {
        const token = response.body.token;
        this.authService.setUser(token);
        this.authService.fetchUserDetails().subscribe(user => {
          this.currentUser = user;
          console.log('User details', user);
          this.dataService.setFormIdUser(this.currentUser.id);
          console.log('User:', this.dataService.getFormIdUser());
          this.router.navigate(['/dashboard']);
        }, error => {
          console.error('Failed to fetch user details', error);
        });
      } else {
        console.error('Login failed');
      }
    }, error => {
      alert('Credenciales incorrectas');
      console.error('Login error', error);
    });



  }

  markFormGroupAsDirty(formGroup: FormGroup): void {
    Object.keys(formGroup.controls).forEach(key => {
      const control = formGroup.get(key);
      if (control instanceof FormGroup) {
        this.markFormGroupAsDirty(control);
      } else {
        control?.markAsDirty();
        control?.updateValueAndValidity();
      }
    });
  }

}

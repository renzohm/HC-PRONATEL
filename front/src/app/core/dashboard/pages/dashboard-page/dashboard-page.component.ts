import { Component, OnInit } from '@angular/core';
import { NzFlexDirective } from "ng-zorro-antd/flex";
import { NzTypographyComponent } from "ng-zorro-antd/typography";
import {
  NzContentComponent,
  NzFooterComponent,
  NzHeaderComponent,
  NzLayoutComponent,
  NzSiderComponent,
} from "ng-zorro-antd/layout";
import { NzMenuModule } from 'ng-zorro-antd/menu';
import { NzMenuDirective, NzMenuItemComponent } from "ng-zorro-antd/menu";
import { NzIconDirective } from "ng-zorro-antd/icon";
import { Router, RouterLink, RouterOutlet } from "@angular/router";
import { RouterModule } from '@angular/router';
import { AuthService } from '../../../../services/auth-service/auth.service';
@Component({
  selector: 'app-dashboard-page',
  standalone: true,
  imports: [
    NzFlexDirective,
    NzTypographyComponent,
    NzSiderComponent,
    NzLayoutComponent,
    NzHeaderComponent,
    NzContentComponent,
    NzFooterComponent,
    NzMenuDirective,
    NzMenuItemComponent,
    NzIconDirective,
    RouterLink,
    RouterOutlet,
    NzMenuModule,
    RouterModule
  ],
  templateUrl: './dashboard-page.component.html',
  styleUrl: './dashboard-page.component.css'
})
export class DashboardPageComponent implements OnInit {

  constructor(private router: Router, private authService: AuthService) { }

  ngOnInit(): void {


  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/']);
  }

}

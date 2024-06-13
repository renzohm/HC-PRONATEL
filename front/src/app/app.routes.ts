import { Routes } from '@angular/router';
import { AuthguardService } from './services/authguard-service/authguard.service';

export const routes: Routes = [
  {
    path: '',
    loadComponent: () => import ('./core/login-page/login-page.component').then(value => value.LoginPageComponent)
  },
  {
    path: 'dashboard',
    title: 'Sistema HC',
    canActivate: [AuthguardService], 
    loadComponent: () => import('./core/dashboard/pages/dashboard-page/dashboard-page.component').then(value => value.DashboardPageComponent),
    children: [
      {
        path: '',
        redirectTo: 'rel-personal',
        pathMatch: 'full'
      },
      {
        path: 'rel-personal',
        loadComponent: () => import('./core/dashboard/components/rel-personal-component/rel-personal-component.component').then(value => value.RelPersonalComponentComponent)

      },
      {
        path: 'asist-admin',
        loadComponent: () => import('./core/dashboard/components/asist-admin-component/asist-admin-component.component').then(value => value.AsistAdminComponentComponent)
      },
      {
        path: 'soporte-tecnico',
        loadComponent: () => import('./core/dashboard/components/support-tech-component/support-tech-component.component').then(value => value.SupportTechComponentComponent)
      }
    ]
  }
];

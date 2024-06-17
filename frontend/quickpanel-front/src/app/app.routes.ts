import { Routes } from '@angular/router';
import { BannerComponent } from "./components/index/banner/banner.component";
import { LoginComponent } from "./components/login/login.component"; // Importe o LoginComponent
import { IndexComponent } from './components/dashboard/index/index.component';
import { PersonalizarComponent } from './components/dashboard/personalizar/personalizar.component';

export const routes: Routes = [
  {
    path: '', // Rota para a página inicial
    component: BannerComponent
  },
  {
    path: 'login', // Rota para a página de login
    component: LoginComponent
  },
  {
    path: 'dashboard', // Rota para a página do dashboard
    component: IndexComponent
  },
  {
    path: 'dashboard/personalizar', // Rota para personalizar o site
    component: PersonalizarComponent
  },
];
import { Routes } from '@angular/router';
import { BannerComponent } from "./components/index/banner/banner.component";
import { LoginComponent } from "./components/login/login.component"; // Importe o LoginComponent

export const routes: Routes = [
  {
    path: '', // Rota para a página inicial
    component: BannerComponent
  },
  {
    path: 'login', // Rota para a página de login
    component: LoginComponent
  }
];
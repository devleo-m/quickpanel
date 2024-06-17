import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChangeDetectorRef } from '@angular/core';


@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule], // Importe CommonModule aqui
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent {
  showLogin: boolean = true;

  constructor(private cdr: ChangeDetectorRef) {} // Certifique-se de que ChangeDetectorRef está importado

  toggleForm() {
    this.showLogin = !this.showLogin;
    this.cdr.detectChanges(); // Força a detecção de mudanças
  }
}

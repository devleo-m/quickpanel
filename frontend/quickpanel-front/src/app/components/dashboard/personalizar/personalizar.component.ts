import { Component } from '@angular/core';
import { MenuComponent } from '../menu/menu.component';

@Component({
  selector: 'app-personalizar',
  standalone: true,
  imports: [
    MenuComponent
  ],
  templateUrl: './personalizar.component.html',
  styleUrl: './personalizar.component.scss'
})
export class PersonalizarComponent {

}

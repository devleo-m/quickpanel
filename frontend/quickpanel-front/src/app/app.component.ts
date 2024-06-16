import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { MenuComponent } from './menu/menu.component';
import { BannerComponent } from './banner/banner.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
    RouterOutlet, MenuComponent, BannerComponent
  ],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'quickpanel-front';
}

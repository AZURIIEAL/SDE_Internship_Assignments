import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
    <main>
      <header class="brand-name">
        <img
          class="brand-logo"
          src="/assets/logo.svg"
          alt="logo"
          aria-hidden="true"
        />
      </header>
      <section>
        <app-home></app-home>
      </section>
    </main>
  `,
  styleUrls: ['./app.component.sass'],
})
export class AppComponent {
  title = 'Test';
}

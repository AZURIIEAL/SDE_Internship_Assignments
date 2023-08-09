import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EmpTableComponent } from './emp-table/emp-table.component';
import { EmpDetailComponent } from './emp-detail/emp-detail.component';

@NgModule({
  declarations: [
    AppComponent,
    EmpTableComponent,
    EmpDetailComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

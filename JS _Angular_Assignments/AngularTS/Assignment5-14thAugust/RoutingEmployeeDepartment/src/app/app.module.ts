import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EmployeeHomeComponent } from './components/employee-home/employee-home.component';
import { DepartmentHomeComponent } from './components/department-home/department-home.component';
import { HomeComponent } from './components/home/home.component';
import { EmployeeDetailsComponent } from './components/employee-details/employee-details.component';
import { DepartmentDetailsComponent } from './components/department-details/department-details.component';

@NgModule({
  declarations: [
    AppComponent,
    EmployeeHomeComponent,
    DepartmentHomeComponent,
    HomeComponent,
    EmployeeDetailsComponent,
    DepartmentDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

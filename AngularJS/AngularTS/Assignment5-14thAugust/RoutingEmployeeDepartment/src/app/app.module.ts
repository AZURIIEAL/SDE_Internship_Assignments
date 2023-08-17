import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { DepartmentModule } from './components/department/department.module';
import { EmployeeModule } from './components/employee/employee.module';
import { AppComponent } from './app.component';

import { HomeComponent } from './components/home/home.component';

@NgModule({
  declarations: [AppComponent, HomeComponent],
  imports: [BrowserModule, AppRoutingModule, DepartmentModule,EmployeeModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}

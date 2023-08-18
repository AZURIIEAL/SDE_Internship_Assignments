import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EmployeeHomeComponent } from './employee-home/employee-home.component';
import { EmployeeDetailsComponent } from './employee-details/employee-details.component';
import { SearchComponent } from '../search/search.component';
import { AddEmployeeComponent } from './add-employee/add-employee.component';
import { FormsModule,ReactiveFormsModule  } from '@angular/forms'

@NgModule({
  declarations: [EmployeeHomeComponent, EmployeeDetailsComponent, AddEmployeeComponent],
  imports: [CommonModule, SearchComponent,FormsModule,ReactiveFormsModule],
  exports: [EmployeeHomeComponent, EmployeeDetailsComponent],
})
export class EmployeeModule {}

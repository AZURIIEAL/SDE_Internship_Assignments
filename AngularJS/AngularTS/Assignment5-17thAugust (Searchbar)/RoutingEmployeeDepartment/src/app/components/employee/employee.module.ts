import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EmployeeHomeComponent } from './employee-home/employee-home.component';
import { EmployeeDetailsComponent } from './employee-details/employee-details.component';
import { SearchComponent } from '../search/search.component';

@NgModule({
  declarations: [EmployeeHomeComponent, EmployeeDetailsComponent],
  imports: [CommonModule, SearchComponent],
  exports: [EmployeeHomeComponent, EmployeeDetailsComponent],
})
export class EmployeeModule {}

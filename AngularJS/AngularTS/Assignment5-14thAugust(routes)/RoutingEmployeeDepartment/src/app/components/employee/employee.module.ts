import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EmployeeHomeComponent } from './employee-home/employee-home.component';
import { EmployeeDetailsComponent } from './employee-details/employee-details.component';

@NgModule({
  declarations: [EmployeeHomeComponent, EmployeeDetailsComponent],
  imports: [CommonModule],
  exports: [EmployeeHomeComponent, EmployeeDetailsComponent],
})
export class EmployeeModule {}

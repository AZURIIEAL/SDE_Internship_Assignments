import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DepartmentHomeComponent } from './department-home/department-home.component';
import { DepartmentDetailsComponent } from './department-details/department-details.component';

@NgModule({
  declarations: [DepartmentHomeComponent, DepartmentDetailsComponent],
  imports: [CommonModule],
  exports: [DepartmentHomeComponent, DepartmentDetailsComponent],
})
export class DepartmentModule {}

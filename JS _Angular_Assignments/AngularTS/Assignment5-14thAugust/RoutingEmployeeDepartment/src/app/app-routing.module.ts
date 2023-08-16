import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { EmployeeHomeComponent } from './components/employee-home/employee-home.component';
import { DepartmentHomeComponent } from './components/department-home/department-home.component';
import { EmployeeDetailsComponent } from './components/employee-details/employee-details.component';
import { AddEmployeeComponent } from './components/employee-home/add-employee/add-employee.component';

const routes: Routes = [
  {
    //Hence my default route will be the home component.
    path: '',
    component: HomeComponent,
    title: 'Home page',
  },
  {
    path: 'EmployeeHome',
    component: EmployeeHomeComponent,
    title: 'Employee Home page',
  },
  {
    path: 'EmployeeDetails/:id',
    component: EmployeeDetailsComponent,
    title :'Employee Details'
  },
  {
    path: 'DepartmentHome',
    component: DepartmentHomeComponent,
    title: 'Department Home page',
  },
  {
    path: 'add-employee',
    component: AddEmployeeComponent
  }
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}

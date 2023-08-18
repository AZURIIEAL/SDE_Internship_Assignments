import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { EmployeeHomeComponent } from './components/employee/employee-home/employee-home.component';
import { DepartmentHomeComponent } from './components/department/department-home/department-home.component';
import { EmployeeDetailsComponent } from './components/employee/employee-details/employee-details.component';
import { AddEmployeeComponent } from './components/employee/add-employee/add-employee.component';

const routes: Routes = [
  {
    //Hence my default route will be the home component.
    path: '',
    component: HomeComponent,
    title: 'Home page',
  },
  {
    path: 'employee-home',
    component: EmployeeHomeComponent,
    title: 'Employee Home page',
  },
  {
    path: 'employee-details/:id',
    component: EmployeeDetailsComponent,
    title :'Employee Details'
  },
  {
    path: 'department-home',
    component: DepartmentHomeComponent,
    title: 'Department Home page',
  },
  {
    path:'add-employee',
    component : AddEmployeeComponent,
    title:'Add new employee'
  }
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}

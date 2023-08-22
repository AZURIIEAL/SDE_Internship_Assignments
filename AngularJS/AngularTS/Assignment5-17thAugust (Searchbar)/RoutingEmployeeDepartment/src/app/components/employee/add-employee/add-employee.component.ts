import { Component } from '@angular/core';
import { EmployeeDataService } from '../../../services/employee-data-service.service';
import { IaddEmp } from 'src/app/interfaces/iadd-emp';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-employee',
  templateUrl: './add-employee.component.html',
  styleUrls: ['./add-employee.component.sass'],
})
export class AddEmployeeComponent {
  newEmployee: IaddEmp = {
    FirstName: '',
    LastName: '',
    Email: '',
    PhoneNumber: '',
    DepartmentId: 0,
  };

  constructor(
    private employeeDataService: EmployeeDataService,
    private router: Router
  ) {
    const newEmployee: IaddEmp = {
      FirstName: '',
      LastName: '',
      Email: '',
      PhoneNumber: '',
      DepartmentId: 0,
    };
  }
  addEmpForm = new FormGroup({
    firstName: new FormControl('', [
      Validators.required,
      Validators.minLength(2),
    ]),
    lastName: new FormControl('', [
      Validators.required,
      Validators.minLength(2),
    ]),
    email: new FormControl('', [Validators.required, Validators.email]),
    phoneNumber: new FormControl('', [
      Validators.required,
      Validators.pattern('[0-9]{10}'),
    ]),
    departmentId: new FormControl('', [Validators.required, Validators.min(1)]),
  });
  onSubmit(): void {
    if (this.addEmpForm.valid) {
      const formValues = this.addEmpForm.value;

      const newEmployee1: IaddEmp = {
        FirstName: formValues.firstName || '',
        LastName: formValues.lastName || '',
        Email: formValues.email || '',
        PhoneNumber: formValues.phoneNumber || '',
        DepartmentId: Number(formValues.departmentId) || 0,
      };

      this.newEmployee.FirstName = newEmployee1.FirstName;
      this.newEmployee.LastName = newEmployee1.LastName;
      this.newEmployee.Email = newEmployee1.Email;
      this.newEmployee.PhoneNumber = newEmployee1.PhoneNumber;
      this.newEmployee.DepartmentId = newEmployee1.DepartmentId;
    }
    this.employeeDataService
      .addEmployee(this.newEmployee)
      .subscribe((response) => {
        console.log('Employee added successfully', response);
        this.router.navigate(['employee-home']);
      });
  }
}

import { Component } from '@angular/core';
import { EmployeeDataService } from '../../../services/employee-data-service.service'; 
import { IaddEmp } from 'src/app/interfaces/iadd-emp';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-add-employee',
  templateUrl: './add-employee.component.html',
  styleUrls: ['./add-employee.component.sass'],
})
export class AddEmployeeComponent {

  newEmployee: IaddEmp = {
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: '',
    departmentId: 0,
  };

  constructor(private employeeDataService: EmployeeDataService) {} 
  addEmpForm = new FormGroup({
    firstName: new FormControl('', [Validators.required, Validators.minLength(2)]),
    lastName: new FormControl('', [Validators.required, Validators.minLength(2)]),
    email: new FormControl('', [Validators.required, Validators.email]),
    phoneNumber: new FormControl('', [Validators.required, Validators.pattern('[0-9]{10}')]),
    departmentId: new FormControl('', [Validators.required, Validators.min(1)]),
  });

  onSubmit(): void {
    
  }
}

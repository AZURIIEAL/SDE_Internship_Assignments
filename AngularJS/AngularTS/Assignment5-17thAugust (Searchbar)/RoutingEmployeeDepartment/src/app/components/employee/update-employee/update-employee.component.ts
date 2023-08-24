import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { EmpData } from 'src/app/interfaces/emp-data';
import { IaddEmp } from 'src/app/interfaces/iadd-emp';
import { EmployeeDataService } from 'src/app/services/employee-data-service.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-update-employee',
  templateUrl: './update-employee.component.html',
  styleUrls: ['./update-employee.component.sass'],
})
export class UpdateEmployeeComponent implements OnInit {
  empDetails = this.employeeDataService.getData();
  employeeDetail: EmpData | undefined;
  id!: number;
  newEmployee: IaddEmp = {
    FirstName: '',
    LastName: '',
    Email: '',
    PhoneNumber: '',
    DepartmentId: 0,
  };

  constructor(
    private employeeDataService: EmployeeDataService,
    private router: Router,
    private activatedRoute: ActivatedRoute
  ) {
    const newEmployee: IaddEmp = {
      FirstName: '',
      LastName: '',
      Email: '',
      PhoneNumber: '',
      DepartmentId: 0,
    };
  }
  ngOnInit(): void {
    this.activatedRoute.params.subscribe((params) => {
      this.id = Number(params['id']);
      this.employeeDataService.getData().subscribe((empDetails: EmpData[]) => {
        this.employeeDetail = empDetails.find((emp) => emp.id === this.id);
      });
    });
  }
  populateFormWithEmployeeData(): void {
    if (this.employeeDetail) {
      this.addEmpForm.patchValue({
        firstName: this.employeeDetail.firstName,
        lastName: this.employeeDetail.lastName,
        email: this.employeeDetail.email,
        phoneNumber: this.employeeDetail.phoneNumber,
        departmentId: this.employeeDetail.departmentId.toString(),
      });
    }
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
      .updateEmployee(this.newEmployee,this.id)
      .subscribe((response) => {
        console.log('Employee Updated successfully', response);
        this.router.navigate(['employee-home']);
      });
  }
}
 
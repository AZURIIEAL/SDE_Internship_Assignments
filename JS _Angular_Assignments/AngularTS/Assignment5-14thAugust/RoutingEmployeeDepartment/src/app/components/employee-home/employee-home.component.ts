import { Component, ViewChild } from '@angular/core';
import { EmpData } from '../../interfaces/emp-data';
import { EmployeeDataService } from '../../services/employee-data-service.service';
import { Router } from '@angular/router';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-employee-home',
  templateUrl: './employee-home.component.html',
  styleUrls: ['./employee-home.component.sass'],
})
export class EmployeeHomeComponent {
  constructor(
    private router: Router,
    private empService: EmployeeDataService
  ) {}
  employeeList: Array<EmpData> = this.empService.getData();
  public searchText: string = 'Hi';
  @ViewChild('frm') public userFrm!: NgForm;

  GetDataFunction(emp: EmpData) {
    //Route becomes Employeedetails/id
    this.router.navigate(['EmployeeDetails', emp.id])
  }

  onSearch() {
    console.log(this.searchText);
    console.log(this.userFrm);
  }

  addEmployee() {
    this.router.navigate(['add-employee']);
  }

  reset() {
    this.searchText = ''
  }
}

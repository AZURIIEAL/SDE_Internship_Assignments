import { Component } from '@angular/core';
import { IEmpData } from '../emp-data';
import { Router } from '@angular/router';
import { EmpService } from '../emp.service';

@Component({
  selector: 'app-emp-table',
  templateUrl: './emp-table.component.html',
  styleUrls: ['./emp-table.component.sass']
})
export class EmpTableComponent {
  constructor(private router: Router, private empService: EmpService) {

  }
  employeeList = this.empService.getData();

  selectedEmployeeDetail: IEmpData | undefined;

  GetDataFunction(emp: IEmpData) {
    // this.selectedEmployeeDetail = emp;
    this.router.navigate(['list', emp.id])
  }
}
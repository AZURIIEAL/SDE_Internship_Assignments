import { Component } from '@angular/core';
import { IEmpData } from '../emp-data';

@Component({
  selector: 'app-emp-table',
  templateUrl: './emp-table.component.html',
  styleUrls: ['./emp-table.component.sass']
})
export class EmpTableComponent {
  employeeList: IEmpData[] = [
    {
      id: 1,
      firstName: "Abin",
      lastName: "Binu",
      age: 21,
      department: "Development",
      position: "Junior"
    },
    {
      id: 2,
      firstName: "Xavier",
      lastName: "George",
      age: 32,
      department: "HR",
      position: "Senior"
    },
    {
      id: 3,
      firstName: "Alex",
      lastName: "Mathew",
      age: 28,
      department: "Development",
      position: "Senior"
    },
    {
      id: 4,
      firstName: "Revathy",
      lastName: "Prabhu",
      age: 21,
      department: "HR",
      position: "Trainee"
    },
    // Add more employee data as needed
  ];

  selectedEmployeeDetail?: IEmpData ;

  GetDataFunction(emp: IEmpData) {
    this.selectedEmployeeDetail = emp;
  }
}
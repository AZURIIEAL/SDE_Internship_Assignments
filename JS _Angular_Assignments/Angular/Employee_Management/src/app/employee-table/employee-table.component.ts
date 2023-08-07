import { Component } from '@angular/core';

interface Employee {
  firstName: string;
  lastName: string;
  dateOfBirth: string;
  age: number;
  joiningDate: string;
  country: string;
}

@Component({
  selector: 'app-employee-table',
  templateUrl: './employee-table.component.html',
  styleUrls: ['./employee-table.component.css']
})
export class EmployeeTableComponent {
  employees: Employee[] = [
    {
      firstName: 'John',
      lastName: 'Doe',
      dateOfBirth: '1990-05-15',
      age: 33,
      joiningDate: '2020-02-01',
      country: 'United States'
    },
    {
      firstName: 'Jane',
      lastName: 'Smith',
      dateOfBirth: '1988-09-21',
      age: 35,
      joiningDate: '2019-07-10',
      country: 'Canada'
    },
    {
      firstName: 'Michael',
      lastName: 'Johnson',
      dateOfBirth: '1992-12-05',
      age: 31,
      joiningDate: '2021-03-15',
      country: 'United Kingdom'
    },
    {
      firstName: 'Emily',
      lastName: 'Brown',
      dateOfBirth: '1985-11-02',
      age: 37,
      joiningDate: '2018-01-20',
      country: 'Australia'
    },
    {
      firstName: 'Robert',
      lastName: 'Lee',
      dateOfBirth: '1995-06-30',
      age: 28,
      joiningDate: '2022-05-02',
      country: 'Germany'
    }
  ];
}

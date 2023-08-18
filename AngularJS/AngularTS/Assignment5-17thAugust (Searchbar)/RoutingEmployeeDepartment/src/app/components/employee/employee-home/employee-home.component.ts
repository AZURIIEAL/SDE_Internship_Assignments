import { Component, OnInit } from '@angular/core';
import { EmpData } from '../../../interfaces/emp-data';
import { EmployeeDataService } from '../../../services/employee-data-service.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-employee-home',
  templateUrl: './employee-home.component.html',
  styleUrls: ['./employee-home.component.sass'],
})
export class EmployeeHomeComponent implements OnInit {
  constructor(
    private router: Router,
    private empService: EmployeeDataService
  ) {}

  employeeList: Array<EmpData> = [];

  GetDataFunction(emp: EmpData) {
    //Route becomes Employeedetails/id
    this.router.navigate(['employee-details', emp.id]);
  }
  //Declaring an empty array to store the search/filtered data.
  filteredNameList: EmpData[] = [];

  ngOnInit() {
    this.fetchEmployeeData();
    this.filteredNameList = this.employeeList;
  }

  handleSearch(searchQuery: string): void {
    this.filteredNameList = this.employeeList.filter((emp) =>
      emp.firstName.toLowerCase().includes(searchQuery.toLowerCase())
    );
  }
  private fetchEmployeeData(): void {
    this.empService.getData().subscribe(
      (data: EmpData[]) => {
        this.employeeList = data;
        this.filteredNameList = data;
      }
    );
  }
}

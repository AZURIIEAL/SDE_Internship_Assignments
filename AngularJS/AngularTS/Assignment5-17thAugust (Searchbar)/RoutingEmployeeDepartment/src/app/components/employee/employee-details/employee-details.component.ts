import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { EmpData } from 'src/app/interfaces/emp-data';
import { EmployeeDataService } from 'src/app/services/employee-data-service.service';

@Component({
  selector: 'app-employee-details',
  templateUrl: './employee-details.component.html',
  styleUrls: ['./employee-details.component.sass'],
})
export class EmployeeDetailsComponent implements OnInit {
  empDetails = this.empService.getData();
  employeeDetail: EmpData | undefined;
  constructor(
    private activatedRoute: ActivatedRoute,
    private empService: EmployeeDataService
  ) {}
  ngOnInit(): void {
    this.employeeDetail = this.activatedRoute.snapshot.params['id'];
  }
}

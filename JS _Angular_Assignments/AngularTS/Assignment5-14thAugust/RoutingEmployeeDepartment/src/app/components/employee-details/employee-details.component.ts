import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { EmpData } from 'src/app/interfaces/emp-data';
import { EmployeeDataService } from 'src/app/services/employee-data-service.service';

@Component({
  selector: 'app-employee-details',
  templateUrl: './employee-details.component.html',
  styleUrls: ['./employee-details.component.sass'],
})
export class EmployeeDetailsComponent {
  empDetails = this.empService.getData();
  employeeDetail: EmpData | undefined;
  constructor(
    private activatedRoute: ActivatedRoute,
    private empService: EmployeeDataService
  ) {
    this.activatedRoute.params.subscribe((x) => {
      this.employeeDetail = this.empDetails.find(
        (y) => y.id === Number(x['id'])
      );
    });
  }
}

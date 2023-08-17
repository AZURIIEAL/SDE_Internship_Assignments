import { Component } from '@angular/core';
import { DepartmentDataService } from '../../services/department-data-service.service';
import { DeptData } from 'src/app/interfaces/dept-data';

@Component({
  selector: 'app-department-home',
  templateUrl: './department-home.component.html',
  styleUrls: ['./department-home.component.sass']
})
export class DepartmentHomeComponent {

  constructor(private deptDataService:DepartmentDataService) {

  }

  departmentList = this.deptDataService.getData();
  selectedDepartmentDetail?:DeptData;

  GetDataFunction(dept: DeptData) {
    this.selectedDepartmentDetail = dept;
  }
  handleGoBack() {
    this.selectedDepartmentDetail = undefined;
  }

}

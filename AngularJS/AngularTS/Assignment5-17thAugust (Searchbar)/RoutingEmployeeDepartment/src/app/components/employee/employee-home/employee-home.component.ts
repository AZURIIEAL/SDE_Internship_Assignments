import { Component, OnInit, numberAttribute } from '@angular/core';
import { EmpData } from '../../../interfaces/emp-data';
import { EmployeeDataService } from '../../../services/employee-data-service.service';
import { Router,ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-employee-home',
  templateUrl: './employee-home.component.html',
  styleUrls: ['./employee-home.component.sass'],
})
export class EmployeeHomeComponent implements OnInit {
  constructor(
    private router: Router,
    private route:ActivatedRoute,
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
    this.initialize();
  }
  goBack() {
    this.router.navigate(['']);
  }
  addEmployee() {
    this.router.navigate(['add-employee']);
  }
  doUpdate(emp:EmpData){
    this.router.navigate(['update-employee', emp.id])
  }
  onReload(){
    this.router.navigate(['employee-home'],{relativeTo:this.route})}

  handleSearch(searchQuery: string): void {
    this.filteredNameList = this.employeeList.filter((emp) =>
      emp.firstName.toLowerCase().includes(searchQuery.toLowerCase())
    );
  }
  private initialize(){
    this.fetchEmployeeData();
  }
  private fetchEmployeeData(): void {
    this.empService.getData().subscribe((data: EmpData[]) => {
      this.employeeList = data;
      this.filteredNameList = data;
    });
  }
  DeleteFn(emp: EmpData) {
    this.empService.delEmployee(emp.id).subscribe(() => {
      this.initialize();
      // console.log('Employee deleted successfully.', response);
    });
  }
}

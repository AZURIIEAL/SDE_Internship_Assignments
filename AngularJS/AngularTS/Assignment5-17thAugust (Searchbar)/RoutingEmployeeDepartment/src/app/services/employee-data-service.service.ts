import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { EmpData } from '../interfaces/emp-data';
import { IaddEmp } from '../interfaces/iadd-emp';

@Injectable({
  providedIn: 'root',
})
export class EmployeeDataService {
  constructor(private http: HttpClient) {}
  url: string = 'https://localhost:44335/api/Employee';
  public getData() {
    return this.http.get<EmpData[]>(`${this.url}/get-all`);
  }
  public addEmployee(employee: IaddEmp) {
    return this.http.post(`${this.url}/add-employee`, employee);
  }
  public delEmployee(employeeId: number) {
    return this.http.delete(`${this.url}/delete-by-id/${employeeId}`);
  }
}
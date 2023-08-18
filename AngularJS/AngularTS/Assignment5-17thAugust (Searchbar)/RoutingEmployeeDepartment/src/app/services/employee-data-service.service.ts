import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http'
import { EmpData } from '../interfaces/emp-data';

@Injectable({
  providedIn: 'root'
})
export class EmployeeDataService {
  constructor(private http:HttpClient) {  
  }
  url:string ='https://localhost:44335/api/Employee';
  public getData() {
    
    return this.http.get<EmpData[]>(`${this.url}/get-all`)
}
}


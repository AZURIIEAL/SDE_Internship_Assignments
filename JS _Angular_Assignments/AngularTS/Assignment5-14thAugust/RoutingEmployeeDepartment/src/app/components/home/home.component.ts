import { Component } from '@angular/core';
import { Route, Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.sass']
})
export class HomeComponent {

  constructor(private router:Router) {

    
  }
  NavigateToEmployeeHome(){
    this.router.navigate(['./EmployeeHome'])
  }
  NavigateToDepartmentHome(){
    this.router.navigate(['./DepartmentHome']) 
  }

}

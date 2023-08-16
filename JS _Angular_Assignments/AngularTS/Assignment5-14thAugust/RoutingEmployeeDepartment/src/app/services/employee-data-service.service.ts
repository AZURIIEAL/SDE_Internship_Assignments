import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class EmployeeDataService {
    public empList = [
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
  public getData() {
    return this.empList;
}
}


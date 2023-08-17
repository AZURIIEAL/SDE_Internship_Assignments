import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class DepartmentDataService {
  public getData() {
    return [
      {
        id: 1,
        DepartmentName: 'Development',
        Head_of_department: 'Abin',
        Deputy_Head_of_department: 'Xavier',
      },
      {
        id: 2,
        DepartmentName: 'Design',
        Head_of_department: 'Ashiq',
        Deputy_Head_of_department: 'Revathy',
      },
      {
        id: 3,
        DepartmentName: 'HR',
        Head_of_department: 'George',
        Deputy_Head_of_department: 'Clark',
      },
    ];
  }
}

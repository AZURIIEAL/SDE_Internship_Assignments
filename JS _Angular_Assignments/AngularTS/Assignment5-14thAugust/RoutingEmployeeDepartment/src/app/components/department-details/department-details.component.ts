import { Component, EventEmitter, Input, Output } from '@angular/core';
import { DeptData } from 'src/app/interfaces/dept-data';

@Component({
  selector: 'app-department-details',
  templateUrl: './department-details.component.html',
  styleUrls: ['./department-details.component.sass']
})
export class DepartmentDetailsComponent {
  @Input() selectedDepartmentDetail?: DeptData
  @Output() goBackEvent = new EventEmitter();

  goBack() {
    this.goBackEvent.emit();
  }

}

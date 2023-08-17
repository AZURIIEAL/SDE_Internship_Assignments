import { Component, EventEmitter, Input, Output } from '@angular/core';
import { IEmpData } from '../interface/IEmpData';

@Component({
  selector: 'app-EmployeeDetails',
  templateUrl: './child2.component.html',
  styleUrls: ['./child2.component.css'],
})
export class Child2Component {
  @Input() employeeDetail?: IEmpData;
  @Output() goBackEvent = new EventEmitter();

  goBack() {
    this.goBackEvent.emit();
  }
}

import { Component, EventEmitter, Input, Output } from '@angular/core';
import { IEmpData } from '../emp-data';


@Component({
  selector: 'app-emp-detail',
  templateUrl: './emp-detail.component.html',
  styleUrls: ['./emp-detail.component.sass']
})
export class EmpDetailComponent {
  @Input() employeeDetail?: IEmpData;
  @Output() goBackEvent = new EventEmitter();

  goBack() {
    this.goBackEvent.emit();
  }
}
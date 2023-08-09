import { Component, EventEmitter, Input, Output } from '@angular/core';
import { IEmpData } from '../emp-data';
import { ActivatedRoute, Router } from '@angular/router';
import { EmpService } from '../emp.service';


@Component({
  selector: 'app-emp-detail',
  templateUrl: './emp-detail.component.html',
  styleUrls: ['./emp-detail.component.sass']
})
export class EmpDetailComponent {
  @Input() employeeDetail?: IEmpData;
  @Output() buttonClicked = new EventEmitter();
  constructor(private activatedRoute: ActivatedRoute, 
    private empService: EmpService) {
      this.activatedRoute.params.subscribe(params => {
        this.employeeDetail = this.empService.getData().find(x => x.id === Number(params['id']))
      })
    }
  buttonClick() {
    // this.router.navigate('')
    // this.buttonClicked.emit();
  }
}
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-add-employee',
  templateUrl: './add-employee.component.html',
  styleUrls: ['./add-employee.component.sass']
})
export class AddEmployeeComponent implements OnInit {
    public empFormGroup!: FormGroup;

    constructor(private fb: FormBuilder) {
    }

    public errors: Array<string> = [];
    ngOnInit(): void {
        this.empFormGroup = this.fb.group({
            firstName: new FormControl('', [Validators.required, Validators.maxLength(50),
            Validators.minLength(5)]),
            lastName: new FormControl('')
        })
    }

    add() {
        console.log(this.empFormGroup);
        if(this.empFormGroup.valid) {
            // add to empList
        }
        const firstNameErrors = this.empFormGroup.get('firstName')?.errors;
        if(firstNameErrors?.['required']) {
            this.errors.push('First Name is mandatory');
        }
        //if(this.empFormGroup.controls.errors)
        console.log(this.empFormGroup.value);
    }
}

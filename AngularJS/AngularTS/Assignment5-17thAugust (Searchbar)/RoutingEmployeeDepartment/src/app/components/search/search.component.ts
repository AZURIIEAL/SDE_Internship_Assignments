import { Component, EventEmitter, Output } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { FormGroup, FormControl } from '@angular/forms';
import { debounceTime } from 'rxjs';
@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.sass'],
  standalone: true,
  imports:[ReactiveFormsModule]

})
export class SearchComponent {
  @Output() searchEvent = new EventEmitter<string>();

  searchForm = new FormGroup({
    searchInput: new FormControl('')
  });

  ngOnInit() {
    this.searchForm.controls['searchInput'].valueChanges
      .pipe(debounceTime(250))
      .subscribe(x => this.searchEvent.emit(x || ''));
  }

  onSubmit() {
    // Emit the search query as a string
    this.searchEvent.emit(this.searchForm.value.searchInput!);
  }
}
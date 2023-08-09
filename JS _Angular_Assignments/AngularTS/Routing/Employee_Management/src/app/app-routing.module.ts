import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmpTableComponent } from './emp-table/emp-table.component';
import { EmpDetailComponent } from './emp-detail/emp-detail.component';
import { AppComponent } from './app.component';

const routes: Routes = [
  {path: '', component: AppComponent, children: [{
    path: 'list', component: EmpTableComponent
  }, {
    path: 'list/:id', component: EmpDetailComponent
  }, {
    path: '', redirectTo: 'list', pathMatch: 'full'
  }
  ]}
  ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

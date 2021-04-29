import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import {MatCardModule} from '@angular/material/card';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatButtonModule} from '@angular/material/button';
import {MatSnackBarModule} from '@angular/material/snack-bar';
import {MatSidenavModule} from '@angular/material/sidenav';
import {MatExpansionModule} from '@angular/material/expansion';
import {MatIconModule} from '@angular/material/icon';
import {MatGridListModule} from '@angular/material/grid-list';
import {MatDividerModule} from '@angular/material/divider';
import {MatTreeModule} from '@angular/material/tree';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {MatDialogModule} from '@angular/material/dialog';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatSelectModule} from '@angular/material/select';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatNativeDateModule} from '@angular/material/core';
import {MatTabsModule} from '@angular/material/tabs';
import { DatePickerCustComponent } from '../date-picker-cust/date-picker-cust.component';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [DatePickerCustComponent],
  imports:[CommonModule,FormsModule,MatDatepickerModule,
    MatNativeDateModule],
  exports:[MatToolbarModule,
    MatCardModule,
    DatePickerCustComponent,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatSnackBarModule,
    MatSidenavModule,
    MatExpansionModule,
    MatIconModule,
    MatGridListModule,
    MatDividerModule,
    MatTreeModule,
    MatProgressSpinnerModule,
    MatDialogModule,
    MatTableModule,
    MatPaginatorModule,
    MatSelectModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatTabsModule
  ]
})
export class MaterialModule { }

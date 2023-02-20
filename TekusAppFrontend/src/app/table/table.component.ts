import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})
export class TableComponent {
  title = "Tabla";
  constructor(private http: HttpClient) {}

  // ngOnInit() {
  //   this.http.get('https://localhost:7043/api/Service/GetAllService').subscribe((data) => {
  //     console.log(data);
  //   });
  // }
  // ngOnInit(){
  //   this.getCandy();
  //   }
  //   getCandy(){
  //   this.http.get('https://localhost:7043/api/Service/GetAllService').subscribe(data=>{
  //     console.log(data)
  //   })
  // }
}

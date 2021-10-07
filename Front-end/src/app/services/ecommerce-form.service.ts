import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';
import { City } from '../common/city';
import { Municipality } from '../common/municipality';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
@Injectable({
  providedIn: 'root',
})
export class EcommerceFormService {

  private cityUrl='http://localhost:8080/api/city';
  private municipalitiesUrl='http://localhost:8080/api/municipalities';

  constructor(private httpClient: HttpClient) {}

  getCity():Observable<City[]>{

    return this.httpClient.get<GetResponseCity>(this.cityUrl).pipe(
      map(response => response._embedded.city)
    );

  }

  getMunicipalities(theCityCode:string):Observable<Municipality[]>{

    //search url

    const searchMunicipalitiesUrl = `${this.municipalitiesUrl}/search/findByCityCode?code=${theCityCode}`;

    return this.httpClient.get<GetResponseMunicipalities>(searchMunicipalitiesUrl).pipe(
      map(response => response._embedded.municipalities)
    );
  }

  getCreditCardMonths(startMonth: number): Observable<number[]> {
    let data: number[] = [];
    //build an array fro Month dropdown list
    //start at current Month  and  loop untill

    for (let theMonth = startMonth; theMonth <= 12; theMonth++) {
      data.push(theMonth);
    }
    return of(data);
  }

  getCreditCardYears(): Observable<number[]> {
    let data: number[] = [];
    //build an array for year dropdown list
    //start at current year and loop for next 10 years

    const startYear: number = new Date().getFullYear();
    const endYear: number = startYear + 10;

    for (let theYear = startYear; theYear <= endYear; theYear++) {
      data.push(theYear);
    }
    return of(data);
  }
}

interface GetResponseCity{

  _embedded:{

    city:City[];

  }

}
interface GetResponseMunicipalities {
  _embedded:{

    municipalities:Municipality[]
 }
}
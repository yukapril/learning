import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EventBusService {
  public eventBus: Subject<string> = new Subject<string>();

  constructor() { }
}

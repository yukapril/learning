import { Component, OnInit } from '@angular/core';
import { EventBusService } from './../event-bus-service.service';

@Component({
  selector: 'app-communicate',
  templateUrl: './communicate.component.html',
  styleUrls: ['./communicate.component.less']
})
export class CommunicateComponent implements OnInit {

  constructor(public eventBusService: EventBusService) { }

  public handleClick(): void {
    this.eventBusService.eventBus.next('asdf');
  }

  ngOnInit() {
  }

}

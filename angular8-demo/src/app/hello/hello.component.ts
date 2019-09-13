import { Component, OnInit, ViewChild } from '@angular/core';
import { EventBusService } from './../event-bus-service.service';
import { ChildComponent } from './../child/child.component';

@Component({
  selector: 'app-hello',
  templateUrl: './hello.component.html',
  styleUrls: ['./hello.component.less']
})
export class HelloComponent implements OnInit {

  constructor(public eventBusService: EventBusService) { }

  @ViewChild(ChildComponent, { static: false })
  private childComponent: ChildComponent;

  public title = 'Angular';

  public isShow = true;

  public inputValue = 20;

  public list: Array<string> = ['a', 'b', 'c'];

  public childName: string;

  handleToggleClick(e: Event): void {
    console.log(e);
    this.isShow = !this.isShow;
  }

  handleBtnClick(e: Event): void {
    console.log(e);

  }

  handleChildPropsClick(): void {
    this.childName = 'qwerty';
  }

  handleChildFnClick(): void {
    console.log(this.childComponent);
    this.childComponent.childSay();
  }

  handleChildCallback(str: string): void {
    console.log(str);
  }


  ngOnInit() {
    this.eventBusService.eventBus.subscribe(val => {
      console.log(val);
    });
  }

}

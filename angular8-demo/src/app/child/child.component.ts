import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-child',
  templateUrl: './child.component.html',
  styleUrls: ['./child.component.less']
})
export class ChildComponent implements OnInit {

  constructor() { }

  @Input()
  public name: string;

  @Output()
  public callback = new EventEmitter<string>();

  public childSay(): void {
    console.log('childSay');
  }

  private childSayPrivate(): void {
    console.log('childSayPrivate');
  }

  handleClick(): void {
    this.callback.emit('asdf');
  }

  ngOnInit() {
  }

}

import React, { Component } from 'react';
import './App.css';
import Hello from './Hello';
import InbutBox from './InputBox';

class App extends Component {
  render() {
    return (
      <div className="app">
        <h1 className="title">Welcome to React</h1>
        <Hello name="wolrd" />
        <InbutBox />
      </div>
    );
  }
}

export default App;

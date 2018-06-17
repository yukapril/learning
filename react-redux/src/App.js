import React, { Component } from 'react'
import { Provider } from 'react-redux'
import store from './Store.js'
import Counter from './views/Counter.js'

class App extends Component {
  render () {
    return (
      <Provider store={store}>
        <Counter />
      </Provider>
    )
  }
}

export default App

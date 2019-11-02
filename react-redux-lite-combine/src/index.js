import React from "react"
import ReactDOM from "react-dom"
import { Provider } from "react-redux"
import { createStore } from "redux"
import reducer from "./reducer.js"
import Counter from "./Counter"

const store = createStore(reducer)

class App extends React.PureComponent {
  render () {
    return (
      <Provider store={store}>
        <Counter />
      </Provider>
    )
  }
}

const rootElement = document.getElementById("root")
ReactDOM.render(<App />, rootElement)

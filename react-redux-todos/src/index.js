import React from "react"
import ReactDOM from "react-dom"
import { Provider } from "react-redux"
import { createStore } from "redux"
import reducer from "./reducer.js"
import App from "./App"

const store = createStore(reducer)
window.store = store
class Root extends React.PureComponent {
  render () {
    return (
      <Provider store={store}>
        <App />
      </Provider>
    )
  }
}

const rootElement = document.getElementById("root")
ReactDOM.render(<Root />, rootElement)

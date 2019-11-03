import React from "react"
import ReactDOM from "react-dom"
import { Provider } from "react-redux"
import { createStore, applyMiddleware } from "redux"
import createSagaMiddleware from "redux-saga"
import saga from "./sagas"
import reducer from "./reducer.js"
import Counter from "./Counter"

const sagaMiddleware = createSagaMiddleware()
const store = createStore(reducer, applyMiddleware(sagaMiddleware))
sagaMiddleware.run(saga)

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

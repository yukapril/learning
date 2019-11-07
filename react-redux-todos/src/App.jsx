import React from "react"
import Input from './Input'
import List from './List'
import Filter from './Filter'

class App extends React.PureComponent {
  render () {
    return (
      <React.Fragment>
        <Input />
        <List />
        <Filter />
      </React.Fragment>
    )
  }
}

export default App

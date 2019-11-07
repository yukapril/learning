import React from "react"
import { connect } from "react-redux"

class App extends React.PureComponent {
  handleToggle = item => {
    const { dispatch } = this.props
    dispatch({ type: 'TOGGLE', payload: item.id })
  }

  render () {
    const { dispatch } = this.props
    return (
      <React.Fragment>
        <span>show:</span>
        <button onClick={() => dispatch({ type: 'SHOW_ALL' })}>all</button>
        <button onClick={() => dispatch({ type: 'SHOW_DONE' })}>done</button>
        <button onClick={() => dispatch({ type: 'SHOW_NOT_DONE' })}>not done</button>
      </React.Fragment>
    )
  }
}

export default connect()(App)

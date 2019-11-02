import React from "react"
import { connect } from "react-redux"

class Counter extends React.PureComponent {
  render () {
    const { globalState, otherState, dispatch } = this.props
    return (
      <div>
        <p>COUNT:{globalState.count}</p>
        <button onClick={() => dispatch({ type: "INCREMENT", payload: 1 })}>
          +1
        </button>
        <button onClick={() => dispatch({ type: "DECREMENT", payload: 1 })}>
          -1
        </button>
        <p>COUNT:{otherState.count}</p>
        <button onClick={() => dispatch({ type: "CLEAR" })}>
          clear
        </button>
        <button onClick={() => dispatch({ type: "TOMAX" })}>
          to max
        </button>
      </div>
    )
  }
}

const mapStateToProps = state => {
  return ({ globalState: state.globalReducer, otherState: state.otherReducer })
}
export default connect(mapStateToProps)(Counter)

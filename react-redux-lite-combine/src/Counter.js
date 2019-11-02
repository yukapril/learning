import React from "react"
import { connect } from "react-redux"

class Counter extends React.PureComponent {
  render () {
    const { someState, otherState, dispatch } = this.props
    return (
      <div>
        <p>COUNT:{someState.count}</p>
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
  return ({ someState: state.someReducer, otherState: state.otherReducer })
}
export default connect(mapStateToProps)(Counter)

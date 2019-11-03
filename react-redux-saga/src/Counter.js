import React from "react"
import { connect } from "react-redux"

class Counter extends React.PureComponent {
  render () {
    const { globalState, dispatch } = this.props
    return (
      <div>
        <p>COUNT:{globalState.count}</p>
        <button onClick={() => dispatch({ type: "INCREMENT", payload: 1 })}>
          +1
        </button>
        <button onClick={() => dispatch({ type: "DECREMENT", payload: 1 })}>
          -1
        </button>
        <button onClick={() => dispatch({ type: "INCREMENT_ASYNC", payload: 2 })}>
          +2 async takeEvery
        </button>
        <button onClick={() => dispatch({ type: "DECREMENT_ASYNC", payload: 2 })}>
          -2 async takeLatest
        </button>
      </div>
    )
  }
}

const mapStateToProps = state => ({ globalState: state })
export default connect(mapStateToProps)(Counter)

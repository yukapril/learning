import React from 'react'
import { connect } from 'dva';

class App extends React.PureComponent {
  render () {
    const { globalState, dispatch } = this.props
    return (
      <div>
        <p>GLOBAL_COUNT:{globalState.count}</p>
        <button onClick={() => { dispatch({ type: 'global/increment', payload: 1 }) }}>
          +1
        </button>
        <button onClick={() => { dispatch({ type: 'global/decrement', payload: 1 }) }}>
          -1
        </button>
        <button onClick={() => { dispatch({ type: 'global/incrementAsync', payload: 2 }) }}>
          +2 async takeEvery
        </button>
        <button onClick={() => { dispatch({ type: 'global/decrementAsync', payload: 2 }) }}>
          -2 async takeLatest
        </button>
      </div>
    )
  }
}

const mapStateToProps = state => ({ globalState: state.global })
export default connect(mapStateToProps)(App)
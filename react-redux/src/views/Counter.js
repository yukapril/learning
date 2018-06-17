import React from 'react'
import PropTypes from 'prop-types'
import * as Actions from '../Actions.js'
import { connect } from 'react-redux'

function Counter ({ count, handleIncrementClick, handleDecrementClick }) {
  return (
    <div>
      <p>
        COUNT:
        {count}
      </p>
      <button onClick={handleIncrementClick}>
        +
      </button>
      <button onClick={handleDecrementClick}>
        -
      </button>
    </div>
  )
}

Counter.propTypes = {
  count: PropTypes.number.isRequired,
  handleIncrementClick: PropTypes.func.isRequired,
  handleDecrementClick: PropTypes.func.isRequired
}

function mapStateToProps (state, ownProps) {
  return {
    count: state.count
  }
}

function mapDispatchToProps (dispatch, ownProps) {
  return {
    handleIncrementClick: () => {
      dispatch(Actions.increment())
    },
    handleDecrementClick: () => {
      dispatch(Actions.decrement())
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Counter)

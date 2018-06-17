import * as ActionTypes from './ActionTypes.js'

export const increment = () => {
  return {
    type: ActionTypes.INCREMENT,
    payload: 1
  }
}

export const decrement = () => {
  return {
    type: ActionTypes.DECREMENT,
    payload: 1
  }
}

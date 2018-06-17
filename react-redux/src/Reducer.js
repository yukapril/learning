import * as ActionTypes from './ActionTypes.js'

export default (state, action) => {
  let newState = Object.assign({}, state)
  switch (action.type) {
    case ActionTypes.INCREMENT:
      newState.count += action.payload
      break
    case ActionTypes.DECREMENT:
      newState.count -= action.payload
      break
    default:
  }
  return newState
}

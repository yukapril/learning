import { combineReducers } from "redux";

const someReducer = (state = { count: 10 }, action) => {
  switch (action.type) {
    case "INCREMENT":
      return { ...state, count: state.count + action.payload }
    case "DECREMENT":
      return { ...state, count: state.count - action.payload }
    default:
      return state
  }
}

const otherReducer = (state = { count: 20 }, action) => {
  switch (action.type) {
    case "CLEAR":
      return { ...state, count: 0 }
    case "TOMAX":
      return { ...state, count: 100 }
    default:
      return state
  }
}

export default combineReducers({
  someReducer,
  otherReducer
})

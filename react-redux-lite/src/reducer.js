const globalReducer = (state = { count: 10 }, action) => {
  switch (action.type) {
    case "INCREMENT":
      return { ...state, count: state.count + action.payload }
    case "DECREMENT":
      return { ...state, count: state.count - action.payload }
    default:
      return state
  }
}

export default globalReducer

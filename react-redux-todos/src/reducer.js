import { combineReducers } from 'redux'

const initTodos = [{
  id: 0,
  text: 'test record',
  checked: false
}]

const todos = (state = initTodos, action) => {
  switch (action.type) {
    case "ADD":
      return [...state, action.payload]
    case "REMOVE":
      return state.filter(item => item.id !== action.payload)
    case "TOGGLE":
      return state.map(item => {
        if (item.id === action.payload) item.checked = !item.checked
        return item
      })
    default:
      return state
  }
}

const filters = (state = 0, action) => {
  switch (action.type) {
    case "SHOW_ALL":
      return 0
    case "SHOW_DONE":
      return 1
    case "SHOW_NOT_DONE":
      return 2
    default:
      return state
  }
}

export default combineReducers({ todos, filters })

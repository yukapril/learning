import React from "react"
import { connect } from "react-redux"

class App extends React.PureComponent {
  handleToggle = item => {
    const { dispatch } = this.props
    dispatch({ type: 'TOGGLE', payload: item.id })
  }

  render () {
    const { todos } = this.props
    return (
      <React.Fragment>
        <ul>
          {
            todos.map(item => {
              return (
                <li
                  key={item.id}
                  style={{ textDecoration: item.checked ? 'line-through' : 'none' }}
                  onClick={() => this.handleToggle(item)}>
                  {item.text}
                </li>
              )
            })
          }
        </ul>
      </React.Fragment>
    )
  }
}

const mapStateToProps = state => {
  const filters = state.filters
  const todos = state.todos

  if (filters === 0) return { todos }
  else if (filters === 1) return { todos: todos.filter(item => item.checked) }
  else if (filters === 2) return { todos: todos.filter(item => !item.checked) }
}

export default connect(mapStateToProps)(App)

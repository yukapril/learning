import React from "react"
import { connect } from "react-redux"

const createId = (() => {
  let id = 0
  return () => {
    return ++id
  }
})()

class Input extends React.PureComponent {
  inputRef = React.createRef()

  handleClick = () => {
    const { dispatch } = this.props
    const el = this.inputRef.current
    const value = el.value
    el.value = ''
    dispatch({
      type: 'ADD',
      payload: { id: createId(), text: value, checked: false }
    })
  }

  render () {
    return (
      <React.Fragment>
        <input ref={this.inputRef} />
        <button onClick={this.handleClick}>add</button>
      </React.Fragment>
    )
  }
}

export default connect()(Input)

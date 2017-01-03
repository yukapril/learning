import React, { Component } from 'react';
import './InputBox.css';

class InputBox extends Component {
    constructor(props) {
        super(props);
        this.state = { value: 'haha~' };
    }

    handleChange(e) {
        this.setState({ value: e.target.value });
    }

    render() {
        var val = this.state.value;
        return (
            <div className="block input-box">
                <input type="text" className="input" value={val} onChange={this.handleChange.bind(this)} />
                <p className="show-text">{val}</p>
            </div >
        );
    }
}

export default InputBox;

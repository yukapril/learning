import React, { Component } from 'react';
import './Hello.css';

class Hello extends Component {
    render() {
        return (
            <div className="block hello">
                Hello <span className="text">{this.props.name}</span>!
            </div >
        );
    }
}

export default Hello;

class TextInput extends React.Component {
    constructor(props) {
        super(props);
        this.getInput = this.getInput.bind(this);
    }
    getInput(event) {
        alert(this.refs.textInput.value);
    }
    render() {
        return (
            <div className="block">
                <h1>
                    Get the Real-DOM.
                </h1>
                <input type="text" ref="textInput" />
                <input type="button" className="btn" value="get the Input!" onClick={this.getInput} />
            </div>
        );
    }
};

export {TextInput};
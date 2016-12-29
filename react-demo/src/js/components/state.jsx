class LikeButton extends React.Component {
    constructor(props) {
        super(props);
        this.state = this.initialState();
        this.handleClick = this.handleClick.bind(this);
    }
    initialState() {
        return {
            liked: false
        };
    }
    handleClick(event) {
        this.setState({ liked: !this.state.liked });
    }
    render() {
        var text = this.state.liked ? 'like' : 'haven\'t liked';
        return (
            <div className="block">
                <h1>
                    Do you like React?
                </h1>
                <button type="button" className="btn" onClick={this.handleClick}>
                    You {text} this.Click to toggle.
                </button>
            </div>
        );
    }
};

export {LikeButton};
class Hello extends React.Component {
    render() {
        return (
            <div className="block">
                <h1>React</h1>
                <p>Hello {this.props.name}!</p>
            </div>
        );
    }
}
export {Hello};
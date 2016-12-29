import {Header} from './components/common/header';
import {Nav} from './components/common/nav';

import {TextInput} from './components/realdom';

class Demo extends React.Component {
    render() {
        return (
            <div>
                <Header />
                <Nav />
                <section>
                    <TextInput />
                </section>
            </div>
        )
    }
}

ReactDOM.render(
    <Demo />,
    document.getElementById("react")
);

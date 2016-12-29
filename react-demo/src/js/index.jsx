import '../css/style.less';
import {Header} from './components/common/header';
import {Nav} from './components/common/nav';

import {Hello} from './components/hello';

class Index extends React.Component {
    render() {
        return (
            <div>
                <Header />
                <Nav />
                <section className="index">
                    <Hello name = 'world'/>
                </section>
            </div>
        )
    }
}

ReactDOM.render(
    <Index />,
    document.getElementById("react")
);

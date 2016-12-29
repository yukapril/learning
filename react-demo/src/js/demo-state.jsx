import {Header} from './components/common/header';
import {Nav} from './components/common/nav';

import {LikeButton} from './components/state';

class Demo extends React.Component {
    render() {
        return (
            <div>
                <Header />
                <Nav />
                <section>
                    <LikeButton />
                </section>
            </div>
        )
    }
}

ReactDOM.render(
    <Demo />,
    document.getElementById("react")
);

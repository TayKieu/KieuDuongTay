import React,{Component} from "react";
class Home extends Component{
    render() {
        return(
            <>
                <h1>Welcome</h1>
                <button onClick={this.props.onLogout}>Log out</button>
            </>
        )
    }
}
export default Home
import {Component} from "react";
import Home from "./Home";
class Login extends Component{
    constructor(props) {
        super(props);
        this.state ={
            isLoggedIn : false
        }
    }
    handleLogIn = () =>{
        this.setState({isLoggedIn : true})
    }
    handleLogOut = () =>{
        this.setState({isLoggedIn : false})
    }

    render(){
        const {isLoggedIn} = this.state
        if(isLoggedIn) return (<Home onLogout = {this.handleLogOut}></Home>)
        else
            return(
                <div style={{textAlign: 'center'}}>
                    <div>
                        <h1>Please log in</h1>
                        <button onClick={this.handleLogIn}>Log in</button>
                    </div>
                </div>
            )
    }
}
export default Login
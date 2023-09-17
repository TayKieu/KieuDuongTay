import {Component} from "react";
import {getValue} from "@testing-library/user-event/dist/utils";
class Calculate extends Component{
    constructor(props, valueA, valueB) {
        super(props);
        this.state={
            valueA,
            valueB,
        }
    }
    inputValueA = ()=>{this.setState({valueA: getValue()})}
    inputValueB = ()=>{this.setState({valueB: getValue()})}


    handlePlus = () =>{
        return (
            this.state.valueA + this.state.valueB
        )
    }
    handleMinus = () =>{
        return (
             this.state.valueA - this.state.valueB
        )
    }
    handleMulti = () =>{
        return (
            this.state.valueA * this.state.valueB
        )
    }
    handleDivide = () =>{
        return (
            this.state.valueA / this.state.valueB
        )
    }

    render() {
        return (
            <div>
                <input type={"text"} onInput={this.inputValueA} />
                <input type={"text"} onInput={this.inputValueB}/>
                <p>result: <span></span></p>
                <button onClick={this.handlePlus}>+</button>
                <button onClick={this.handleMinus}>-</button>
                <button onClick={this.handleMulti}>x</button>
                <button onClick={this.handleDivide}>/</button>
            </div>
        );
    }
}
export default Calculate
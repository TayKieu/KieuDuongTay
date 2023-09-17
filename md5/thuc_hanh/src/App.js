import logo from './logo.svg';
import './App.css';
import Welcome from "./components/Welcome";
import AddComponent from "./components/AddComponent";
import AddComponentByFunct from "./components/AddComponentByFunct";
import AdjustComponent from "./components/AdjustComponent";
import Login from "./components/Login";

function App() {
    return (
        <>
            <div className="App">
                {/*<Welcome name="Admin"></Welcome>*/}
                {/*<AddComponent firstNumber={1} secondNumber={2}></AddComponent>*/}
                {/*<AddComponentByFunct firstNum={3} secondNum={5}></AddComponentByFunct>*/}
                {/*<AdjustComponent></AdjustComponent>*/}
                <Login></Login>
            </div>
        </>
    );
}

export default App;

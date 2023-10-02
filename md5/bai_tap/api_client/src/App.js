import logo from './logo.svg';
import './App.css';
import {Route, Routes} from "react-router-dom";
import {Create, List} from "./component/ToDoList";

function App() {
  return (
<Routes>
  <Route path="/" element={<Create/>}></Route>
</Routes>
  );
}

export default App;

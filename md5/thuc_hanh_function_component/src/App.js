import logo from './logo.svg';
import './App.css';
import Counter from "./components/Counter";
import Selectors from "./components/Selectors";
import {Validate_login} from "./components/Validate_login";
import {Link, Route, Routes} from "react-router-dom";
import About from "./components/About";
import Home from "./components/Home";
import Contact from "./components/Contact";

function App() {
  return (
    // <Counter></Counter>
    //   <Selectors></Selectors>
    //   <Validate_login></Validate_login>
      <div>
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/about">About</Link>
          </li>
          <li>
            <Link to="/contact">Contact</Link>
          </li>
        </ul>
        <hr />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about/:categoryId" element={<About />} />
          <Route path="/contact" element={<Contact />} />
        </Routes>
      </div>
  );
}

export default App;

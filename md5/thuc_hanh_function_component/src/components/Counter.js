import {useState} from "react";
function Counter(){
    let[count,setCount] = useState(0);
    const handleCount = () =>{
        const newValue = count + 1;
        setCount(newValue)
    }
    return(
        <div>
            Gia tri {count}
            <div>
                <button onClick={handleCount}>Up</button>
            </div>
        </div>
    )
}
export default Counter
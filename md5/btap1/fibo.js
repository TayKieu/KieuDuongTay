import React from "react";

const FiboList = () => {
    let sum = 0;
    const getFiboList = (n) => {
        let fib = [0, 1];
        for (let i = 0; i < n; i++) {
            fib[fib.length] = fib[i] + fib[i + 1]
            sum+=fib[fib.length]
        }
        return fib;
    }

    const fiboList = getFiboList(50);

    return (<div className={"App"}>
        <h1>List fibo: </h1>
        <div>
            {fiboList.map(element => <p>{element}</p>)}
        </div>
        <div>
            <p>sum: {sum}</p>
        </div>
    </div>)
}
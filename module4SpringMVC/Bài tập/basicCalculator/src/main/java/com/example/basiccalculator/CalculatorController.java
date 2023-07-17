package com.example.basiccalculator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.jws.WebParam;

@Controller
public class CalculatorController {
    @GetMapping("/")
    public String show(){
        return "list";
    }
    @PostMapping("/calculate")
    public String calculate(@RequestParam("firstOperand")float first,
                            @RequestParam("secondOperand")float second,
                            @RequestParam("operator")char operator, Model model){
        try{
            float result = calculate(first,second,operator);
            model.addAttribute("result",result);
        } catch (Exception e) {
            model.addAttribute("message", "can not divide by zero");
            return "list";
        }
        return "list";
    }

    public static float calculate(float first, float second, char operator){
        switch (operator){
            case '+':
                return first + second;
            case '-':
                return first - second;
            case '*':
                return first * second;
            case '/':
                if(second != 0)
                    return first / second;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}

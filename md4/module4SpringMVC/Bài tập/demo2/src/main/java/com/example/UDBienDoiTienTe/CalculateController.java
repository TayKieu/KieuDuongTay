package com.example.UDBienDoiTienTe;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalculateController {
    @GetMapping("/")
    public String showList(){
        return "list";
    }
    @PostMapping("/exchange")
    public String exchange(@RequestParam("input") double input, Model model){
        double result = input * 22000;
        model.addAttribute("result",result);
        return "list";
    }
}

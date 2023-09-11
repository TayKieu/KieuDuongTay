package com.example.flavor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FlavorController {
    @GetMapping("/")
    public String show(){
        return "list";
    }

    @PostMapping("/choose")
    public String save(@RequestParam("condiment") String[] condiment, ModelMap Model) {
        if(condiment != null) {
            for (int i = 0; i <condiment.length ; i++) {
                Model.addAttribute("condiment", display(condiment));
            }
            return "create";
        }
        return "list";
    }
    public String[] display(String[] arr){
        return arr;
    }
}

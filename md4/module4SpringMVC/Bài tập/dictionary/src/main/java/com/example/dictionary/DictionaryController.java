package com.example.dictionary;

import com.example.repository.DictionaryMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DictionaryController {
    final DictionaryMap map ;
    public DictionaryController(DictionaryMap map){
        this.map = map;
    }
    @GetMapping("/")
    public String showDictionary(){
        return "list";
    }
    @GetMapping("/views/create")
    public String showCreateForm(){
        return "create";
    }
    @PostMapping("/views/save")
    public String create(@RequestParam("word") String word, @RequestParam("translate") String translate, Model model){
        map.addWordToDictionary(word,translate);
        model.addAttribute("message", "Add Successful!!");
        model.addAttribute("map",map.getAll());
        return "list";
    }
}

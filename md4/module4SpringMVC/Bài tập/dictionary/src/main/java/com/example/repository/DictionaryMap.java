package com.example.repository;

import java.util.HashMap;
import java.util.Map;

public class DictionaryMap {
    Map<String,String> map = new HashMap<>();
    public void addWordToDictionary(String word, String translate){
        map.put(word, translate);
    }

    public Map<String, String> getAll(){
        return map;
    }

    public String find(String translate){
        return map.get(translate);
    }
}

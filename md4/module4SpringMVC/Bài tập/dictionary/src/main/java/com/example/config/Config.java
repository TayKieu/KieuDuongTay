package com.example.config;

import com.example.repository.DictionaryMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Config {
    @Bean
    public DictionaryMap map(){
        return new DictionaryMap();
    }
}

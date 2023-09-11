package codegym.demo.service;

import codegym.demo.entity.Type;
import org.springframework.stereotype.Service;

import java.util.List;

public interface TypeService {

    List<Type> findAll();

    Type findById(Integer id);

}

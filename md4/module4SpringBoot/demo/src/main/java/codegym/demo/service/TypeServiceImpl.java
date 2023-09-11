package codegym.demo.service;

import codegym.demo.entity.Type;
import codegym.demo.repo.TypeRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    final TypeRepo repo;

    public TypeServiceImpl(TypeRepo repo) {
        this.repo = repo;
    }

    @Override
    public List<Type> findAll() {
        return repo.findAll();
    }

    @Override
    public Type findById(Integer id) {
        return repo.findById(id).orElse(null);
    }
}

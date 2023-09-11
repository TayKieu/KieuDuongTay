package codegym.demo.repo;

import codegym.demo.entity.Type;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeRepo extends JpaRepository<Type, Integer> {
}

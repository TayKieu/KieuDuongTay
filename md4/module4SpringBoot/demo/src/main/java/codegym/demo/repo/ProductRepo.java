package codegym.demo.repo;

import codegym.demo.entity.Product;
import codegym.demo.entity.Type;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepo extends JpaRepository<Product, Integer> {
    Page<Product> findAllByProductNameContains(String name, Pageable pageable);
//
    Page<Product> findAllByPrice(Long price, Pageable pageable);

    Page<Product> findByType(Type type, Pageable pageable);



    Page<Product> findByProductNameContainsAndPriceAndType(String name, Long Price, Type type, Pageable pageable);

    Page<Product> findByProductNameContainsAndPrice(String name, Long price, Pageable pageable);

    Page<Product> findByProductNameContainsAndType(String name, Type type, Pageable pageable);

    Page<Product> findByPriceAndType(Long price, Type type, Pageable pageable);
}

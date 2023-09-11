package codegym.demo.service;

import codegym.demo.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ProductService {

    Page<Product> findAll(Pageable pageable);

    void create (Product product);

    Page<Product> findByName(String name, Pageable pageable);

    Page<Product> findByPrice(Long price, Pageable pageable);

    void delete(Integer id);

    Page<Product> findByProductNameAndPriceAndType(String name, Long price, Integer type, Pageable pageable);
}

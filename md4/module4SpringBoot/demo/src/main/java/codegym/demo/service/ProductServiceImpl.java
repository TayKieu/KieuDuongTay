package codegym.demo.service;

import codegym.demo.entity.Product;
import codegym.demo.entity.Type;
import codegym.demo.repo.ProductRepo;
import codegym.demo.repo.TypeRepo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

    final ProductRepo productRepo;
    final TypeRepo typeRepo;

    public ProductServiceImpl(ProductRepo productRepo, TypeRepo typeRepo) {
        this.productRepo = productRepo;
        this.typeRepo = typeRepo;
    }

    @Override
    public Page<Product> findAll(Pageable pageable) {
        return productRepo.findAll(pageable);
    }

    @Override
    public void create(Product product) {
        productRepo.save(product);
    }

    @Override
    public Page<Product> findByName(String name, Pageable pageable) {
        return productRepo.findAllByProductNameContains(name, pageable);
    }

    @Override
    public Page<Product> findByPrice(Long price, Pageable pageable) {
        return productRepo.findAllByPrice(price, pageable);
    }

    @Override
    public void delete(Integer id) {
        productRepo.deleteById(id);
    }

    @Override
    public Page<Product> findByProductNameAndPriceAndType(String name, Long price, Integer typeId, Pageable pageable) {
        Type type = typeRepo.findById(typeId).orElse(new Type());
        if (price == 0 && typeId == 0){
            return productRepo.findAllByProductNameContains(name, pageable);
        }
        if (name.equals("") && typeId == 0){
            return productRepo.findAllByPrice(price, pageable);
        }
        if (name.equals("") && price == 0){
            return productRepo.findByType(type, pageable);
        }
        if (typeId == 0){
            return productRepo.findByProductNameContainsAndPrice(name,price,pageable);
        }
        if (price == 0){
            return productRepo.findByProductNameContainsAndType(name,type,pageable);
        }
        if (name.equals("")){
            return productRepo.findByPriceAndType(price,type,pageable);
        }

        return productRepo.findByProductNameContainsAndPriceAndType(name, price, type, pageable);
    }
}

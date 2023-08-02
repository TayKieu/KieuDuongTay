package com.example.service;

import com.example.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IProductServiceImpl implements IProductService{
    private static final Map<Integer,Product> products ;
    static {products = new HashMap<>();
        products.put(1, new Product(1, "John", 100));
        products.put(2, new Product(2, "John", 100));
        products.put(3, new Product(3, "John", 100));
        products.put(4, new Product(4, "John", 100));
        products.put(5, new Product(5, "John", 100));
        products.put(6, new Product(6, "John", 100));}
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i <products.size() ; i++) {
            if(products.get(i).getId() == id){
                products.get(i).setName(product.getName());
                products.get(i).setPrice(product.getPrice());
            }
        }
    }

    @Override
    public void delete(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findbyName(String search) {
        List<Product> product2 = new ArrayList<>();
        
        for(Product product : productList){
            if(product.getName().toLowerCase().contains(search){
                product2.add(product);
            }
        }
        return product2;
    }
}

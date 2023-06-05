package dao;

import model.Category;
import model.Product;

import java.util.List;

public interface IProductDAO {
public List<Product> selectAllProduct();
public Product insertProduct(Product product);
public boolean delete(int id);
public List<Product> findProduct(String name);
public boolean updateProduct(Product product);
public Product selectById(int id);
}

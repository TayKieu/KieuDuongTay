package service;

import entities.Product;
import repo.CategoryRepoImpl;

import java.sql.SQLException;
import java.util.List;

public class CategoryServiceImpl implements IService<Product> {
    private CategoryRepoImpl repo = new CategoryRepoImpl();
    @Override
    public List findAll(String searchName, String index) {
        return null;
    }

    @Override
    public Product findById(int id) {
        return null;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public int pages() {
        return 0;
    }

    @Override
    public List selectAll() {
        return repo.selectAll();
    }

    @Override
    public void createProduct(Product newProduct) throws SQLException {

    }

    @Override
    public void update(Product product) {

    }

}

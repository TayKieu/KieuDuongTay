package service;

import entities.Product;
import repo.IRepos;
import repo.ProductRepoImpl;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements IService<Product> {
    private IRepos<Product> repos = new ProductRepoImpl();

    @Override
    public List<Product> findAll(String searchName, String index) {
        return repos.findAll(searchName, index);
    }

    @Override
    public Product findById(int id) {
        return repos.findById(id);
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return repos.delete(id);
    }


    @Override
    public int pages() {
        double items = repos.countItem();
        return (int) Math.ceil(items / 5);
    }

    @Override
    public List selectAll() {
        return repos.selectAll();
    }

    @Override
    public void createProduct(Product newProduct) throws SQLException {
        repos.create(newProduct);
    }

    @Override
    public void update(Product product) {
        repos.update(product);
    }
}

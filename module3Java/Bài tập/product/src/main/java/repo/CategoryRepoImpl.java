package repo;

import entities.Category;
import entities.Product;
import utils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepoImpl implements IRepos<Product>{
    @Override
    public List findAll(String searchName, String index) {
        return null;
    }

    @Override
    public List selectAll() {
        String selectAll = "select * from category;";
        List<Category> list = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnect();
             PreparedStatement statement = connection.prepareStatement(selectAll)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                list.add(new Category(id, name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
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
    public void create(Product product) {

    }

    @Override
    public void update(Product o) {

    }

    @Override
    public int countItem() {
        return 0;
    }
}

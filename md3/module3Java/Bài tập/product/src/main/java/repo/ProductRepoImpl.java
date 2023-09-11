package repo;

import entities.Product;
import utils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepoImpl implements IRepos<Product>{
    @Override
    public List findAll(String searchName, String index) {
        return null;
    }

    @Override
    public List selectAll() {
        String getlist = "select * from product";
        List<Product> productList = new ArrayList<>();
        try (Connection connection = ConnectDB.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(getlist);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String price = rs.getString("price");
                String quantity = rs.getString("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description");
                int categoryId = rs.getInt("categoryId");
                productList.add(new Product(id, name, price, quantity, color, description, categoryId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        String selectById = "select * from product where id = ?";
        try (Connection connection = ConnectDB.getConnect();
             PreparedStatement preparedStatement = connection.prepareStatement(selectById);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String price = rs.getString("price");
                String quantity = rs.getString("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description");
                int categoryId = rs.getInt("categoryId");
                product = new Product(id, name, price, quantity, color, description, categoryId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public boolean delete(int id) throws SQLException{
        boolean rowDeleted;
        String delete = "delete from product where id = ?";
        try (Connection connection = ConnectDB.getConnect(); PreparedStatement statement = connection.prepareStatement(delete);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public void create(Product product) throws SQLException {
        String create = "insert into product(`name`,price,quantity,color,`description`,categoryId) value(?,?,?,?,?,?);";
        try (Connection connection = ConnectDB.getConnect(); PreparedStatement statement = connection.prepareStatement(create)) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getPrice());
            statement.setString(3, product.getQuantity());
            statement.setString(4, product.getColor());
            statement.setString(5, product.getDescription());
            statement.setInt(6, product.getCategoryId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Product product) {
        String updateProduct = "update product set `name` = ?, price = ?, quantity = ?, color = ?, `description` = ?, categoryId = ? where id = ?;";
        try (Connection connection = ConnectDB.getConnect();
             PreparedStatement statement = connection.prepareStatement(updateProduct)) {
            statement.setString(1, product.getName());
            statement.setString(2, product.getPrice());
            statement.setString(3, product.getQuantity());
            statement.setString(4, product.getColor());
            statement.setString(5, product.getDescription());
            statement.setInt(6, product.getCategoryId());
            statement.setInt(7, product.getId());
            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    @Override
    public int countItem() {
        return 0;
    }
}

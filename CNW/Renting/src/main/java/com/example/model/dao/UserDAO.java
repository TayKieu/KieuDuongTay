package com.example.model.dao;

import com.example.model.bean.User;
import com.example.model.utils.ConnectDBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private static final String CHECK_LOGIN = "select * from user where username = ? AND password = ?";

    public static User CheckLogin(String username, String password) {
        try {
            Connection connection = ConnectDBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(CHECK_LOGIN);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setAccountName(rs.getString("account_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                return user;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static final String REGISTER = "insert into user(username,password,account_name,email,phone) values(?,?,?,?,?) ";
    public static void register(User user){
        try{
            Connection connection = ConnectDBUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(REGISTER);
            statement.setString(1,user.getUsername());
            statement.setString(2,user.getPassword());
            statement.setString(3,user.getAccountName());
            statement.setString(4,user.getEmail());
            statement.setString(5,user.getPhone());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

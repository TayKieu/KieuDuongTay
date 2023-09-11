package service;

import entities.Product;

import java.sql.SQLException;
import java.util.List;

public interface IService <E>{
    List<E> findAll(String searchName, String index);

    E findById(int id);

    boolean delete(int id) throws SQLException;


    int pages();
    List<E> selectAll();

    void createProduct(E newProduct) throws SQLException;
    void update(E e);
}

package repo;

import entities.Product;

import java.sql.SQLException;
import java.util.List;

public interface IRepos<E> {
    List<E> findAll(String searchName, String index);
    List<E> selectAll();

    E findById(int id);

    boolean delete(int id) throws SQLException;

    void create(E e) throws SQLException;


    void update(E e);

    int countItem();

}

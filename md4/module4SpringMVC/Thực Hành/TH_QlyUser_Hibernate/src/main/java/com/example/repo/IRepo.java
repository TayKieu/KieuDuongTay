package com.example.repo;

import java.util.List;

public interface IRepo<T> {
    List<T> findAll();

    T findById(Long id);

    void save(T t);

    void remove(Long id);
}

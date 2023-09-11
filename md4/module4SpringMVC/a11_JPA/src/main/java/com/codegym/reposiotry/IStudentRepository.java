package com.codegym.reposiotry;

import com.codegym.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
    Student findById(int id);
    boolean save(Student student);
}

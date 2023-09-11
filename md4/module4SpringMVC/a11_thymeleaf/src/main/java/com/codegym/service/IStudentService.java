package com.codegym.service;

import com.codegym.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    Student findById(int id);
    boolean save(Student student);
}

package com.codegym.demo_spring_data_jpa_a11.service;


import com.codegym.demo_spring_data_jpa_a11.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    List<Student> search(String searchName);
    Student findById(int id);
    boolean save(Student student);
}

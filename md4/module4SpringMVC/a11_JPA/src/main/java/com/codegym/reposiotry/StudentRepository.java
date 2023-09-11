package com.codegym.reposiotry;

import com.codegym.model.Student;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Repository
public class StudentRepository implements IStudentRepository {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        // sử dụng HQL
        TypedQuery<Student> query = entityManager.createQuery("from Student",Student.class);
        studentList = query.getResultList();
        // sử dụng SQL
//        TypedQuery<Student> query = (TypedQuery<Student>) entityManager.createNativeQuery("select * from student",Student.class);
//        studentList = query.getResultList();
        return studentList;
    }

    @Override
    public Student findById(int id) {
        return entityManager.find(Student.class,id);
    }
    @Transactional
    @Override
    public boolean save(Student student) {
        try {
            // thêm mới
            entityManager.persist(student);
            // xoá
            Student student1 = findById(student.getId());
            entityManager.remove(student1);
            // update
            Student student2 = findById(student.getId());
            student2.setName(student.getName());
            entityManager.merge(student2);
            //
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}

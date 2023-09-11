package com.codegym.reposiotry;

import com.codegym.model.Student;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.List;

@Repository
public class StudentRepository implements IStudentRepository {

    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        Session session = ConnectionUtil.sessionFactory.openSession();
        TypedQuery<Student> query = session.createQuery("from Student",Student.class);
        studentList = query.getResultList();
        session.close();
        return studentList;
    }

    @Override
    public Student findById(int id) {
        Session session = ConnectionUtil.sessionFactory.openSession();
        TypedQuery<Student> query = session.createQuery("from Student where id =:id",Student.class);
        query.setParameter("id",id);
        return query.getSingleResult();
    }

    @Override
    public boolean save(Student student) {
        Session session = ConnectionUtil.sessionFactory.openSession();
        Transaction transaction = session.getTransaction();
        try{
            transaction.begin();
            session.save(student);
            transaction.commit();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}

package com.codegym.reposiotry;

import com.codegym.model.Student;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class StudentRepository implements IStudentRepository {
    private  static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1,"Chánh",1,new String[]{"Java", "PHP"}));
        studentList.add(new Student(2,"Hùng",0,new String[]{"Java", "PHP"}));
        studentList.add(new Student(3,"Khang",-1,new String[]{"Java", "PHP"}));
    }
    @Override
    public List<Student> findAll() {
        return studentList;
    }

    @Override
    public Student findById(int id) {
        for(int i=0;i<studentList.size();i++){
            if (studentList.get(i).getId()==id){
                return studentList.get(i);
            }
        }
        return null;
    }

    @Override
    public boolean save(Student student) {
        return studentList.add(student);
    }
}

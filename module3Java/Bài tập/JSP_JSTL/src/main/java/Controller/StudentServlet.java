package Controller;

import Model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static List<Student> studentList;
    static{
        studentList = new ArrayList<>();
        studentList.add(new Student(1,"NVA",1,90,"img1.jpg"));
        studentList.add(new Student(2,"NVB",0,90,"img2.jpg"));
        studentList.add(new Student(3,"NVC",1,90,"img3.jpg"));
        studentList.add(new Student(4,"NVD",0,90,"img4.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // response.sendRedirect("/student/list.jsp"); //chuyển hướng ko kèm data
        request.setAttribute("studentList",studentList);
        request.getRequestDispatcher("/student/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

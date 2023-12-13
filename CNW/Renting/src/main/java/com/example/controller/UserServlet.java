package com.example.controller;

import com.example.model.bean.RentDetail;
import com.example.model.bean.User;
import com.example.model.bo.RentBO;
import com.example.model.bo.UserBO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserBO userBO;
    RentBO rentBO;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                showLoginForm(request, response);
                break;
            case "register":
                showRegisterForm(request, response);
                break;
        }
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("view/register.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("view/login.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String accountName = request.getParameter("accountName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        User newUser = new User(username,password,accountName,email,phone);
        try{
            UserBO.register(newUser);
            response.sendRedirect("view/register.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<RentDetail> rentCards = RentBO.findAll();
        request.setAttribute("rentCards", rentCards);
        User user = UserBO.checkLogin(username,password);
        if(user != null){
            request.getSession().setAttribute("User", user);
            RequestDispatcher rd = request.getRequestDispatcher("view/home.jsp");
            try {
                rd.forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        else {
            try {
                response.sendRedirect("view/login.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}

package com.example.controller;

import com.example.model.bean.RentDetail;
import com.example.model.bo.RentBO;
import com.example.model.dao.RentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RentServlet", value = "/RentServlet")
public class RentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    RentBO rentBO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create": showCreateNewPostForm(request,response);
            break;
            default: showHomePage(request,response);
            break;
        }
    }

    private void showCreateNewPostForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("view/create.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showHomePage(HttpServletRequest request, HttpServletResponse response) {
        List<RentDetail> rentCards = RentBO.findAll();
        request.setAttribute("rentCards", rentCards);
        RequestDispatcher rd = request.getRequestDispatcher("view/home.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
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
        switch (action){
            case "create": createNewPost(request,response);
            break;
        }
    }

    private void createNewPost(HttpServletRequest request, HttpServletResponse response) {
        String area = request.getParameter("area");
        String address = request.getParameter("address");
        int acreage = Integer.parseInt(request.getParameter("acreage"));
        String info = request.getParameter("info");
        int prices = Integer.parseInt(request.getParameter("prices"));
        String title = request.getParameter("title");
        String img = request.getParameter("img");
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int ownerId = Integer.parseInt(request.getParameter("ownerId"));
        RentDetail newRentDetail = new RentDetail(area,address,acreage,info,prices,title,img,rentTypeId,ownerId);
        try {
            rentBO.create(newRentDetail);
            response.sendRedirect("view/home.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

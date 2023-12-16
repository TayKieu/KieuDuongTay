package com.example.controller;

import com.example.model.bean.RentDetail;
import com.example.model.bean.User;
import com.example.model.bo.RentBO;
import com.example.model.bo.UserBO;
import com.example.model.dao.RentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "RentServlet", value = "/RentServlet")
public class RentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateNewPostForm(request, response);
                break;
            case "editOwner":
                showEditOwnerForm(request, response);
                break;
            case "viewDetail":
                showViewDetailForm(request, response);
                break;
            case "editCard":
                showEditCardForm(request, response);
                break;
            case "deleteCard":
                delete(request, response);
                break;
            default:
                showHomePage(request, response);
                break;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int rentDetailId = Integer.parseInt(request.getParameter("rentDetailId"));
        RentBO.deleteById(rentDetailId);
        showHomePage(request, response);
    }

    private void showEditCardForm(HttpServletRequest request, HttpServletResponse response) {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int rentDetaiId = Integer.parseInt(request.getParameter("rentDetailId"));
        User user = UserBO.findById(userId);
        RentDetail rentDetail = RentBO.findRentDetailById(rentDetaiId);
        if (user != null) {
            request.getSession().setAttribute("User", user);
            request.getSession().setAttribute("Rent", rentDetail);
            RequestDispatcher rd = request.getRequestDispatcher("view/editCard.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void showViewDetailForm(HttpServletRequest request, HttpServletResponse response) {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int rentDetaiId = Integer.parseInt(request.getParameter("rentDetailId"));
        User user = UserBO.findById(userId);
        RentDetail rentDetail = RentBO.findRentDetailById(rentDetaiId);
        if (user != null) {
            request.getSession().setAttribute("User", user);
            request.getSession().setAttribute("Rent", rentDetail);
            RequestDispatcher rd = request.getRequestDispatcher("view/viewDetail.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.getSession().setAttribute("Rent", rentDetail);
            RequestDispatcher rd = request.getRequestDispatcher("view/viewDetail.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void showEditOwnerForm(HttpServletRequest request, HttpServletResponse response) {
        int userId = Integer.parseInt(request.getParameter("userId"));
        User user = UserBO.findById(userId);
        if (user != null) {
            request.getSession().setAttribute("User", user);
            RequestDispatcher rd = request.getRequestDispatcher("view/editOwner.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                response.sendRedirect("view/login.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void showCreateNewPostForm(HttpServletRequest request, HttpServletResponse response) {
        int userId = Integer.parseInt(request.getParameter("userId"));
        User user = UserBO.findById(userId);
        if (user != null) {
            request.getSession().setAttribute("User", user);
            RequestDispatcher rd = request.getRequestDispatcher("view/create.jsp");
            try {
                rd.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                response.sendRedirect("view/login.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
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
        switch (action) {
            case "create":
                createNewPost(request, response);
                break;
            case "editOwner":
                editOwnerInCreate(request, response);
                break;
            case "editOwnerInCard":
                editOwnerInCard(request, response);
                break;
            case "editCard":
                editCard(request,response);
                break;
        }
    }

    private void editOwnerInCard(HttpServletRequest request, HttpServletResponse response) {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String accountName = request.getParameter("accountName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        RentBO.editOwnerContactInfo(accountName, email, phone, userId);
        showEditCardForm(request,response);
    }

    private void editCard(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            int rentDetailId = Integer.parseInt(request.getParameter("rentDetailId"));
            String area = request.getParameter("area");
            String address = request.getParameter("address");
            int acreage = Integer.parseInt(request.getParameter("acreage"));
            String info = request.getParameter("info");
            int prices = Integer.parseInt(request.getParameter("prices"));
            String title = request.getParameter("title");
            String img = request.getParameter("img");
            int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            RentDetail newRentDetail = new RentDetail(rentDetailId,area, address, acreage, info, prices, title, img, rentTypeId, userId);
            RentBO.updateRentInfo(newRentDetail);
            showViewDetailForm(request,response);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    private void editOwnerInCreate(HttpServletRequest request, HttpServletResponse response) {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String accountName = request.getParameter("accountName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        RentBO.editOwnerContactInfo(accountName, email, phone, userId);
        showCreateNewPostForm(request, response);
    }

    private void createNewPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            String area = request.getParameter("area");
            String address = request.getParameter("address");
            int acreage = Integer.parseInt(request.getParameter("acreage"));
            String info = request.getParameter("info");
            int prices = Integer.parseInt(request.getParameter("prices"));
            String title = request.getParameter("title");
            String img = request.getParameter("img");
            int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            RentDetail newRentDetail = new RentDetail(area, address, acreage, info, prices, title, img, rentTypeId, userId);
            RentBO.create(newRentDetail);
            showHomePage(request, response);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }
}

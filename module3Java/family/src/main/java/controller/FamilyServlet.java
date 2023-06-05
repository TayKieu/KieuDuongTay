package controller;

import dao.IFamilyDAO;
import dao.IFamilyDAOImpl;
import model.HoKhau;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FamilyServlet", value = "/FamilyServlet")
public class FamilyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IFamilyDAO iFamilyDAO;


    public void init() {
        iFamilyDAO = new IFamilyDAOImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create" : break;

            default:
                hienThiDSHoKhau(request,response);
                break;
        }
    }

    private void hienThiDSHoKhau(HttpServletRequest request, HttpServletResponse response) {
        List<HoKhau> danhSachHoKhau = iFamilyDAO.hienThiTatCaHoKhau();
        request.setAttribute("danhSachHoKhau",danhSachHoKhau);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try{
            dispatcher.forward(request,response);
        }
        catch (ServletException se){
            se.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        };

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

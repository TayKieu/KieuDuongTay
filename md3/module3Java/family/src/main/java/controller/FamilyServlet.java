package controller;

import dao.IFamilyDAO;
import dao.IFamilyDAOImpl;
import model.HoKhau;
import model.ThanhVien;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
            case "edit":
                hienThiFormEdit(request,response);
                break;
            default:
                hienThiDSHoKhau(request,response);
                break;
        }
    }

    private void hienThiFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int ma = Integer.parseInt(request.getParameter("ma"));
        HoKhau hoKhauHienTai = iFamilyDAO.layHoKhauTheoId(ma);
        request.setAttribute("hokhau",hoKhauHienTai);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");

        try{
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
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
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "edit":
                try {
                    suaHoKhau(request,response);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void suaHoKhau(HttpServletRequest request, HttpServletResponse response) throws ParseException, ServletException, IOException {
        Integer ma = Integer.valueOf(request.getParameter("ma"));
        String tenChuHo =request.getParameter("tenChuHo");
        String stNgayLap = request.getParameter("ngayLap");
        Date ngayLap =new SimpleDateFormat("yyyy-MM-dd").parse(stNgayLap);
        java.sql.Date date = new java.sql.Date(ngayLap.getTime());
        String diaChi = request.getParameter("diaChi");
        HoKhau hoKhau = new HoKhau(ma,tenChuHo,date,diaChi);
        iFamilyDAO.suaHoKhau(hoKhau);
        try {
            response.sendRedirect("/FamilyServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

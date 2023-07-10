package controller;

import dao.IMatBangDAO;
import dao.IMatBangDAOImpl;
import model.MatBang;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "TComplexServlet", value = "/TComplexServlet")
public class TComplexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IMatBangDAO iMatBangDAO;
    public void init() {iMatBangDAO = new IMatBangDAOImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                xoaMatBang(request,response);
                break;
            case "create":
                hienThiFormThem(request,response);
                break;
            default:
                hienThiDSMatBang(request,response);
                break;
        }
    }

    private void hienThiFormThem(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        try{
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void xoaMatBang(HttpServletRequest request, HttpServletResponse response) {
        String ma = request.getParameter("ma");
        iMatBangDAO.xoa(ma);
        try {
            response.sendRedirect("/TComplexServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void hienThiDSMatBang(HttpServletRequest request, HttpServletResponse response) {
        List<MatBang> dsMatBang = iMatBangDAO.layHetMatBang();
        request.setAttribute("danhSachMatBang",dsMatBang);
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
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    themMatBang(request,response);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "search":
                timMatBang(request,response);
                break;
        }
    }

    private void timMatBang(HttpServletRequest request, HttpServletResponse response) {
        int maLoaimatBang = Integer.parseInt(request.getParameter("maLoaiVanPhong"));
        List<MatBang> dsMatBang = new ArrayList<>();
        dsMatBang = iMatBangDAO.timMatBang(maLoaimatBang);
        request.setAttribute("danhSachMatBang",dsMatBang);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

    private void themMatBang(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        String ma =request.getParameter("ma");
        int dienTich = Integer.parseInt(request.getParameter("dienTich"));
        String trangThai = request.getParameter("trangThai");
        int tang = Integer.parseInt(request.getParameter("tang"));
        int loaiVanPhong = Integer.parseInt(request.getParameter("maLoaiVanPhong"));
        int giaThue = Integer.parseInt(request.getParameter("giaThue"));
        String stNgayBatDau = request.getParameter("ngayBatDau");
        Date ngayBatDau = new SimpleDateFormat("yyyy-MM-dd").parse(stNgayBatDau);
        java.sql.Date ngayBD = new java.sql.Date(ngayBatDau.getTime());
        String stNgayKetThuc = request.getParameter("ngayKetThuc");
        Date ngayKetThuc = new SimpleDateFormat("yyyy-MM-dd").parse(stNgayKetThuc);
        java.sql.Date ngayKT = new java.sql.Date(ngayKetThuc.getTime());
        MatBang matBang = new MatBang(ma,dienTich,trangThai,tang,loaiVanPhong,giaThue,ngayBD,ngayKT);
        try {
            iMatBangDAO.themMatBang(matBang);
            response.sendRedirect("/TComplexServlet");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

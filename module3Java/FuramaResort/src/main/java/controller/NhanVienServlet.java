package controller;

import dao.INhanVienDAO;
import dao.INhanVienDAOImpl;
import model.nhanvien.NhanVien;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NhanVienServlet", value = "/NhanVienServlet")
public class NhanVienServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private INhanVienDAO iNhanVienDAO;


    public void init() {
        iNhanVienDAO = new INhanVienDAOImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create": hienThiFormTaoMoi(request,response);break;
            default: hienThiDSNhanVien(request,response);break;
        }
    }

    private void hienThiFormTaoMoi(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/ThemNhanVien.jsp");
        try{
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void hienThiDSNhanVien(HttpServletRequest request, HttpServletResponse response) {
        List<NhanVien> nhanViens = iNhanVienDAO.hienThiDSNhanVien();
        request.setAttribute("DSNhanVien",nhanViens);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/DSNhanVien.jsp");
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
            case "create": themNhanVien(request,response);break;

        }
    }

    private void themNhanVien(HttpServletRequest request, HttpServletResponse response) {

    }
}

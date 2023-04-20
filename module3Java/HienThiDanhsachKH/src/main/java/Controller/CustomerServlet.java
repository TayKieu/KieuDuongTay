package Controller;

import Model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList;
    static {
        customerList = new ArrayList<>();
        customerList.add(new Customer("NVA",15/12/2003,"abc","img1.jpg"));
        customerList.add(new Customer("NVB",15/12/2004,"aadc","img2.jpg"));
        customerList.add(new Customer("NVC",15/12/2005,"asagc","img3.jpg"));
        customerList.add(new Customer("NVD",15/12/2006,"abgdf","img4.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
//        response.sendRedirect("/customer/list.jsp");
        request.getRequestDispatcher("/customer/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/calculate")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float price = Float.parseFloat(request.getParameter("price"));
        float percent = Float.parseFloat(request.getParameter("percent"));

        float discountAmount = (float) (price * percent * 0.01);
        float discountPrice = price - discountAmount;
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>List price: " + price + "</h1>");
        writer.println("<h1>Discount Percent: " + percent + "</h1>");
        writer.println("<h1>Discount amount: " + discountAmount + "</h1>");
        writer.println("<h1>Discount price: " + discountPrice + "</h1>");
        writer.println("</html>");
    }
}

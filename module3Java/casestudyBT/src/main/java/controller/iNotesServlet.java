package controller;

import service.Note.INoteService;
import service.Note.INoteServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "iNotesServlet", value = "/iNotes")
public class iNotesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private INoteService service ;
    public void init(){service = new INoteServiceImpl();}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

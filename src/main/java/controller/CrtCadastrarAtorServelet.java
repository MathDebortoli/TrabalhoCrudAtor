package controller;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.application.AplCadastrarAtor;
import model.domain.DomAtor;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "cadastrarAtor", value = "/cadastrarAtor")
public class CrtCadastrarAtorServelet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String nome = request.getParameter("txt-nome");

        AplCadastrarAtor aplCadastrarAtor = new AplCadastrarAtor();
        DomAtor ator = new DomAtor(nome);
        System.out.println("mec");

        int i = aplCadastrarAtor.removeAtor(ator);
        System.out.println("dale");


        response.sendRedirect("index.jsp");

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}

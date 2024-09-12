package controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.application.AplCadastrarAtor;
import model.domain.DomAtor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "cadastrarAtor", value = "/cadastrarAtor")
public class CrtCadastrarAtorServelet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        String nome = request.getParameter("txt-nome");


        AplCadastrarAtor aplCadastrarAtor = new AplCadastrarAtor();
        List<DomAtor> lista = aplCadastrarAtor.getAtores();
        request.setAttribute("array", lista);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        System.out.println("salve maria");
    }

    public void destroy() {
    }
}

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

        if (nome != null && !nome.isEmpty()) {
            AplCadastrarAtor aplCadastrarAtor = new AplCadastrarAtor();
            DomAtor ator = new DomAtor();
            ator.setNome(nome);
            aplCadastrarAtor.addAtor(ator);
        }

        AplCadastrarAtor aplCadastrarAtor = new AplCadastrarAtor();
        List<DomAtor> lista = aplCadastrarAtor.getAtores();
        request.setAttribute("array", lista);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        AplCadastrarAtor aplCadastrarAtor = new AplCadastrarAtor();

        //Editar
        if (request.getParameter("hid").equals("1")) { //Editar
            int id = Integer.parseInt(request.getParameter("id").trim());
            String nome = request.getParameter("nome").trim();
            DomAtor ator = new DomAtor(nome, id);
            System.out.println("teve game?");
            System.out.println(nome);
            aplCadastrarAtor.editAtor(ator);
        }
        else { //Excluir
            int id = Integer.parseInt(request.getParameter("id").trim());
            String nome = request.getParameter("nome").trim();
            DomAtor ator = new DomAtor(nome, id);
            aplCadastrarAtor.removeAtor(ator);
        }

        List<DomAtor> lista = aplCadastrarAtor.getAtores();
        request.setAttribute("array", lista);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}

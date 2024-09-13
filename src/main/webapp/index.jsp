<%@ page import="model.domain.DomAtor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <title>Cadastrar Ator</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<form method="get" action="cadastrarAtor">
    <div class="fundo">
        <div class="container text-center mt-3">
            <div class="row">
                <div class="col">
                    <h1>Cadastro de Ator</h1>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="nome">Digite o nome do Ator:</label>
                    <input type="text" class="form-control" id="nome" name="txt-nome">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col mb-3">
                    <div class="">
                        <button type="submit" class="btn btn-success" onclick="validarNome()">Cadastrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="fundo">
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <h1>Lista de Atores</h1>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <table id="tabelaAtor" class="table mt-2">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Ações</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%

                            List<DomAtor> lista = (List<DomAtor>) request.getAttribute("array");


                            if (lista != null) {
                                for (DomAtor ator : lista) {
                        %>
                        <tr>
                            <td><%= ator.getId() %></td>
                            <td><%= ator.getNome() %></td>
                            <td>

                                <button type="button" class="btn btn-warning" onclick="editarNome(this)">Editar</button>
                                <button type="button" class="btn btn-danger" onclick="excluirAtor(this)">Excluir</button>
                            </td>
                        </tr>
                        <%
                            }
                        }
                            else {
                        %>
                        <tr>
                            <td colspan="3">Nenhum ator encontrado.</td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</form>

<script>
    let cont = 0;



    function validarNome() {
        let nome = document.getElementById("nome").value;
        if (nome == "") {
            alert("O campo nome é obrigatório!");
        }
    }
    function editarNome(button) {
        var row = button.parentNode.parentNode;
        var cells = row.getElementsByTagName("td");


        var currentValue = cells[1].innerHTML;

        // Substitui o nome por um campo de entrada para edição
        cells[1].innerHTML = '<input type="text" class="edit-input form-control" value="' + currentValue + '">';

        // Substitui os botões "Editar" e "Excluir" pelos botões "Salvar" e "Cancelar"
        var actionsCell = cells[2];
        actionsCell.innerHTML = '<button class="btn btn-success" onclick="salvarEdicao(this)">Salvar</button>' +
            ' <button class="btn btn-danger" onclick="cancelarEdicao(this, \'' + currentValue + '\')">Cancelar</button>';
    }

    function salvarEdicao(button) {
        // Pega a linha da tabela onde o botão "Salvar" foi clicado
        var row = button.parentNode.parentNode;
        var cells = row.getElementsByTagName("td");

        // Pega o valor editado do nome
        var nomeEditado = cells[1].getElementsByTagName("input")[0].value;

        // e substitui
        cells[1].innerHTML = nomeEditado;

        // Restaura os botões "Editar" e "Excluir"
        cells[2].innerHTML = '<button class="btn btn-warning" onclick="editarNome(this)">Editar</button> <button class="btn btn-danger" onclick="excluirContato(this)">Excluir</button>';



    }

    function cancelarEdicao(button, valorOriginal) {
        // Pega a linha da tabela onde o botão "Cancelar" foi clicado
        var row = button.parentNode.parentNode;
        var cells = row.getElementsByTagName("td");


        cells[1].innerHTML = valorOriginal;

        // Restaura os botões "Editar" e "Excluir"
        cells[2].innerHTML = '<button class="btn btn-warning" onclick="editarNome(this)">Editar</button> <button class="btn btn-danger" onclick="excluirContato(this)">Excluir</button>';
    }

    function excluirAtor(button) {
        if (confirm("Tem certeza que deseja excluir este ator?")) {
            var row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }
    }

</script>

</body>
</html>

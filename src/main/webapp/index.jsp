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

<!-- Formulário para cadastro de ator -->
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
</form>

<!-- Lista de atores -->
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
                        // Obtendo a lista de atores da requisição
                        List<DomAtor> lista = (List<DomAtor>) request.getAttribute("array");

                        if (lista != null) {
                            for (DomAtor ator : lista) {
                    %>
                    <tr>
                        <td><%= ator.getId() %>
                        </td>
                        <td><%= ator.getNome() %>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" onclick="editarNome(this)">Editar</button>

                            <!-- Formulário para exclusão de ator -->
                            <form method="post" action="cadastrarAtor" style="display:inline;">
                                <input type="hidden" name="id" value="<%= ator.getId() %>">
                                <input type="hidden" name="nome" value="<%= ator.getNome() %>">
                                <input type="hidden" name="hid" value="2">
                                <button type="submit" class="btn btn-danger">Excluir</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
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

<script>
    // Função para validar o nome no cadastro
    function validarNome() {
        let nome = document.getElementById("nome").value;
        if (nome == "") {
            alert("O campo nome é obrigatório!");
        }
    }

    // Função para editar nome
    function editarNome(button) {
        var row = button.parentNode.parentNode;
        var cells = row.getElementsByTagName("td");

        var currentId = cells[0].innerHTML.trim();  // ID do ator
        var currentValue = cells[1].innerHTML.trim();  // Nome atual do ator

        // Salvar o valor original como um atributo data
        cells[1].setAttribute('data-original', currentValue);

        // Adicionar o campo de edição para o nome
        cells[1].innerHTML = '<input type="text" id="novo" class="edit-input form-control" value="' + currentValue + '">';

        // Adicionar o botão de salvar e cancelar
        cells[2].innerHTML =
            '<form method="post" action="cadastrarAtor" onsubmit="this.nome.value = document.getElementById(\'novo\').value" style="display:inline;">' +
            '<input type="hidden" name="id" value="' + currentId + '">' +
            '<input type="hidden" name="nome">' +  // O valor será atualizado na submissão
            '<input type="hidden" name="hid" value="1">' +
            '<button class="btn btn-warning">Salvar</button>' +
            ' </form>' +
            '<button class="btn btn-danger" onclick="cancelarEdicao(this)">Cancelar</button>';
    }

    // Função para cancelar edição
    function cancelarEdicao(button) {
        var row = button.parentNode.parentNode;
        var cells = row.getElementsByTagName("td");

        // Restaurar o valor original do nome
        var originalValue = cells[1].getAttribute('data-original');
        cells[1].innerHTML = originalValue;

        // Restaurar os botões originais (Editar e Excluir)
        cells[2].innerHTML =
            '<button class="btn btn-primary" onclick="editarNome(this)">Editar</button> ' +
            '<form method="post" action="cadastrarAtor" style="display:inline;">' +
            '<input type="hidden" name="id" value="' + cells[0].innerHTML.trim() + '">' +  // ID do ator
            '<input type="hidden" name="hid" value="2">' +  // Valor de hid para exclusão
            '<button class="btn btn-danger">Excluir</button>' +
            '</form>';
    }




</script>

</body>
</html>

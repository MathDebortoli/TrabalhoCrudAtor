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
                            // Recupere a lista de atores da requisição
                            List<DomAtor> lista = (List<DomAtor>) request.getAttribute("array");

                            // Verifique se a lista não é nula antes de tentar renderizar
                            if (lista != null) {
                                for (DomAtor ator : lista) {
                        %>
                        <script>
                            // Chama a função addTable com os dados dos atores
                        </script>
                        <%
                            }
                        } else {
                        %>
                        <p>Nenhum ator encontrado.</p>
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

    window.onload = function () {
        for(let i = 0; i < 10; i++) {
            addTable();
        }
    }

    function validarNome() {
        let nome = document.getElementById("nome").value;
        if (nome == "") {
            alert("O campo nome é obrigatório!");
        } else {
            addTable(nome, cont + 1); // Passa um ID fictício ou o ID correto
        }
    }

    function addTable(nome, ator) {
        cont++;
        // Obtém a referência da tabela
        let tabela = document.getElementById("tabelaAtor").getElementsByTagName('tbody')[0];

        // Cria uma nova linha na tabela
        let linha = tabela.insertRow();

        // Cria as células na nova linha
        let celula1 = linha.insertCell(0);
        let celula2 = linha.insertCell(1);
        let celula3 = linha.insertCell(2);

        // Adiciona conteúdo nas células
        celula1.innerHTML = ator; // ID do ator
        celula2.innerHTML = nome; // Nome do ator

        // Criando dois formulários separados para cada botão
        celula3.innerHTML = `
        <form action="cadastrarAtor" method="post" style="display:inline;">
        <input type="hidden" name="txt-id" value="${ator}">
        <input type="hidden" name="action" value="excluir">
        <button type="submit" class="btn btn-danger">Excluir</button>
        </form>
        <form action="cadastrarAtor" method="post" style="display:inline;">
        <input type="hidden" name="txt-id" value="${ator}">
        <input type="hidden" name="action" value="alterar">
        <button type="submit" class="btn btn-warning">Alterar</button>
        </form>
        `;
    }
</script>

</body>
</html>

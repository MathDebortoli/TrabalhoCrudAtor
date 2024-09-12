<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
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
                    <div>
                        <table id="tabelaAtor" class="table mt-2 ">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nome</th>
                                <th scope="col">Ações</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
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
        } else {
            addTable();
        }
    }

    function addTable() {
        cont++;
        // Obtém a referência da tabela
        let tabela = document.getElementById("tabelaAtor");


        // Cria uma nova linha na tabela
        let linha = tabela.insertRow(1); // Insere no início da tabela. Use tabela.insertRow() para adicionar no final

        linha.classList.add("borda-linha");

        // Cria as células na nova linha
        let celula1 = linha.insertCell(0);
        let celula2 = linha.insertCell(1);
        let celula3 = linha.insertCell(2);

        // Adiciona conteúdo nas células
        celula1.innerHTML = cont.toString(); // Exemplo de conteúdo
        celula2.innerHTML = document.getElementById("nome").value; // Exemplo de conteúdo

        // Criando dois formulários separados para cada botão
        celula3.innerHTML = `
        <form action="cadastrarAtor" method="post" style="display:inline;">
        <input type="hidden" name="txt-id" value="${cont}">
        <input type="hidden" name="action" value="excluir">
        <button type="submit" class="btn btn-danger">Excluir</button>
         </form>
        <form action="cadastrarAtor" method="post" style="display:inline;">
        <input type="hidden" name="txt-id" value="${cont}">
        <input type="hidden" name="action" value="alterar">
        <button type="submit" class="btn btn-warning">Alterar</button>
        </form>
`;

    }

</script>


</body>

</html>
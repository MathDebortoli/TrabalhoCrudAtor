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
                            <button type="submit" class="btn btn-dark" onclick="validarNome()">Cadastrar</button>
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
        function validarNome() {
            let nome = document.getElementById("nome").value;
            if (nome == "") {
                alert("O campo nome é obrigatório!");
            }
            else{
                addTable();
            }
        }

        function addTable() {
            // Obtém a referência da tabela
            let tabela = document.getElementById("tabelaAtor");

            // Cria uma nova linha na tabela
            let linha = tabela.insertRow(0); // Insere no início da tabela. Use tabela.insertRow() para adicionar no final

            // Cria as células na nova linha
            let celula1 = linha.insertCell(0);
            let celula2 = linha.insertCell(1);
            let celula3 = linha.insertCell(2);

            // Adiciona conteúdo nas células
            celula1.innerHTML = "1"; // Exemplo de conteúdo
            celula2.innerHTML = "Nome"; // Exemplo de conteúdo
            celula3.innerHTML = "<button class='btn btn-danger'>Excluir</button>"; // Botão com classe Bootstrap
        }

    </script>


</body>

</html>
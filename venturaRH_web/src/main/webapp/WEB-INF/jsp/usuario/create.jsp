<%@
        taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>VenturaHR</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <c:import url="/WEB-INF/jsp/nav-bar.jsp"></c:import>

<div class="container">
    <h2>Novo usuário</h2>
    <form action="/usuario/create" method="post">
        <div class="form-group">
            <label>Nome:</label>
            <input type="text" class="form-control" placeholder="Escreva o nome completo" name="nome">
        </div>
        <div class="form-group">
            <label>Contato:</label>
            <input type="text" class="form-control" placeholder="Escreva um contato" name="contato">
        </div>
        <div class="form-group">
            <label>CPF:</label>
            <input type="text" class="form-control" placeholder="Escreva o CPF" name="cpf">
        </div>
        <div class="form-group">
            <label>CNPJ:</label>
            <input type="text" class="form-control" placeholder="Escreva o CNPJ" name="cnpj">
        </div>
        <div class="form-group">
            <label>Endereço:</label>
            <input type="text" class="form-control" placeholder="Escreva o endereço completo" name="endereco">
        </div>
        <div class="form-group">
            <label>Razão Social:</label>
            <input type="text" class="form-control" placeholder="Escreva a razão social" name="razaoSocial">
        </div>
        <div class="form-group">
            <label>E-mail:</label>
            <input type="email" class="form-control" placeholder="Escreva o e-mail" name="email">
        </div>
        <div class="form-group">
            <label>Senha:</label>
            <input type="password" class="form-control" placeholder="Escreva sua senha" name="senha">
        </div>
        <div class="container">

            <div class="radio">
                <label><input type="radio" name="tipo" value="A">Administrador</label>
            </div>
            <div class="radio">
                <label><input type="radio" name="tipo" value="C">Candidato</label>
            </div>
            <div class="radio disabled">
                <label><input type="radio" name="tipo" value="E">Empresa</label>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Concordo com os <a href="#">Termos de uso</a></label>
            </div>

        </div>
        <div>
            <button type="submit" class="btn btn-primary">Enviar</button>
        </div>

    </form>
</div>

private Character tipo;

</body>
</html>


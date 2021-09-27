<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <h2>Login</h2>

    <form action="/login" method="post">
        <div class="form-group">
            <label>E-mail:</label>
            <input type="email" class="form-control" placeholder="Escreva o e-mail" name="email">
        </div>

        <div class="form-group">
            <label>Senha:</label>
            <input type="password" class="form-control" placeholder="Escreva sua senha" name="senha">
        </div>

        <div>
            <button type="submit" class="btn btn-primary">Enviar</button>
        </div>
    </form>
</div>

</body>
</html>


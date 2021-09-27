<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<c:import url="/WEB-INF/jsp/nav-bar.jsp"></c:import>

<div class="container">
    <h2>${usuario.nome}</h2>
    <h2>Lista de Vagas Publicadas <a role="button" href="/empresa/addVaga">+</a> </h2>

    <c:if test="${not empty vagas}">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Id</th>
                <th>Cargo</th>
                <th>Cidade</th>
                <th>Tipo de contrato</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="vaga" items="${vagas}" varStatus="id">
                <tr>
                    <td>${vaga.id}</td>
                    <td>${vaga.cargo}</td>
                    <td>${vaga.cidade}</td>
                    <td>${vaga.tipoDeContrato}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty vagas}">
        <h3>Sem vagas</h3>
    </c:if>
</div>

</body>
</html>


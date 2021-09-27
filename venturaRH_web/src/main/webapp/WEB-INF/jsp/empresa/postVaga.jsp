<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

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
    <h2>Bordered Table</h2>
    <p>The .table-bordered class adds borders to a table:</p>
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
            <td>John</td>
        </tr>
        <tr>
            <td>Mary</td>
        </tr>
        <tr>
            <td>July</td>

        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
</head>
<body>

</body>
</html>

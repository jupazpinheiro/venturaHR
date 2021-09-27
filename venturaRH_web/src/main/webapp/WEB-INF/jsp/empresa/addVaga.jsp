<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <h2>Nova vaga</h2>
    <form action="/empresa/addVaga" method="post">
        <div class="form-group">
            <div>
                <input type="hidden" name="usuarioId" value="${usuario.id}">
            </div>
            <label>Cargo:</label>
            <input type="text" class="form-control" placeholder="Escreva o cargo" name="cargo" value="${vaga.cargo}">
        </div>
        <div class="form-group">
            <label>Cidade</label>
            <input type="text" class="form-control" placeholder="Escreva a cidade" name="cidade" value="${vaga.cidade}">
        </div>
        <div class="form-group">
            <label>Tipo de contrato</label>
            <input type="text" class="form-control" placeholder="Escreva o tipo de contrato" name="tipoDeContrato" value="${vaga.tipoDeContrato}">


        </div>
        <button type ="submit" class="btn btn-primary">Enviar</button>
    </form>

        <c:if test="${not empty vaga}">
            <form action="/empresa/addCriterio" method="post">
                <div class="form-group">
                    <label>Descrição</label>
                    <input type="text" class="form-control" placeholder="Escreva a descrição" name="descricao" value="${criterio.descricao}">


                </div>
                <div class="form-group">
                    <label>Perfil</label>
                    <!--<input type="text" class="form-control" placeholder="Escreva o perfil" name="perfil" value="${criterio.perfil}">-->

                    <select class="form-select" aria-label="Default select example">
                        <option selected value="${criterio.perfil}">Open this select menu</option>
                        <option value="1">Sem experiência</option>
                        <option value="2">Com experiência</option>
                        <option value="3">Mais de +2 anos de experiência</option>
                    </select>

                </div>

                <div class="form-group">
                    <label>Peso</label>
                    <!--<input type="text" class="form-control" placeholder="Escreva o peso" name="peso" value="${criterio.peso}">-->

                    <select class="form-select" aria-label="Default select example">
                        <option selected value="${criterio.peso}">Open this select menu</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>


                </div>
                <button type ="submit" class="btn btn-primary">Adicionar criterio</button>
            </form>
            <form action="/empresa/postarVaga" method="post">
                <button type ="submit" class="btn btn-primary">Publicar vaga</button>
            </form>
        </c:if>

</div>
</body>
</html>
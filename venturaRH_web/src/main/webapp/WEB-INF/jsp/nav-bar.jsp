<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">
                <img src="img/ventura.png" class="img-responsive" loading="lazy" style="display: inline-block; height: 28px; margin-top: -5px" />

                VenturaHR
            </a>
        </div>
        <ul class="nav navbar-nav">
            <c:if test="${not empty usuario}">
                <li><a href="/empresa/addVaga">Nova Vaga</a></li>
                <li><a href="/login">Vagas</a></li>
            </c:if>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${empty usuario}">
                <li><a href="/usuario"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
                <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
            </c:if>
            <c:if test="${not empty usuario}">
                <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span>Logout, ${usuario.email}</a></li>
            </c:if>
        </ul>
    </div>
</nav>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:if test="${empty fornecedores && empty mensagem}">
    <jsp:forward page="listar" />
</c:if>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Talismã</title>
        <!-- --------------------------------------------------------------- -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap.min.js"></script>
        <!-- --------------------------------------------------------------- -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css"/>
        <!-- --------------------------------------------------------------- -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('#fornecedores').DataTable({
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Portuguese-Brasil.json"
                    }
                });
            });
        </script>
    </head>
    <body>
    <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="../index.jsp">Talismã</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Fornecedores</a></li>
                    <li><a href="../contato/index.jsp">Contatos</a></li>
                    <li><a href="../produto/index.jsp">Produtos</a></li>
                    <li><a href="#">Cotações</a></li>
                </ul>
            </div>            
        </div>
    </nav>
    <div class="container">
        <form class="form-horizontal" action="salvar" method="post">
            <input type="hidden" name="id" value="${fornecedor.id}" />
            <div class="form-group">
                <label class="control-label col-sm-2" for="razaoSocial">Razão Social:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="razaoSocial" 
                           placeholder="Digite a Razão Social" value="${fornecedor.razaoSocial}">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="nomeFantasia">Nome de Fantasia:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nomeFantasia" 
                           placeholder="Digite Nome de Fantasia" value="${fornecedor.nomeFantasia}">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="cnpj">CNPJ:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="cnpj" 
                           placeholder="Digite o CNPJ" value="${fornecedor.cnpj}">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Salvar</button>
                </div>
            </div>
        </form>
        <c:choose>
            <c:when test="${not empty fornecedores}">
               
                    <table class="table" id="fornecedores">
                        <thead>
                            <tr>
                                <th>ID</th><th>Razão Social</th><th>Nome Fantasia</th><th>CNPJ</th><th>&nbsp;</th><th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="forn" items="${fornecedores}">
                                <tr>
                                    <td>${forn.id}</td>
                                    <td>${forn.razaoSocial}</td>
                                    <td>${forn.nomeFantasia}</td>
                                    <td>${forn.cnpj}</td>
                                    <td><a href="editar?id=${forn.id}"><span class="glyphicon glyphicon-edit"></span></td>
                                    <td><a href="excluir?id=${forn.id}"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                
            </c:when>
            <c:when test="${not empty mensagem}">
                <h3 style="color: blue">${mensagem}</h3>
            </c:when>
        </c:choose>
    </div>
</body>
</html>

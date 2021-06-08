<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:if test="${empty contatos && empty mensagem}">
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
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <!-- --------------------------------------------------------------- -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/contato.js"></script>
        <!-- --------------------------------------------------------------- -->
                
        <script type="text/javascript">
            $(document).ready(function () {
                $('#contatos').DataTable({
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
                    <li><a href="../fornecedor/index.jsp">Fornecedores</a></li>
                    <li class="active"><a href="index.jsp">Contatos</a></li>
                    <li><a href="#">Produtos</a></li>
                    <li><a href="#">Cotações</a></li>
                </ul>
            </div>            
        </div>
    </nav>
    <div class="container">
        <div class="col-12">
            <form class="form-horizontal" action="salvar" method="post">
                <input type="hidden" name="id" value="${contato.id}" />
                <div class="form-group">
                    <label class="control-label col-sm-2" for="nome">Fornecedor:</label>
                    <div class="col-sm-10">
                        <select name="fornId" id="fornId" class="form-control" required>
                            <option value="">Selecione</option>
                            <c:forEach var="fornecedor" items="${fornecedores}">
                                <option value="${fornecedor.id}">${fornecedor.nomeFantasia}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="nome">Nome:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="nome" id="nome"
                               placeholder="Digite o Nome" value="${contato.nome}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Email:</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" name="email" 
                               placeholder="Digite o Email" value="${contato.email}" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="fone">Telefone:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="fone" id="fone"
                               placeholder="Digite o Telefone" value="${contato.fone}" required>
                    </div>
                </div>
        </div>   
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-success pull-right" style="margin-right: 13px;">Salvar</button>
                <button type="button" class="btn btn-default pull-right" style="margin-right: 13px;">Editar</button>
            </div>
        </div>
    </form>

    <br/>
    <div class="row">
        <div class="col-12">
            <c:choose>
                <c:when test="${not empty contatos}">

                    <table class="table table-hover table-responsive" id="contatos">
                        <thead>
                            <tr>
                                <th>ID</th><th>Vendedor</th><th>Email</th><th>Telefone</th><th>&nbsp;</th><th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="contato" items="${contatos}">
                                <tr>
                                    <td>${contato.id}</td>
                                    <td>${contato.nome}</td>
                                    <td>${contato.email}</td>
                                    <td>${contato.fone}</td>
                                    <td><a href="editar?id=${contato.id}"><span class="glyphicon glyphicon-edit" /></span></a></td>
                                    <td><a href="excluir?id=${contato.id}"><span class="glyphicon glyphicon-remove" /></span></a></td>
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
    </div>      

</div>

</body>
</html>

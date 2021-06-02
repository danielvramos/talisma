<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:if test="${empty fornecedores && empty mensagem}">
    <jsp:forward page="listar_fornecedor" />
</c:if>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Talismã</title>
        <!-- --------------------------------------------------------------- -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>

        <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
        <!-- --------------------------------------------------------------- -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
        <!-- --------------------------------------------------------------- -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('#fornecedores').DataTable({
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Portuguese-Brasil.json"
                    }
                });
            });

            function carregarProdutos() {
                var idFornecedor = $('#selectFornecedor').val();
                editarProduto(0);
                if (idFornecedor > 0) {
                    $.ajax({
                        type: "POST",
                        url: "carregarProdutos",
                        data: {"idFornecedor": idFornecedor},
                        success: function (result) {
                            $('#retornoTabela').html(result);
                        },
                        error: function (e) {
                            $('#retornoTabela').html(JSON.stringify(e, null, 4));
                        }
                    });
                } else {

                    setTimeout(function () {
                        limparTela();
                    }, 300);


                }
            }
            function limparTela() {

                $('#retornoTabela').html("");
                $('#retornoFormulario').html("");

            }
            function editarProduto(id) {
                $.ajax({
                    type: "GET",
                    url: "editar",
                    data: {"id": id},
                    success: function (result) {
                        $('#retornoFormulario').html(result);
                    },
                    error: function (e) {
                        $('#retornoFormulario').html(JSON.stringify(e, null, 4));
                    }
                });
            }
            function salvarProduto() {
                var produto = {"id": $('#id').val(),
                    "nome": $('#nome').val(),
                    "categoria": $('#categoria').val(),
                    "valor": $('#valor').val(),
                    
                    "dataValidade": $('#dataValidade').val()};
                $.ajax({
                    type: "POST",
                    url: "salvar",
                    data: produto,
                    success: function (result) {
                        $('#mensagemSalvar').html(result);
                        $('#mensagemSalvar').addClass("alert-success")
                        $('#mensagemSalvar').removeClass("alert-danger")

                    },
                    error: function (e) {
                        $('#mensagemSalvar').html(JSON.stringify(e, null, 4));
                        $('#mensagemSalvar').addClass("alert-danger")
                        $('#mensagemSalvar').removeClass("alert-success")
                    }
                });

            }
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
                    <li><a href="#">Contatos</a></li>
                    <li><a class="active" href="index.jsp">Produtos</a></li>
                    <li><a href="#">Cotações</a></li>
                </ul>
            </div>            
        </div>
    </nav>
    <div class="container">
        <form class="form-horizontal" action="salvar" method="post">

            <c:choose>
                <c:when test="${not empty fornecedores}">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="selectFornecedor">Fornecedor:</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="selectFornecedor" name="selectFornecedor" onchange="carregarProdutos()" >
                                <option value="0" >Selecione um fornecedor</option>
                                <c:forEach var="forn" items="${fornecedores}">
                                    <option value="${forn.id}">${forn.nomeFantasia}</option>
                                </c:forEach>
                            </select>

                        </div>
                    </div>
                </c:when>
                <c:when test="${not empty mensagem}">
                    <h3 style="color: blue">${mensagem}</h3>
                </c:when>
            </c:choose>

        </form>
        <div id="retornoFormulario"></div>

        <div id="mensagemSalvar" class="alert "></div>

        <div id="retornoTabela"></div>
    </div>
</body>
</html>

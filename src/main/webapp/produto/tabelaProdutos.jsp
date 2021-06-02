<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('#produtos').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Portuguese-Brasil.json"
            }
        });
    });


</script>
<div > 
    
    <c:choose>
        <c:when test="${not empty produtos}">

            <table class="table" id="produtos">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Categoria</th>
                        <th>Valor</th>
                        <th>Validade Cotação</th>
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="produto" items="${produtos}" varStatus="index">
                        <tr>
                            <td>${produto.id}</td>
                            <td>${produto.nome}</td>
                            <td>${produto.categoria}</td>
                            <td>${produto.valor}</td>
                            <td>${produto.dataValidade}</td>
                            <td><span class="glyphicon glyphicon-edit" onclick="editarProduto(${produto.id})"></span></td>
                            <td><a href="excluir?id=${produto.id}"><span class="glyphicon glyphicon-remove"></span></a></td>
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
<script type="text/javascript">
$(function() {
  $('#datetimepicker1').datetimepicker({
                 format: 'YYYY-MM-DD'
             });
});
 
</script>
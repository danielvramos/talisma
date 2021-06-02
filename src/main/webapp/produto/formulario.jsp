<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div > 
    <form class="form-horizontal">
        <input type="hidden" id="id" value="${produto.id}" />
        <div class="form-group">
            <label class="control-label col-sm-4" for="nome">Nome do produto:</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="nome" id="nome" 
                       placeholder="Digite o nome do produto" value="${produto.nome}">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4" for="categoria">Categoria:</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="categoria" id="categoria" 
                       placeholder="Digite a categoria" value="${produto.categoria}">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4" for="valor">Valor Produto:</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="valor"  id="valor" 
                       placeholder="Digite o valor do produto" value="${produto.valor}">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4" for="dataValidade">Validade da cotação:</label>
            <div class="col-sm-8">

                <div class='input-group date' id='datetimepicker1' >
                    <input type='text' class="form-control" id="dataValidade" value="${produto.dataValidade}"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>


            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="button" onclick="salvarProduto()" class="btn btn-default" value="Salvar"/>
                </div>
            </div>
    </form>
    
</div>
<script type="text/javascript">
$(function() {
  $('#datetimepicker1').datetimepicker({
                 format: 'YYYY-MM-DD'
             });
});
 
</script>
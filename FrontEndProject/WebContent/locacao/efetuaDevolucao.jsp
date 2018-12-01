
<%@page import="model.Locacao"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ page import="controller.LocacaoController"%>
<%@ page import="java.util.List"%>


<%
	String situacao = "ATIVO";

	int limitePorPagina = 10;
	int paginaAtual;
	if (request.getParameter("pag") != null)
		paginaAtual = Integer.parseInt(request.getParameter("pag"));
	else
		paginaAtual = 1;

	LocacaoController app = new LocacaoController();
	List<Locacao> lista = app.listar(paginaAtual,limitePorPagina, situacao);

	String success = "";
	if (request.getSession().getAttribute("success") != null ){
		success = (String)request.getSession().getAttribute("success");
		request.getSession().setAttribute("success", null);
	}
%>

<div class="container">
<% if (success.length() > 0) { %>
	<div class="card-panel green lighten-4 green-text text-darken-4"><%= success %></div>
 <% } %>
	
	<div class="row">

		<div class="col-md-6">
			<h4>Locações Ativas</h4>
		</div>
		
<!-- 		<div class="col-md-6 text-right"> -->
<%-- 			<a href="<%=request.getContextPath()%>/locacao/efetuaLocacao.jsp" --%>
<!-- 				class="btn waves-effect waves-light indigo tooltipped" data-position="bottom" data-delay="50" data-tooltip="Cadastrar"><i class="mdi-content-add"></i>Incluir</a> -->
<!-- 		</div> -->

		<div class="col-md-12">
			<table class="table hoverable striped responsive-table">
				<thead>
					<th>Equipamento</th>
					<th>Cliente</th>
					<th>Telefone</th>
					<th>Contato</th>
					<th>Retirada</th>
					<th>Devolução</th>

					<th>Ação</th>
					
				</thead>
				<tbody>
					<%
					if(lista != null)
						for(Locacao dado : lista) {
					%>
					<tr>
						<td><%= dado.getEquipamento().getCodigo() %> <%= dado.getEquipamento().getDescricao() %></td>
						<td><%= dado.getCliente().getNome() %></td>
						<td><%= dado.getCliente().getTelefone()%> / <%= dado.getCliente().getCelular()%></td>
						<td><%= dado.getCliente().getContato()%> -  <%= dado.getCliente().getTelefoneContato()%></td>
						<td><%= dado.getDataRetirada()%></td>
						<td><%= dado.getDataDevolucao()%></td>
					
						<td class="mw-200">
							<a	href="<%=request.getContextPath()%>/locacao/efetivaDevolucao.jsp?id=<%=dado.getId() %>"
							class="btn-floating waves-effect waves-light teal tooltipped" data-position="bottom" data-delay="50" data-tooltip="Efetivar Devolução"
							><i class="mdi-navigation-check"></i></a>
							
							<a href="<%=request.getContextPath()%>/locacao/efetivaCancelamento.jsp?id=<%=dado.getId() %>"
								class="btn-floating waves-effect waves-light orange tooltipped" data-position="bottom" data-delay="50" data-tooltip="Cancelar" >
								<i class="mdi-navigation-cancel"></i></a> 
							
							
						</td>
					</tr>
					<% } %>
				</tbody>

			</table>
		</div>


		<div class="col-md-12 text-center">

			<button onclick="paginaAnterior('<%=request.getContextPath()%>/locacao/consultaLocacao.jsp',<%=paginaAtual%>)" type="button"
				<%if (paginaAtual == 1)
				         out.print("disabled"); %>
				class="btn waves-effect waves-light indigo"><i class="mdi-av-fast-rewind"></i> Anterior</button>
			<button onclick="proximaPagina('<%=request.getContextPath()%>/locacao/consultaLocacao.jsp',<%=paginaAtual%>)" type="button"
				<%if (lista == null || lista.size() < limitePorPagina)
				         out.print("disabled");
			          else if (lista.size() == 0)
				               out.print("disabled");%>
				class="btn waves-effect waves-light indigo">Próxima <i class="mdi-av-fast-forward"></i></button>
		</div>
	</div>
</div>

<!-- 		Modal do Cancelamento -->
          <div id="modalCancelamento" class="modal modal-fixed-footer">
              <div class="modal-header">
              <div class="center-align ">
              	<h4>Cancelamento de Locação</h4>
              </div>
              </div>
              <div class="modal-content">
                <input type="hidden" id="idCancelamento" />
                	
				 <p class="flow-text" id="textoCancelamento"></p>
				    
              </div>
              <div class="modal-footer">
                <a href="#"  class="verificaRecarregamento waves-effect waves-red btn-flat modal-action modal-close">Voltar</a>
                <a href="#" id="btnEfetivaCancelamento" onclick="efetivaCancelamento()" class="waves-effect waves-green btn-flat modal-action">Efetuar Cancelamento</a>
              </div>
            </div>
<!--             Modal do Cancelamento -->



<script>

var recarregar = false;

function setIdCancelamento(id){
	$('#idCancelamento').val(id);
	texto = $('#textoCancelamento');
	
	$.ajax({
        method: "GET",
        timeout: 5000,
        url: "http://localhost:8080/FuncionarioBack/api/locacao/buscar?id="+id,
        beforeSend: function () {
            texto.html("Carregando...");

        },
        success: function (data) {
        	var descricao = "Tem certeza que deseja cancelar a locação:<br>";
        	descricao += "Locação: "+data.id +" - Cliente: "+data.cliente.nome +"<br>";
        	descricao += "Equipamento: " + data.equipamento.codigo + " - " + data.equipamento.descricao + "<br>";
        	descricao += "Entregue por: " + data.funcionarioRetirada.nome+"<br>";
        	descricao += "Data: " + data.dataRetirada+"<br>";
        	descricao += "Valor: " + data.valorLocacao.toFixed(2)+"<br>";
            texto.html(descricao);

        },
        error: function (msg) {
			texto.html("Erro, não prossiga");


        }
    });
	
	}

	function efetivaCancelamento(){
		var id = $('#idCancelamento').val();
		texto = $('#textoCancelamento');
		$.ajax({
	        method: "GET",
	        timeout: 60000,
	        url: "http://localhost:8080/Front/locacao/processarLocacao.jsp?acao=2&id="+id,
	        beforeSend: function () {
	            texto.html("Efetivando Cancelamento");

	        },
	        success: function (data) {
	        	texto.html("Cancelamento Efetivado");
	        	$('#idCancelamento').val();
	        	$('#btnEfetivaCancelamento').prop("disabled", true);
	        	$('#btnEfetivaCancelamento').hide();
	        	recarregar = true;
	        	
	        },
	        error: function (msg) {
				texto.html("Erro ao Efetuar o cancelamento");
				
				


	        }
	    });
	}
		        
	function setIdDevolucao(id){
		$('#idDevolucao').val(id);
		
		
		 
	}

	$('.verificaRecarregamento').click(function(){
			if(recarregar)
				location.reload();

		
	});
	
	$("#situacao").change(function(){
		var link = $('#situacao').val();
		if (link != ""){
			link = "<%=request.getContextPath()%>/locacao/consultaLocacao.jsp?situacao="+link;
		}else{
			link = "<%=request.getContextPath()%>/locacao/consultaLocacao.jsp";
		}
		
		window.location.replace(link);
	});
	
</script>


<%@ include file="/estrutura/footer.jsp"%>
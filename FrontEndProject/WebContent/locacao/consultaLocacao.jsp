
<%@page import="model.Locacao"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ page import="controller.LocacaoController"%>
<%@ page import="java.util.List"%>


<%
	String situacao = request.getParameter("situacao");

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
			<h4>Consulta de locação</h4>
		</div>
		
<!-- 		<div class="col-md-6 text-right"> -->
<%-- 			<a href="<%=request.getContextPath()%>/locacao/efetuaLocacao.jsp" --%>
<!-- 				class="btn waves-effect waves-light indigo tooltipped" data-position="bottom" data-delay="50" data-tooltip="Cadastrar"><i class="mdi-content-add"></i>Incluir</a> -->
<!-- 		</div> -->
		<div class="col-md-6 text-right">
		<label for="situacao">Filtrar por Situação:</label>
		<select  id="situacao" name="situacao">
			<option value="" selected >Todos</option>
			<option value="ATIVO" <%= (situacao == "ATIVO") ? "selected": "" %>    >ATIVO</option>
			<option value="DEVOLVIDO" <%= (situacao == "DEVOLVIDO") ? "selected": "" %>>DEVOLVIDO</option>
			<option value="CANCELADO"<%= (situacao == "CANCELADO") ? "selected": "" %> >CANCELADO</option>
		</select>			
		</div>
		<div class="col-md-12">
			<table class="table hoverable striped responsive-table">
				<thead>
					<th>Equipamento</th>
					<th>Cliente</th>
					<th>Telefone</th>
					<th>Contato</th>
					<th>Retirada</th>
					<th>Devolução</th>
					<th>Situação</th>
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
						<td><%= dado.getSituacao()%></td>
<!-- 						<td class="mw-200"> -->
<!-- 						<a -->
<%-- 							href="<%=request.getContextPath()%>/locacao/cadastroLocacao.jsp?id=<%=dado.getId() %>" --%>
<!-- 							class="btn-floating waves-effect waves-light orange tooltipped" data-position="bottom" data-delay="50" data-tooltip="Editar" > -->
<!-- 							<i class="mdi-image-edit"></i></a>  -->
							
<!-- 							<a							 -->
<%-- 							href="<%=request.getContextPath()%>/locacao/processarLocacao.jsp?acao=remove&id=<%=dado.getId() %>" --%>
<!-- 							onclick="return confirmacaoDelecao()" class="btn-floating waves-effect waves-light red tooltipped" data-position="bottom" data-delay="50" data-tooltip="Excluir" -->
<!-- 							><i class="mdi-action-delete"></i></a> -->
<!-- 						</td> -->
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

<script>
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
<%@page import="model.Cliente"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ page import="controller.ClienteController"%>
<%@ page import="java.util.List"%>


<%
	int limitePorPagina = 10;
	int paginaAtual;
	if (request.getParameter("pag") != null)
		paginaAtual = Integer.parseInt(request.getParameter("pag"));
	else
		paginaAtual = 1;
%>

<%
	ClienteController app = new ClienteController();
	List<Cliente> lista = app.listar(paginaAtual,limitePorPagina);
%>

<div class="container">
	<div class="row">

		<div class="col-md-6">
			<h4>Clientes</h4>
		</div>
		<div class="col-md-6 text-right">
			<a href="<%=request.getContextPath()%>/cliente/cadastroCliente.jsp"
				class="btn waves-effect waves-light indigo tooltipped" data-position="bottom" data-delay="50" data-tooltip="Cadastrar"><i class="mdi-content-add"></i>Incluir</a>
		</div>
		<div class="col-md-12">
			<table class="table hoverable striped responsive-table">
				<thead>
					<th>Nome</th>
					<th>Local</th>
					<th>Telefone</th>
					<th>Contato</th>
					<th>Email</th>
					<th class="mw-200">Ação</th>
				</thead>
				<tbody>
					<%
					if(lista != null)
						for(Cliente dado : lista) {
					%>
					<tr>
						<td><%= dado.getNome()%> <%= dado.getSobrenome()%> </td>
						<td><%= dado.getBairro() %> - <%= dado.getCidade()%></td>
						<td><%= dado.getTelefone()%> / <%= dado.getCelular() %></td>
						<td><%= dado.getContato()%> - <%= dado.getTelefoneContato() %></td>
						<td><%= dado.getEmail() %></td>
						<td class="mw-200">
						<a
							href="<%=request.getContextPath()%>/cliente/cadastroCliente.jsp?id=<%=dado.getId() %>"
							class="btn-floating waves-effect waves-light orange tooltipped" data-position="bottom" data-delay="50" data-tooltip="Editar" >
							<i class="mdi-image-edit"></i></a> 
							
							<a							
							href="<%=request.getContextPath()%>/cliente/processarCliente.jsp?acao=remove&id=<%=dado.getId() %>"
							onclick="return confirmacaoDelecao()" class="btn-floating waves-effect waves-light red tooltipped" data-position="bottom" data-delay="50" data-tooltip="Excluir"
							><i class="mdi-action-delete"></i></a>
						</td>
					</tr>
					<% } %>
				</tbody>

			</table>
		</div>


		<div class="col-md-12 text-center">

			<button onclick="paginaAnterior('<%=request.getContextPath()%>/cliente/consultaCliente.jsp',<%=paginaAtual%>)" type="button"
				<%if (paginaAtual == 1)
				         out.print("disabled"); %>
				class="btn waves-effect waves-light indigo"><i class="mdi-av-fast-rewind"></i> Anterior</button>
			<button onclick="proximaPagina('<%=request.getContextPath()%>/cliente/consultaCliente.jsp',<%=paginaAtual%>)" type="button"
				<%if (lista == null || lista.size() < limitePorPagina)
				         out.print("disabled");
			          else if (lista.size() == 0)
				               out.print("disabled");%>
				class="btn waves-effect waves-light indigo">Próxima <i class="mdi-av-fast-forward"></i></button>
		</div>
	</div>
</div>


<%@ include file="/estrutura/footer.jsp"%>
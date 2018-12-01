<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>



<div class="container">
	<div class="row">
		<div class="col-md-12">
			
			<h1>Mensagem</h1>

	<div class="alert alert-danger" role="alert">
	  <% 
	  String msg = request.getParameter("msg");
	  if(msg != null)
		  if(msg.equals("permissaocliente")){
			  out.print("Você não tem permissão para acessar esta página, pois não é um cliente!");
		  }else if(msg.equals("permissaofornecedor")){
			  out.print("Você não tem permissão para acessar esta página, pois não é um fornecedor!");
		  }
	  %>
	</div>

		</div>
	</div>
</div>

<%@ include file="/estrutura/footer.jsp"%>
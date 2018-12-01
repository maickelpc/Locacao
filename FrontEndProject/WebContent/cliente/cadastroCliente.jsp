<%@ include file="/login/controleAcesso.jsp"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>


<%@ page import="controller.ClienteController"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Cliente"%>

<%
	Cliente dado = new Cliente();
	ClienteController controller = new ClienteController();
	List<String> erros;
	
	if (request.getSession().getAttribute("erros") != null ){
		erros = (List<String>)request.getSession().getAttribute("erros");
		request.getSession().setAttribute("erros", null);
		
		dado = (Cliente)request.getSession().getAttribute("object");
	}else{
		erros = new ArrayList<String>();
	
		if (request.getParameter("id") != null){
			try{
				dado = controller.buscarClientePorId(Integer.parseInt(request.getParameter("id")));
				if (dado == null)
					throw new Exception("Usuário não encontrado");
			}catch(Exception e){
				erros.add("Erro ao recuperar o usuário: " + e.getMessage());
				dado = new Cliente();
			}
		}
	}

%>
<div class="row">
        <div class="col s12 m12 l12">
            <div class="card-panel">
                <h4 class="header2"><i class="mdi-social-domain"></i>Cadastro de Cliente</h4>

                <form class="col s12" role="form" action="<%=request.getContextPath()%>/cliente/processarCliente.jsp?acao=1" method="POST">

				<input type="hidden" name="id" value="<%= dado.getId() %>">
				<div class="row" style="margin-top: 2em">
				
					<% if (erros.size() > 0){ %>
				    <div class="card-panel red lighten-2"">
				            <ul> 
				            <% for (int i = 0; i < erros.size(); i++){ %>
				            	<li> <% out.print(erros.get(i).toString()); %> </li>
				            	<% }; %>
				            </ul>
				        </div>
				   <% }; %>
				
				    <div class="input-field col s6">
				        <input id="nome" name="nome" min="3" maxlength="40" type="text"
				               required value="<%= dado.getNome()%>">
				        <label class="active" for="nome">Nome</label>
				    </div>
				
				    <div class="input-field col s6">
				        <input id="sobrenome" name="sobrenome" min="3" maxlength="60" type="text"
				                value="<%= dado.getSobrenome()%>">
				        <label class="active" for="sobrenome">Sobrenome</label>
				    </div>
				</div>

				<div class="row">
				    <div class="input-field col s3">
				        <input name="telefone" type="text" class="telefone" value="<%= dado.getTelefone() %>">
				        <label class="active" for="telefone">Telefone</label>
				    </div>
				    
					<div class="input-field col s3">
				        <input id="celular" name="celular" class="telefone"  type="text" value="<%= dado.getCelular() %>">
				        <label class="active" for="celular">Celular</label>
				    </div>
				
				    <div class="input-field col s3">
				        <input id="contato" name="contato" min="3" maxlength="60" type="text" value="<%= dado.getContato()%>">
				        <label class="active" for="contato">Contato</label>
				    </div>
				    
				    <div class="input-field col s3">
				        <input id="telefoneContato" name="telefoneContato" class="telefone" type="text" value="<%= dado.getTelefoneContato()%>">
				        <label class="active" for="telefoneContato">Telefone</label>
				    </div>
				</div>
				
				<div class="row">
					<div class="input-field col s6">
				        <input id="email" name="email" type="email" value="<%= dado.getEmail()%>">
				        <label class="active" for="email">Email</label>
				    </div>
				
				    <div class="input-field col s3">
				        <input id="cpfCnpj" name="cpfCnpj" class="cnfCnpj" type="text" value="<%= dado.getCpfCnpj()%>">
				        <label class="active" id="labelCpfCnpj" for="cpfCnpj">CPF / CNPJ</label>
				    </div>
				    
				    <div class="input-field col s3">
				        <input id="rgie" name="rgie" type="text" value="<%= dado.getRgie()%>">
				        <label class="active" for="rgie">RG / IE</label>
				    </div>
				</div>
				
				<div class="row">
				    <div class="input-field col s2">
				        <input name="cep" id="cep" maxlength="9" type="text" class="cep" value="<%= dado.getCep() %>">
				        <label class="active" for="cep">CEP</label>
				    </div>
				    
				    <div class="input-field col s4">
				        <input name="endereco" id="endereco" maxlength="255" type="text" class="" value="<%= dado.getEndereco() %>">
				        <label id="enderecoLabel" for="telefone">Endereço</label>
				    </div>
				    
				    <div class="input-field col s2">
				        <input name="numero" maxlength="255" type="text" class="" value="<%= dado.getNumero() %>">
				        <label id="numeroLabel" for="numero">Numero</label>
				    </div>
				
				    <div class="input-field col s4">
				        <input id="complemento" name="complemento" type="text" value="<%= dado.getComplemento() %>">
				        <label class="active" for="complemento">Complemento</label>
				    </div>
				</div>
				
				<div class="row">
				    <div class="input-field col s3">
				        <input name="bairro" id="bairro" maxlength="9" type="text" class="" value="<%= dado.getBairro() %>">
				        <label id="bairroLabel" for="bairro">Bairro</label>
				    </div>
				    
				    <div class="input-field col s3">
				        <input name="cidade" id="cidade" maxlength="255" type="text" class="" value="<%= dado.getCidade() %>">
				        <label id="cidadeLabel" for="cidade">Cidade</label>
				    </div>
				
				    <div class="input-field col s3">
				        <input id="estado" name="estado" type="text" value="<%= dado.getEstado() %>">
				        <label id="estadoLabel" for="estado">Estado</label>
				    </div>
				    
				    <div class="input-field col s3">
				        <input id="pais" name="pais" type="text" value="<%= dado.getPais() %>">
				        <label id="paisLabel" class="active" for="pais">Pais</label>
				    </div>
				</div>


                    <div class="row">
                        <div style="text-align: center">
                            <a href="<%=request.getContextPath()%>/cliente/consultaCliente.jsp" class="btn orange waves-effect waves-light"><i class="mdi-navigation-cancel left"></i>Cancelar</a>
                            <button type="submit" class="btn cyan waves-effect waves-light"  value="foo" name="action">Salvar
                                <i class="mdi-content-send right"></i>
                            </button>
                        </div>
                    </div>

                </form>

                <!-- /.col-lg-6 (nested) -->
            </div>
        </div>
    </div>

<script type="text/javascript">

$('#cpfCnpj').keyup(function (){
	mascararCpfCnpj();
});

$('#cep').blur(function () {
	buscarCep();
	
});



</script>

<%@ include file="/estrutura/footer.jsp"%>
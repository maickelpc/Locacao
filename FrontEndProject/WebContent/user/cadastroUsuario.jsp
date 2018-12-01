<%@ include file="/login/controleAcesso.jsp"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>


<%@ page import="controller.UserController"%>
<%@ page import="java.util.List"%>
<%@ page import="model.UserModel"%>

<%
	UserModel dado = new UserModel();
	UserController controller = new UserController();
	List<String> erros;
	
	if (request.getSession().getAttribute("erros") != null ){
		erros = (List<String>)request.getSession().getAttribute("erros");
		request.getSession().setAttribute("erros", null);
		
		dado = (UserModel)request.getSession().getAttribute("object");
	}else{
		erros = new ArrayList<String>();
	
		if (request.getParameter("id") != null){
			try{
				dado = controller.buscarUserPorId(Integer.parseInt(request.getParameter("id")));
				if (dado == null)
					throw new Exception("Usuário não encontrado");
			}catch(Exception e){
				erros.add("Erro ao recuperar o usuário: " + e.getMessage());
				dado = new UserModel();
			}
		}
	}

%>
<div class="row">
        <div class="col s12 m12 l12">
            <div class="card-panel">
                <h4 class="header2"><i class="mdi-action-account-circle"></i>Cadastro de Usuário</h4>

                <form class="col s12" role="form" action="<%=request.getContextPath()%>/user/processarUsuario.jsp?acao=1" method="POST">

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
				        <input id="name" name="name" min="3" maxlength="40" type="text"
				               required value="<%= dado.getName() %>">
				        <label class="active" for="name">Nome</label>
				    </div>
				
				    <div class="input-field col s6">
				        <input id="sobrenome" name="lastName" min="3" maxlength="60" type="text"
				                value="<%= dado.getLastname()%>">
				        <label class="active" for="sobrenome">Sobrenome</label>
				    </div>
				</div>
				<div class="row">
				    <div class="input-field col s12">
				        <input id="email" type="email"
				               required name="email" value="<%= dado.getEmail() %>">
				        <label class="active" for="email">Email / Login</label>
				    </div>
				</div>
				<div class="row">
				    <div class="input-field col s6">
				        <input name="telefone" maxlength="20" type="text" class="telefone" value="<%= dado.getTelefone() %>">
				        <label class="active" for="telefone">Telefone</label>
				    </div>
				
				    <div class="input-field col s6">
				        <input id="celular" name="celular" class="telefone" min="3" maxlength="60" type="text" value="<%= dado.getCelular() %>">
				        <label class="active" for="celular">Celular</label>
				    </div>
				</div>

                    <div class="row">
                        <div style="text-align: center">
                            <a href="<%=request.getContextPath()%>/user/consultaUsuario.jsp" class="btn orange waves-effect waves-light"><i class="mdi-navigation-cancel left"></i>Cancelar</a>
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


<%@ include file="/estrutura/footer.jsp"%>
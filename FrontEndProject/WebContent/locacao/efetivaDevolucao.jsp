

<%@page import="model.Equipamento"%>
<%@page import="model.Cliente"%>
<%@page import="controller.UserController"%>
<%@page import="controller.EquipamentoController"%>
<%@page import="controller.ClienteController"%>
<%@page import="controller.LocacaoController"%>
<%@page import="model.Locacao"%>
<%@page import="model.Funcionario"%>
<%@page import="model.Empresa"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ page import="controller.EmpresaController"%>

<%@ page import="controller.FuncionarioController"%>
<%@ page import="java.util.List"%>


<%


	
	LocacaoController controller = new LocacaoController();
	Locacao dado = controller.buscarLocacaoPorId(Integer.parseInt(request.getParameter("id")));
	List<String> erros;
	if (request.getSession().getAttribute("erros") != null ){
		erros = (List<String>)request.getSession().getAttribute("erros");
		request.getSession().setAttribute("erros", null);
		
		//dado = (Locacao)request.getSession().getAttribute("object");
	}else{
		erros = new ArrayList<String>();
	
	}
	
	ClienteController clienteController = new ClienteController();
	FuncionarioController funcionarioController = new FuncionarioController();
	EquipamentoController equipamentoController = new EquipamentoController();
	UserController userController = new UserController();
	
	List<Cliente> clientes = clienteController.listar(1, 1000);
	List<Equipamento> equipamentos = equipamentoController.listarDisponiveis(1, 1000);
	List<Funcionario> funcionarios = funcionarioController.listar(1, 1000);
	
	
	

%>
<div class="row">
        <div class="col s12 m12 l12">
            <div class="card-panel">
                <h4 class="header2"><i class="mdi-action-account-circle"></i>Devolução de Equipamento</h4>

                <form class="col s12" role="form" action="<%=request.getContextPath()%>/locacao/processarLocacao.jsp?acao=3" method="POST">

		
				<input type="text" hidden name="id" value="<%= dado.getId() %>">
				<div class="row" style="margin-top: 2em">
				
					<% if (erros.size() > 0) { %>
				    <div class="card-panel red lighten-2"">
				            <ul> 
				            <% for (int i = 0; i < erros.size(); i++){ %>
				            	<li> <% out.print(erros.get(i).toString()); %> </li>
				            	<% }; %>
				            </ul>
				        </div>
					<% }; %>
				
				
				<div class="row">
				    <div class="input-field col s12">
				       
	                    <label for="funcionarioDevolucaoId" class="active">Responsável pela Devolução</label>
	                    <select  id="funcionarioDevolucaoId" name="funcionarioDevolucaoId" required>
	                      <option disabled selected>Selecione o Responsavel pela Devolução</option>
	                  		<% for(int i = 0; i < funcionarios.size(); i++){ %>
	                      <option value="<%= funcionarios.get(i).getId() %>" ><%= funcionarios.get(i).getNome() %> -  <%= funcionarios.get(i).getSobrenome() %>  </option>
	              			<% }; %>
	                    </select>
	                  
				    </div>
				</div>
				<div class="row">
				
					<div class="input-field col s6">
						<input type="checkbox" class="filled-in" id="filled-in-box" name="isDanificado" value="1">
						<label for="filled-in-box">Houve Dano no equipamento</label>
				    </div>
				    <div class="input-field col s6">
				        <input id="qtdeDiarias" name="qtdeDiarias" required  class="date" type="number" step="1" value="<%= dado.getQtdeDiarias() %>" >
				        <label class="active" for="qtdeDiarias">Quantidade de Diárias Extas</label>
				    </div>
				  
				</div>
		
		
		
				<hr>
				<h5>Dados da Locação</h5>		
				<hr>
				<div class="row">
	            	<div class="input-field col s12">
				       
	                    <label for="clienteId" class="active">Cliente</label>
	                    <input id="clienteId" readonly type="text"  value="<%= dado.getCliente().getNome() + " " + dado.getCliente().getSobrenome()  %>">
	                  
				    </div>
		            
				</div>
				<div class="row">
				    <div class="input-field col s12">
				       
	                    <label for="equipamentoId" class="active">Equipamento</label>
	                    <input id="equipamentoID" readonly type="text" value="<%= dado.getEquipamento().getCodigo() + " " + dado.getEquipamento().getDescricao()  %>" >
	                  
				    </div>
				</div>
				<div class="row">
				    <div class="input-field col s12">
				       
	                    <label for="funcionarioRetiradaId" class="active">Responsável pela Entrega</label>
	  					<input id="dataRetirada" readonly type="text"value="<%= dado.getFuncionarioRetirada().getNome() + " -  " + dado.getFuncionarioRetirada().getCelular()  %>" >
	                  
				    </div>
				</div>
				<div class="row">
				
				    <div class="input-field col s4">
				        <input id="dataRetirada" readonly class="date" type="text" value="<%= dado.getDataRetirada() %>" >
				        <label class="active" for="dataRetirada">Data de Retirada</label>
				    </div>
				    <div class="input-field col s4">
				        <input id="prazo" name="prazo" readonly type="text" value="<%= dado.getPrazo() %>" >
				        <label class="active" for="prazo">Prazo (dias)</label>
				    </div>
				    <div class="input-field col s4">
				        <input id="dataDevolucao" name="dataDevolucao" readonly class="date" type="text" value="<%= dado.getDataDevolucao() %>" >
				        <label class="active" for="dataDevolucao">Data de Devolução</label>
				    </div>
					
				  
				</div>
				<div class="row">
				
				    <div class="input-field col s4">
				        <input id="valorLocacao" name="valorLocacao" readonly type="text" class="monetario" value="<%= dado.getValorLocacao() %>" >
				        <label class="active" for="valorLocacao">Valor da Locação</label>
				    </div>
				    <div class="input-field col s4">
				        <input id="valorDanificado" name="valorDanificado" type="text" class="monetario" readonly value="<%= dado.getValorDanificado() %>" >
				        <label class="active" for="valorDanificado">Valor caso Danos no equipamento</label>
				    </div>
				    <div class="input-field col s4">
				        <input id="valorDiaria" name="valorDiaria" type="text" class="monetario" readonly value="<%= dado.getValorDiaria() %>" >
				        <label class="active" for="valorDiaria">Valor Diárias por atraso</label>
				    </div>
					
				  
				</div>
				<div class="row">
				
				    <div class="input-field col s12">
				        <input id="observacoes" name="observacoes" type="text" readonly value="<%= dado.getObservacoes() %>" >
				        <label class="active" for="observacoes">Obsevações</label>
				    </div>

					
				  
				</div>
				
				</div>

                    <div class="row">
                        <div style="text-align: center">
                            <a href="<%=request.getContextPath()%>/locacao/efetuaDevolucao.jsp" class="btn orange waves-effect waves-light"><i class="mdi-navigation-cancel left"></i>Voltar</a>
                            <button type="submit" class="btn cyan waves-effect waves-light"  value="foo" name="action">Confirmar Devolução
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
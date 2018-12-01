

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


	Locacao dado = new Locacao();
	LocacaoController controller = new LocacaoController();
	List<String> erros;
	if (request.getSession().getAttribute("erros") != null ){
		erros = (List<String>)request.getSession().getAttribute("erros");
		request.getSession().setAttribute("erros", null);
		
		dado = (Locacao)request.getSession().getAttribute("object");
	}else{
		erros = new ArrayList<String>();
	
	}
	
	ClienteController clienteController = new ClienteController();
	FuncionarioController funcionarioController = new FuncionarioController();
	EquipamentoController equipamentoController = new EquipamentoController();
	//UserController userController = new UserController();
	
	List<Cliente> clientes = clienteController.listar(1, 1000);
	List<Equipamento> equipamentos = equipamentoController.listarDisponiveis(1, 1000);
	List<Funcionario> funcionarios = funcionarioController.listar(1, 1000);
	
	

%>
<div class="row">
        <div class="col s12 m12 l12">
            <div class="card-panel">
                <h4 class="header2"><i class="mdi-action-account-circle"></i>Nova Locação</h4>

                <form class="col s12" role="form" action="<%=request.getContextPath()%>/locacao/processarLocacao.jsp?acao=1" method="POST">

			
				<input type="hidden" name="id" value="<%= dado.getId() %>">
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
				       
	                    <label for="clienteId" class="active">Cliente</label>
	                    <select id="clienteId" name="clienteId" required>
	                      <option disabled selected>Selecione um Cliente</option>
	                  		<% for(int i = 0; i < clientes.size(); i++){ %>
	                      <option value="<%= clientes.get(i).getId() %>"><%= clientes.get(i).getNome() %> <%= clientes.get(i).getSobrenome() %>  </option>
	              			<% }; %>
	                    </select>
	                  
				    </div>
		            
				</div>
				<div class="row">
				    <div class="input-field col s12">
				       
	                    <label for="equipamentoId" class="active">Equipamento</label>
	                    <select id="equipamentoId" name="equipamentoId" required>
	                      <option disabled selected>Selecione um Equipamento</option>
	                  		<% for(int i = 0; i < equipamentos.size(); i++){ %>
	                      <option value="<%= equipamentos.get(i).getId() %>"><%= equipamentos.get(i).getCodigo() %> -  <%= equipamentos.get(i).getDescricao() %>  </option>
	              			<% }; %>
	                    </select>
	                  
				    </div>
				</div>
				<div class="row">
				    <div class="input-field col s12">
				       
	                    <label for="funcionarioRetiradaId" class="active">Responsável pela Entrega</label>
	                    <select id="funcionarioRetiradaId" name="funcionarioRetiradaId" required>
	                      <option disabled selected>Selecione o Responsavel pela Entrega</option>
	                  		<% for(int i = 0; i < funcionarios.size(); i++){ %>
	                      <option value="<%= funcionarios.get(i).getId() %>"><%= funcionarios.get(i).getNome() %> -  <%= funcionarios.get(i).getSobrenome() %>  </option>
	              			<% }; %>
	                    </select>
	                  
				    </div>
				</div>
				<div class="row">
				
				    <div class="input-field col s4">
				        <input id="dataRetirada" readonly class="date" type="text" >
				        <label class="active" for="dataRetirada">Data de Retirada</label>
				    </div>
				    <div class="input-field col s4">
				        <input id="prazo" name="prazo" readonly type="text" >
				        <label class="active" for="prazo">Prazo (dias)</label>
				    </div>
				    <div class="input-field col s4">
				        <input id="dataDevolucao" name="dataDevolucao" required class="date" type="text" >
				        <label class="active" for="dataDevolucao">Data de Devolução</label>
				    </div>
					
				  
				</div>
				<div class="row">
				
				    <div class="input-field col s4">
				        <input id="valorLocacao" name="valorLocacao" type="text" class="monetario" >
				        <label class="active" for="valorLocacao">Valor da Locação</label>
				    </div>
				    <div class="input-field col s4">
				        <input id="valorDanificado" name="valorDanificado" type="text" class="monetario" >
				        <label class="active" for="valorDanificado">Valor caso Danos no equipamento</label>
				    </div>
				    <div class="input-field col s4">
				        <input id="valorDiaria" name="valorDiaria" type="text" class="monetario" >
				        <label class="active" for="valorDiaria">Valor Diárias por atraso</label>
				    </div>
					
				  
				</div>
				<div class="row">
				
				    <div class="input-field col s12">
				        <input id="observacoes" name="observacoes" type="text" >
				        <label class="active" for="observacoes">Obsevações</label>
				    </div>

					
				  
				</div>
				
				</div>

                    <div class="row">
                        <div style="text-align: center">
                            <a href="<%=request.getContextPath()%>/funcionario/consultaFuncionario.jsp" class="btn orange waves-effect waves-light"><i class="mdi-navigation-cancel left"></i>Cancelar</a>
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
<script>
$('#equipamentoId').change(function(){
	var id = $('#equipamentoId').val();
    if (id.length > 0) {
        $.ajax({
            method: "GET",
            timeout: 10000,
            url: "http://localhost:8080/FuncionarioBack/api/equipamento/buscar?id="+id,
            beforeSend: function () {
 
            	$('#dataRetirada').val("....Carregando");
                $('#prazo').val("....Carregando");
                $('#dataDevolucao').val("....Carregando");
                $('#valorLocacao').val("....Carregando");
                $('#valorDanificado').val("....Carregando");
                $('#valorDiaria').val("....Carregando");
                
 
            },
            success: function (data) {
            	console.log('dados');
            	console.log(data);
            	
            	var retirada = moment();
            	var devolucao = moment();
            	devolucao.add(data.tempoLocacao, 'days');

                
                $('#dataRetirada').val(retirada.format("DD/MM/YYYY"));
                $('#prazo').val(data.tempoLocacao);  
                $('#dataDevolucao').val(devolucao.format("DD/MM/YYYY"));
                $('#valorLocacao').val(data.valorLocacao.toFixed(2));
                $('#valorDanificado').val(data.valorDanificacao.toFixed(2));
                $('#valorDiaria').val(data.valorDiaria.toFixed(2));
               

            },
            error: function (msg) {
            	$('#dataRetirada').val("");
                $('#prazo').val("");
                $('#dataDevolucao').val("");
                $('#valorLocacao').val("");
                $('#valorDanificado').val("");
                $('#valorDiaria').val("");


            }
        });
    }
	
})
    



</script>


<%@ include file="/estrutura/footer.jsp"%>
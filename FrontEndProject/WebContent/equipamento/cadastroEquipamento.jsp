

<%@page import="model.Equipamento"%>
<%@page import="model.Empresa"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@page import="java.util.ArrayList"%>

<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ page import="controller.EmpresaController"%>

<%@ page import="controller.EquipamentoController"%>
<%@ page import="java.util.List"%>


<%
	EmpresaController empresaController = new EmpresaController();
	List<Empresa> empresas = empresaController.listar(1, 1000);

	Equipamento dado = new Equipamento();
	EquipamentoController controller = new EquipamentoController();
	List<String> erros;
	
	if (request.getSession().getAttribute("erros") != null ){
		erros = (List<String>)request.getSession().getAttribute("erros");
		request.getSession().setAttribute("erros", null);
		
		dado = (Equipamento)request.getSession().getAttribute("object");
	}else{
		erros = new ArrayList<String>();
	
		if (request.getParameter("id") != null){
			try{
				dado = controller.buscarEquipamentoPorId(Integer.parseInt(request.getParameter("id")));
				if (dado == null)
					throw new Exception("Equipamento não encontrado");
			}catch(Exception e){
				erros.add("Erro ao recuperar o Equipamento: " + e.getMessage());
				dado = new Equipamento();
			}
		}
	}

%>
<div class="row">
	<div class="col s12 m12 l12">
		<div class="card-panel">
			<h4 class="header2">
				<i class="mdi-action-invert-colors"></i></i>Cadastro de Equipamento
			</h4>

			<form class="col s12" role="form"
				action="<%=request.getContextPath()%>/equipamento/processarEquipamento.jsp?acao=1"
				method="POST">


				<input type="hidden" name="id" value="<%= dado.getId() %>">
				<div class="row" style="margin-top: 2em">

					<% if (erros.size() > 0) { %>
					<div class="card-panel red lighten-2"">
						<ul>
							<% for (int i = 0; i < erros.size(); i++){ %>
							<li>
								<% out.print(erros.get(i).toString()); %>
							</li>
							<% }; %>
						</ul>
					</div>
					<% }; %>

					<div class="input-field col s6">
						<input id="codigo" name="codigo" maxlength="40" type="text"
							required value="<%= dado.getCodigo() %>"> <label
							class="active" for="codigo">Código de Identificação</label>
					</div>

					<div class="input-field col s6">
						<input id="descricao" name="descricao" type="text"
							value="<%= dado.getDescricao()%>"> <label class="active"
							for="descricao">Descrição</label>
					</div>
				</div>

				<div class="row">

					<div class="input-field col s12">
						<label for="empresaId" class="active">Empresa</label> 
						<select id="empresaId" name="empresaId" required  >
							<option disabled selected>Selecione uma Empresa</option>
							<% for (int i = 0; i < empresas.size(); i++){ %>
							<option value="<%= empresas.get(i).getId() %>"
								<%= (empresas.get(i).getId() == dado.getEmpresa().getId()) ? "selected" : "" %>><%= empresas.get(i).getNomeFantasia() %></option>
							<% }; %>
						</select>

					</div>
				</div>


				<div class="row">
					<div class="input-field col s6">
						<input name="dataCompra" maxlength="20" type="text" class="date"
							value="<%= dado.getDataCompra() %>"> <label
							class="active" for="dataCompra">Data de aquisição</label>
					</div>

					<div class="input-field col s6">
						<input id="valorcompra" name="valorcompra" class="monetario"
							maxlength="60" type="text" value="<%= dado.getValorcompra() %>">
						<label class="active" for="valorcompra">Valor de Compra</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s3">
						<input name="valorLocacao" id="valorLocacao" type="text" class="monetario"
							class="valor" value="<%= dado.getValorLocacao() %>"> <label
							class="active" for="valorLocacao">Valor de locação</label>
					</div>

					<div class="input-field col s3">
						<input name="tempoLocacao" id="tempoLocacao" type="text" class=""
							value="<%= dado.getTempoLocacao() %>"> <label
							class="active" for="tempoLocacao">Tempo de locação (dias
							úteis)</label>
					</div>

					<div class="input-field col s3">
						<input name="valorDiaria" id="valorDiaria" type="text" class="monetario"
							class="valor" value="<%= dado.getValorDiaria() %>"> <label
							class="active" for="valorDiaria">Valor Diárias</label>
					</div>

					<div class="input-field col s3">
						<input name="valorDanificacao" id="valorDanificacao" type="text"
							class="valor" value="<%= dado.getValorDanificacao() %>">
						<label class="active" for="valorDanificacao">Valor
							Danificado</label>
					</div>

				</div>
		</div>

		<div class="row">
			<div style="text-align: center">
				<a
					href="<%=request.getContextPath()%>/equipamento/consultaEquipamento.jsp"
					class="btn orange waves-effect waves-light"><i
					class="mdi-navigation-cancel left"></i>Cancelar</a>
				<button type="submit" class="btn cyan waves-effect waves-light"
					value="foo" name="action">
					Salvar <i class="mdi-content-send right"></i>
				</button>
			</div>
		</div>

		</form>

		<!-- /.col-lg-6 (nested) -->
	</div>
</div>
</div>
<script type="text/javascript">

$('#cep').blur(function () {
    var str = $('#cep').val();
    str = str.toString();
    var cep = str.replace(/\D/g, "");
    if (cep.length > 0) {
        $.ajax({
            method: "GET",
            timeout: 5000,
            url: "https://viacep.com.br/ws/" + cep + "/json/",
            beforeSend: function () {
                $('#endereco').val("....Carregando");
                $('#cidade').val("....Carregando");
                $('#bairro').val("....Carregando");
                $('#estado').val("....Carregando");
                $('#pais').val("....Carregando");

            },
            success: function (data) {
                $('#numero').focus();
                $('#endereco').val(data.logradouro);  
                $('#bairro').val(data.bairro);
                $('#cidade').val(data.localidade);
                $('#estado').val(data.uf);
                $('#pais').val("Brasil");
                
                
                $('#enderecoLabel').addClass("active");
                $('#bairroLabel').addClass("active");
                $('#cidadeLabel').addClass("active");
                $('#estadoLabel').addClass("active");
                $('#paisLabel').addClass("active");

            },
            error: function (msg) {
                $('#endereco').val("");
                $('#bairro').val("");
                $('#cidade').val("");
                $('#estado').val("");
                $('#pais').val("");


            }
        });
    }
});

</script>

<%@ include file="/estrutura/footer.jsp"%>
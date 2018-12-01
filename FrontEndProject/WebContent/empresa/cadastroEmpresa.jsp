<%@page import="java.util.ArrayList"%>

<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>


<%@ page import="controller.EmpresaController"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Empresa"%>

<%
	Empresa dado = new Empresa();
	EmpresaController controller = new EmpresaController();
	List<String> erros;
	
	if (request.getSession().getAttribute("erros") != null ){
		erros = (List<String>)request.getSession().getAttribute("erros");
		request.getSession().setAttribute("erros", null);
		
		dado = (Empresa)request.getSession().getAttribute("object");
	}else{
		erros = new ArrayList<String>();
	
		if (request.getParameter("id") != null){
			try{
				dado = controller.buscarEmpresaPorId(Integer.parseInt(request.getParameter("id")));
				if (dado == null)
					throw new Exception("Usuário não encontrado");
			}catch(Exception e){
				erros.add("Erro ao recuperar o usuário: " + e.getMessage());
				dado = new Empresa();
			}
		}
	}

%>
<div class="row">
        <div class="col s12 m12 l12">
            <div class="card-panel">
                <h4 class="header2"><i class="mdi-social-domain"></i>Cadastro de Empresa</h4>

                <form class="col s12" role="form" action="<%=request.getContextPath()%>/empresa/processarEmpresa.jsp?acao=1" method="POST">

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
				        <input id="nomeFantasia" name="nomeFantasia" min="3" maxlength="40" type="text"
				               required value="<%= dado.getNomeFantasia() %>">
				        <label class="active" for="nomeFantasia">Nome Fantasia</label>
				    </div>
				
				    <div class="input-field col s6">
				        <input id="razaoSocial" name="razaoSocial" min="3" maxlength="60" type="text"
				                value="<%= dado.getRazaoSocial()%>">
				        <label class="active" for="razaoSocial">Razão Social</label>
				    </div>
				</div>

				<div class="row">
				    <div class="input-field col s4">
				        <input name="cnpj" maxlength="20" type="text" class="cnpj" value="<%= dado.getCnpj() %>">
				        <label class="active" for="cnpj">CNPJ:</label>
				    </div>
				    
					<div class="input-field col s4">
				        <input id="ie" name="ie" min="3" maxlength="60" type="text" value="<%= dado.getIe() %>">
				        <label class="active" for="ie">Insc. Estadual</label>
				    </div>
				
				    <div class="input-field col s4">
				        <input id="inscricaoMunicipal" name="inscricaoMunicipal"  min="3" maxlength="60" type="text" value="<%= dado.getInscricaoMunicipal()%>">
				        <label class="active" for="inscricaoMunicipal">Insc. Municipal</label>
				    </div>
				</div>
				<div class="row">
				    <div class="input-field col s2">
				        <input name="cep" id="cep" maxlength="9" type="text" class="" value="<%= dado.getCep() %>">
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
				        <input name="bairro" id="bairro" type="text" class="" value="<%= dado.getCidade() %>">
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
                            <a href="<%=request.getContextPath()%>/empresa/consultaEmpresa.jsp" class="btn orange waves-effect waves-light"><i class="mdi-navigation-cancel left"></i>Cancelar</a>
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
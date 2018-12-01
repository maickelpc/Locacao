
<%@page import="model.Empresa"%>
<%@page import="model.Equipamento"%>
<%@page import="controller.EquipamentoController"%>

<%@page import="util.ExceptionPersonalizada"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="controller.LoginController"%>
<%@ page import="model.PessoaModel"%>


<%
	EquipamentoController controller = new EquipamentoController();	
	List<String> erros ;
	
	switch (request.getParameter("acao")){
		case "1": // salvar
		case "salvar":
	
		Equipamento equipamento = new Equipamento();

		
		equipamento.setId(Integer.parseInt(request.getParameter("id")));
		equipamento.setCodigo(request.getParameter("codigo"));

		equipamento.setDescricao(request.getParameter("descricao"));
		equipamento.setDataCompra(request.getParameter("dataCompra"));
		equipamento.setValorcompra(Double.parseDouble(request.getParameter("valorcompra")));
		equipamento.setValorLocacao(Double.parseDouble(request.getParameter("valorLocacao")));
		equipamento.setTempoLocacao(Integer.parseInt(request.getParameter("tempoLocacao")));
		equipamento.setValorDiaria(Double.parseDouble(request.getParameter("valorDiaria")));
		equipamento.setValorDanificacao(Double.parseDouble(request.getParameter("valorDanificacao")));
		
		
		Empresa empresa = new Empresa();
		String teste = request.getParameter("empresaId");
		empresa.setId(Integer.parseInt(teste));
		equipamento.setEmpresa(empresa);
		
		
		
		try{
			erros = equipamento.validar();
			if (erros.size() > 0)
				throw new ExceptionPersonalizada(erros, null, "Dados inválidos!");
			
			if (equipamento.getId() == 0)
				controller.salvarEquipamento(equipamento);
			else
				controller.alterarEquipamento(equipamento, "NOME DE ARQUIVOANTERIOR");
		
			
			response.sendRedirect(request.getContextPath() + "/equipamento/consultaEquipamento.jsp");
		
		}catch(Exception e){
			if (e.getClass() == ExceptionPersonalizada.class){
				ExceptionPersonalizada ex = (ExceptionPersonalizada)e;
				erros = ex.getErros();
				//equipamento = (EquipamentoModel)ex.getObjeto();
			}else{
				erros = new ArrayList<String>();
				erros.add(e.getMessage());	
			}
			request.getSession().setAttribute("erros", erros);
			request.getSession().setAttribute("object", equipamento);
			response.sendRedirect(request.getContextPath() + "/equipamento/cadastroEquipamento.jsp?id="+equipamento.getId());
		}
		
	break;
	case "2": // remover
	case "remove":
		equipamento = new Equipamento();
		controller = new EquipamentoController();
		
		equipamento.setId(Integer.parseInt(request.getParameter("id")));
		controller.deletarPorId(equipamento.getId());
		
		response.sendRedirect(request.getContextPath() + "/equipamento/consultaEquipamento.jsp");
		
	default:
		//redireciona para consulta
	}
	
	
	
	
%>
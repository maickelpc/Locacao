
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Equipamento"%>
<%@page import="model.Cliente"%>
<%@page import="model.Locacao"%>
<%@page import="controller.LocacaoController"%>
<%@page import="model.Empresa"%>
<%@page import="model.Funcionario"%>
<%@page import="controller.FuncionarioController"%>

<%@page import="util.ExceptionPersonalizada"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="controller.LoginController"%>
<%@ page import="model.PessoaModel"%>


<%
	LocacaoController controller = new LocacaoController();	
	Locacao locacao;
	List<String> erros ;
	
	SimpleDateFormat dataFormato = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat dataMysql = new SimpleDateFormat("yyyy-MM-dd");
	
	HttpSession sessaoLocacao = request.getSession();
	UserModel usuarioAtivo= (UserModel) sessaoLocacao.getAttribute("usuario");
	
	switch (request.getParameter("acao")){
		case "1": // salvar
		case "salvar":
	
		locacao = new Locacao();

		
		//locacao.setId(Integer.parseInt(request.getParameter("id")));
		Cliente cliente = new Cliente();
		cliente.setId(Integer.parseInt(request.getParameter("clienteId")));
		locacao.setCliente(cliente);
		
		Equipamento equipamento = new Equipamento();
		equipamento.setId(Integer.parseInt(request.getParameter("equipamentoId")));
		locacao.setEquipamento(equipamento);
		
		Funcionario funcionarioEntrega = new Funcionario();
		
		funcionarioEntrega.setId(Integer.parseInt(request.getParameter("funcionarioRetiradaId")));
		locacao.setFuncionarioRetirada(funcionarioEntrega);
	
		locacao.setUsuarioRetirada(usuarioAtivo);
		
		locacao.setDataRetirada(dataFormato.format(new Date()));
		locacao.setPrazo(Integer.parseInt(request.getParameter("prazo")));
		
		
		locacao.setDataDevolucao(request.getParameter("dataDevolucao"));
		
		locacao.setValorLocacao(Double.parseDouble(request.getParameter("valorLocacao").replace(",", ".")));
		locacao.setValorDanificado(Double.parseDouble(request.getParameter("valorDanificado").replace(",", ".")));
		locacao.setValorDiaria(Double.parseDouble(request.getParameter("valorDiaria").replace(",", ".")));
	
		locacao.setObservacoes(request.getParameter("observacoes"));
		
		try{
			erros = locacao.validar();
			if (erros.size() > 0)
				throw new ExceptionPersonalizada(erros, null, "Dados inválidos!");
			
			Locacao locacaoSalvo ;
			
			locacaoSalvo = controller.salvarLocacao(locacao);
			
// 			if (locacaoSalvo == null){
// 				erros.add("Erro ao salvar a locação");
// 				throw new ExceptionPersonalizada(erros,null, "Não foi possível gerar a locação");
// 			}
			
			request.getSession().setAttribute("success", "A Locação foi gerada com sucesso");
			response.sendRedirect(request.getContextPath() + "/locacao/efetuaDevolucao.jsp");
		
		}catch(Exception e){
			if (e.getClass() == ExceptionPersonalizada.class){
				ExceptionPersonalizada ex = (ExceptionPersonalizada)e;
				erros = ex.getErros();
				//funcionario = (FuncionarioModel)ex.getObjeto();
			}else{
				erros = new ArrayList<String>();
				erros.add(e.getMessage());	
			}
			request.getSession().setAttribute("erros", erros);
			request.getSession().setAttribute("object", locacao);
			response.sendRedirect(request.getContextPath() + "/locacao/efetuaLocacao.jsp");
		}
		
	break;
	case "2": // Cancelar
	case "cancelar":

		
		try{
			Object retorno =  controller.cancelarLocacao(Integer.parseInt(request.getParameter("id")), usuarioAtivo.getId());
			
// 			if (retorno == null)
// 				throw new Exception("Erro");
			request.getSession().setAttribute("success", "A Locação cancelada com sucesso");
			response.sendRedirect(request.getContextPath() + "/locacao/efetuaDevolucao.jsp");
		}catch(Exception e){
		
			erros = new ArrayList<String>();
			erros.add("A Locação não foi cancelada");
			request.getSession().setAttribute("erros", erros);
			response.sendRedirect(request.getContextPath() + "/locacao/efetivaCancelamento.jsp?id="+request.getParameter("id"));
		}
		
		
	break;
	case "3": // Devolucao
	case "devolucao":
		
		try{
		
			long id = Integer.parseInt(request.getParameter("id")) ;
			long idUsuarioDevolucao = usuarioAtivo.getId() ;
			int danificado = 0;
			try{
				danificado = Integer.parseInt(request.getParameter("isDanificado")) ;
			}catch(Exception ex){};
			
			int diarias = Integer.parseInt(request.getParameter("qtdeDiarias")) ;
			String func = request.getParameter("funcionarioDevolucaoId");
			long idFuncDevolucao = Integer.parseInt(request.getParameter("funcionarioDevolucaoId")) ;
			
			
			Object retorno =  controller.devolverLocacao(id, idUsuarioDevolucao, danificado, diarias, idFuncDevolucao);
			
// 			if (retorno == null)
// 				throw new Exception("Erro");
			request.getSession().setAttribute("success", "A Locação Devolvida com sucesso");
			response.sendRedirect(request.getContextPath() + "/locacao/efetuaDevolucao.jsp");
		}catch(Exception e){
		
			erros = new ArrayList<String>();
			erros.add("A Locação não foi cancelada");
			request.getSession().setAttribute("erros", erros);
			response.sendRedirect(request.getContextPath() + "/locacao/efetivaDevolucao.jsp?id="+request.getParameter("id"));
		}
		
		
		
	default:
		
	}
	
	
	
	
%>
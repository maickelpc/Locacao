
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
	FuncionarioController controller = new FuncionarioController();	
	Funcionario funcionario;
	List<String> erros ;
	
	switch (request.getParameter("acao")){
		case "1": // salvar
		case "salvar":
	
		funcionario = new Funcionario();

		
		funcionario.setId(Integer.parseInt(request.getParameter("id")));
		funcionario.setNome(request.getParameter("nome"));
		funcionario.setSobrenome(request.getParameter("sobrenome"));
		funcionario.setCelular(request.getParameter("celular"));
		funcionario.setTelefone(request.getParameter("telefone"));
		funcionario.setNomeContato(request.getParameter("contatoNome"));
		funcionario.setTelefoneContato(request.getParameter("contatoFone"));
		funcionario.setEmail(request.getParameter("email"));
		funcionario.setEndereco(request.getParameter("endereco"));
		funcionario.setBairro(request.getParameter("bairro"));
		funcionario.setCep(request.getParameter("cep"));
		funcionario.setComplemento(request.getParameter("complemento"));
		funcionario.setCidade(request.getParameter("cidade"));
		funcionario.setNumero(request.getParameter("numero"));
		funcionario.setEstado(request.getParameter("estado"));
		funcionario.setPais(request.getParameter("pais"));
		
		Empresa empresa = new Empresa();
		String teste = request.getParameter("empresaId");
		empresa.setId(Integer.parseInt(teste));
		funcionario.setEmpresa(empresa);
		
		
		
		try{
			erros = funcionario.validar();
			if (erros.size() > 0)
				throw new ExceptionPersonalizada(erros, null, "Dados inválidos!");
			
			if (funcionario.getId() == 0)
				controller.salvarFuncionario(funcionario);
			else
				controller.alterarFuncionario(funcionario, "NOME DE ARQUIVOANTERIOR");
		
			
			response.sendRedirect(request.getContextPath() + "/funcionario/consultaFuncionario.jsp");
		
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
			request.getSession().setAttribute("object", funcionario);
			response.sendRedirect(request.getContextPath() + "/funcionario/cadastroFuncionario.jsp?id="+funcionario.getId());
		}
		
	break;
	case "2": // remover
	case "remove":
		funcionario = new Funcionario();
		controller = new FuncionarioController();
		
		funcionario.setId(Integer.parseInt(request.getParameter("id")));
		controller.deletarPorId(funcionario.getId());
		
		response.sendRedirect(request.getContextPath() + "/funcionario/consultaFuncionario.jsp");
		
	default:
		//redireciona para consulta
	}
	
	
	
	
%>
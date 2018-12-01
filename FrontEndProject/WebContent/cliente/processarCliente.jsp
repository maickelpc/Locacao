<%@page import="model.Cliente"%>
<%@page import="util.ExceptionPersonalizada"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.ClienteController"%>
<%@ page import="controller.LoginController"%>
<%@ page import="model.PessoaModel"%>


<%
	ClienteController controller = new ClienteController();	
	Cliente cliente;
	List<String> erros;

	switch (request.getParameter("acao")){
		case "1": // salvar
		case "salvar":
	
		cliente = new Cliente();

		
		cliente.setId(Integer.parseInt(request.getParameter("id")));
		
		cliente.setNome(request.getParameter("nome"));
		cliente.setSobrenome(request.getParameter("sobrenome"));
		cliente.setTelefone(request.getParameter("telefone"));
		cliente.setCelular(request.getParameter("celular"));
		cliente.setContato(request.getParameter("contato"));
		cliente.setTelefoneContato(request.getParameter("telefoneContato"));
		cliente.setCpfCnpj(request.getParameter("cpfCnpj"));
		cliente.setRgie(request.getParameter("rgie"));
		cliente.setEmail(request.getParameter("email"));
		cliente.setEndereco(request.getParameter("endereco"));
		cliente.setNumero(request.getParameter("numero"));
		cliente.setCep(request.getParameter("cep"));
		cliente.setComplemento(request.getParameter("complemento"));
		cliente.setBairro(request.getParameter("bairro"));
		cliente.setCidade(request.getParameter("cidade"));
		cliente.setEstado(request.getParameter("estado"));
		cliente.setPais(request.getParameter("pais"));
		
				
		boolean sucesso = false;
		
		try{
		
			erros = cliente.validar();
			if (erros.size() > 0)
				throw new ExceptionPersonalizada(erros, cliente, "Dados inválidos!");
			
			if (cliente.getId() == 0)
				sucesso = controller.salvarCliente(cliente);
			else
				sucesso = controller.alterarCliente(cliente, "NOME DE ARQUIVOANTERIOR");
		
			
// 			if (!sucesso)
// 				throw new Exception("Erro ao salvar o registro no servidor");
			
			response.sendRedirect(request.getContextPath() + "/cliente/consultaCliente.jsp");
		
		}catch(Exception e){
			
			if (e.getClass() == ExceptionPersonalizada.class){
				ExceptionPersonalizada ex = (ExceptionPersonalizada)e;
				erros = ex.getErros();
				cliente = (Cliente)ex.getObjeto();
			}else{
				erros = new ArrayList<String>();
				erros.add(e.getMessage());	
			}
						
			request.getSession().setAttribute("erros", erros);
			request.getSession().setAttribute("object", cliente);
			response.sendRedirect(request.getContextPath() + "/cliente/cadastroCliente.jsp?id="+cliente.getId());
		}
		
	break;
	case "2": // Remover
	case "remove":
		cliente = new Cliente();
		controller = new ClienteController();
		
		cliente.setId(Integer.parseInt(request.getParameter("id")));
		controller.deletarPorId(cliente.getId());
		
		response.sendRedirect(request.getContextPath() + "/cliente/consultaCliente.jsp");
		
	default:
		//redireciona para consulta
	}
	
	
	
	
%>
<%@page import="util.ExceptionPersonalizada"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.UserController"%>
<%@ page import="controller.LoginController"%>
<%@ page import="model.PessoaModel"%>
<%@ page import="model.UserModel"%>

<%
	UserController controller = new UserController();	
	UserModel user;
	List<String> erros;

	switch (request.getParameter("acao")){
		case "1": // salvar
		case "salvar":
	
		user = new UserModel();

		
		user.setId(Integer.parseInt(request.getParameter("id")));
		user.setName(request.getParameter("name"));
		user.setLastname(request.getParameter("lastName"));
		user.setEmail(request.getParameter("email"));
		user.setCelular(request.getParameter("celular"));
		user.setTelefone(request.getParameter("telefone"));
		
				
		boolean sucesso = false;
		
		try{
		
			erros = user.validar();
			if (erros.size() > 0)
				throw new ExceptionPersonalizada(erros, user, "Dados inválidos!");
			
			if (user.getId() == 0)
				sucesso = controller.salvarUser(user);
			else
				sucesso = controller.alterarUser(user, "NOME DE ARQUIVOANTERIOR");
		
			
// 			if (!sucesso)
// 				throw new Exception("Erro ao salvar o registro no servidor");
			
			response.sendRedirect(request.getContextPath() + "/user/consultaUsuario.jsp");
		
		}catch(Exception e){
			
			if (e.getClass() == ExceptionPersonalizada.class){
				ExceptionPersonalizada ex = (ExceptionPersonalizada)e;
				erros = ex.getErros();
				user = (UserModel)ex.getObjeto();
			}else{
				erros = new ArrayList<String>();
				erros.add(e.getMessage());	
			}
						
			request.getSession().setAttribute("erros", erros);
			request.getSession().setAttribute("object", user);
			response.sendRedirect(request.getContextPath() + "/user/cadastroUsuario.jsp?id="+user.getId());
		}
		
	break;
	case "2": // Remover
	case "remove":
		user = new UserModel();
		controller = new UserController();
		
		user.setId(Integer.parseInt(request.getParameter("id")));
		controller.deletarPorId(user.getId());
		
		response.sendRedirect(request.getContextPath() + "/user/consultaUsuario.jsp");
		
	default:
		//redireciona para consulta
	}
	
	
	
	
%>
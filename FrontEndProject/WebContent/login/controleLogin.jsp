
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@ page import="controller.LoginController"%>
<%@ page import="model.PessoaModel"%>
<%@ page import="model.UserModel"%>
<%
	
	String login = request.getParameter("userLogin");
	String senha = request.getParameter("userSenha");
	
	HttpSession sessao = request.getSession();

	//Instância de um objeto da classe LoginController pra conseguir invocar o método de validação do login
	LoginController loginController = new LoginController();
	//Invocação do método de validação de login (retorno null ou, se está correto, um objeto)
	UserModel usuario = loginController.validarLogin(login, senha);

	//Se usuario não for nulo, ou seja, o retorno foi um objeto... posso logar a pessoa...
	if (usuario != null) {
		sessao.setAttribute("usuario", usuario);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	} else {
		//Se caiu nesse else, é porque o retorno veio nulo. Logo, houve erro na digitação dos dados de login
		sessao.setAttribute("erroLogin", true);
		response.sendRedirect(request.getContextPath() + "/login/telaLogin.jsp");
	}
%>
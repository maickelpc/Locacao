
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@ page import="controller.LoginController"%>
<%@ page import="model.PessoaModel"%>
<%@ page import="model.UserModel"%>
<%
	
	String login = request.getParameter("userLogin");
	String senha = request.getParameter("userSenha");
	
	HttpSession sessao = request.getSession();

	//Inst�ncia de um objeto da classe LoginController pra conseguir invocar o m�todo de valida��o do login
	LoginController loginController = new LoginController();
	//Invoca��o do m�todo de valida��o de login (retorno null ou, se est� correto, um objeto)
	UserModel usuario = loginController.validarLogin(login, senha);

	//Se usuario n�o for nulo, ou seja, o retorno foi um objeto... posso logar a pessoa...
	if (usuario != null) {
		sessao.setAttribute("usuario", usuario);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	} else {
		//Se caiu nesse else, � porque o retorno veio nulo. Logo, houve erro na digita��o dos dados de login
		sessao.setAttribute("erroLogin", true);
		response.sendRedirect(request.getContextPath() + "/login/telaLogin.jsp");
	}
%>
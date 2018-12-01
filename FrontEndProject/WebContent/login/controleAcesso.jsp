<%@ page import="model.UserModel"%>
<%
	HttpSession sessao = request.getSession();
	UserModel usuarioLogado = (UserModel) sessao.getAttribute("usuario");
	
	if(usuarioLogado == null) {
		response.sendRedirect(request.getContextPath()+"/login/telaLogin.jsp");
	}
%>
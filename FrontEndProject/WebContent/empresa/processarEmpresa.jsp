<%@page import="model.Empresa"%>
<%@page import="util.ExceptionPersonalizada"%>
<%@ include file="/login/controleAcesso.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.EmpresaController"%>
<%@ page import="controller.LoginController"%>
<%@ page import="model.PessoaModel"%>


<%
	EmpresaController controller = new EmpresaController();	
	Empresa empresa;
	List<String> erros;

	switch (request.getParameter("acao")){
		case "1": // salvar
		case "salvar":
	
		empresa = new Empresa();

		
		empresa.setId(Integer.parseInt(request.getParameter("id")));
		empresa.setNomeFantasia(request.getParameter("nomeFantasia"));
		empresa.setRazaoSocial(request.getParameter("razaoSocial"));
		empresa.setCnpj(request.getParameter("cnpj"));
		empresa.setIe(request.getParameter("ie"));
		empresa.setEndereco(request.getParameter("endereco"));
		empresa.setNumero(request.getParameter("numero"));
		empresa.setCep(request.getParameter("cep"));
		empresa.setComplemento(request.getParameter("complemento"));
		empresa.setInscricaoMunicipal(request.getParameter("inscricaoMunicipal"));
		empresa.setCidade(request.getParameter("cidade"));
		empresa.setEstado(request.getParameter("estado"));
		empresa.setPais(request.getParameter("pais"));
		
				
		boolean sucesso = false;
		
		try{
		
			erros = empresa.validar();
			if (erros.size() > 0)
				throw new ExceptionPersonalizada(erros, empresa, "Dados inválidos!");
			
			if (empresa.getId() == 0)
				sucesso = controller.salvarEmpresa(empresa);
			else
				sucesso = controller.alterarEmpresa(empresa, "NOME DE ARQUIVOANTERIOR");
		
			
// 			if (!sucesso)
// 				throw new Exception("Erro ao salvar o registro no servidor");
			
			response.sendRedirect(request.getContextPath() + "/empresa/consultaEmpresa.jsp");
		
		}catch(Exception e){
			
			if (e.getClass() == ExceptionPersonalizada.class){
				ExceptionPersonalizada ex = (ExceptionPersonalizada)e;
				erros = ex.getErros();
				empresa = (Empresa)ex.getObjeto();
			}else{
				erros = new ArrayList<String>();
				erros.add(e.getMessage());	
			}
						
			request.getSession().setAttribute("erros", erros);
			request.getSession().setAttribute("object", empresa);
			response.sendRedirect(request.getContextPath() + "/empresa/cadastroEmpresa.jsp?id="+empresa.getId());
		}
		
	break;
	case "2": // Remover
	case "remove":
		empresa = new Empresa();
		controller = new EmpresaController();
		
		empresa.setId(Integer.parseInt(request.getParameter("id")));
		controller.deletarPorId(empresa.getId());
		
		response.sendRedirect(request.getContextPath() + "/empresa/consultaEmpresa.jsp");
		
	default:
		//redireciona para consulta
	}
	
	
	
	
%>
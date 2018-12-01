package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.FuncionarioController;
import controller.UploadController;
import model.Funcionario;

@WebServlet("/crud")
@MultipartConfig
public class CrudServlet extends HttpServlet {

	private void verificarAcao(HttpServletRequest request, HttpServletResponse response) throws Exception{

		String acao = request.getParameter("acao");

		if (acao.equals("incluirFuncionario")) {
			//Coletando valores do formul�rio
			String nome = request.getParameter("nome");
			String cpf = request.getParameter("cpf");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			Part filePart = request.getPart("foto");
			String nomeArquivo = null;
			if(filePart.getSize() > 0) {
				UploadController uploadCont = new UploadController();
				nomeArquivo = uploadCont.salvar(filePart);
			}

			//Criando um novo objeto de Funcionario e alimentando com os valores do form
			Funcionario funcionario = new Funcionario();
			funcionario.setNome(nome);
//			funcionario.setCpf(cpf);
//			funcionario.setLogin(login);
//			funcionario.setSenha(senha);
//			funcionario.setFoto(nomeArquivo);
			FuncionarioController funcionarioCont = new FuncionarioController();
			funcionarioCont.salvarFuncionario(funcionario);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		} else if (acao.equals("editarFuncionario")) {
			//Coletando valores do formul�rio
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String cpf = request.getParameter("cpf");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			Part filePart = request.getPart("foto");
			String nomeArquivoAnterior = request.getParameter("nomeArquivoAnterior");
			String nomeArquivo = null;
			if(filePart.getSize() > 0) {
				UploadController uploadCont = new UploadController();
				nomeArquivo = uploadCont.salvar(filePart);	
			}else {
				nomeArquivo = nomeArquivoAnterior;
				nomeArquivoAnterior = null;
				if(nomeArquivo != null)
					if(nomeArquivo.equals("") || nomeArquivo.equals("null"))
						nomeArquivo = null;
			}

			//Criando um novo objeto de Funcionario e alimentando com os valores do form
			Funcionario funcionario = new Funcionario();
			funcionario.setId(Long.parseLong(id));
			funcionario.setNome(nome);
//			funcionario.setCpf(cpf);
//			funcionario.setLogin(login);
//			funcionario.setSenha(senha);
//			funcionario.setFoto(nomeArquivo);
			FuncionarioController funcionarioCont = new FuncionarioController();
			funcionarioCont.alterarFuncionario(funcionario,nomeArquivoAnterior);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		} else if (acao.equals("excluirFuncionario")) {
			String id = request.getParameter("id");		
			FuncionarioController funcionarioCont = new FuncionarioController();
			funcionarioCont.deletarPorId(Long.parseLong(id));
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
	}














	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			verificarAcao(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			verificarAcao(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.UserModel;
import wsclient.RESTConnectionV2;

public class UserController {

	public UserController() {
		// TODO Auto-generated constructor stub
	}

	
	public List<UserModel> listar(int pagina, int limitePorPagina) {
		String url = "http://localhost:8080/FuncionarioBack/api/user/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<UserModel>) rest.getList(url, "GET", UserModel.class, null, queryParams);
	}

	public boolean salvarUser(UserModel user) {
		String url = "http://localhost:8080/FuncionarioBack/api/user/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		
		UserModel retorno = (UserModel)rest.getObject(url, "POST", null, user, queryParams);
		
		if (retorno == null)
			return false;
		else
			return true;
	}

	public boolean alterarUser(UserModel user, String nomeArquivoAnterior) {
		String url = "http://localhost:8080/FuncionarioBack/api/user/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("nomeArquivoAnterior", nomeArquivoAnterior);
		RESTConnectionV2 rest = new RESTConnectionV2();
		UserModel retorno = (UserModel) rest.getObject(url, "PUT", null, user, queryParams);
		
		if (retorno == null)
			return false;
		else
			return true;
					
	
	}

	public UserModel buscarUserPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/user/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		UserModel user = (UserModel)rest.getObject(url, "GET", UserModel.class, null, queryParams);
		if (user == null)
			user = new UserModel();
		return user;
	}

	public boolean deletarPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/user/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		UserModel retorno = (UserModel) rest.getObject(url, "DELETE", null, null, queryParams);
		
		if (retorno == null)
			return false;
		else
			return true;
	}
	
}

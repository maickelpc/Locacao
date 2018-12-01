package controller;

import java.util.HashMap;
import java.util.Map;

import model.Funcionario;
import model.UserModel;
import wsclient.RESTConnectionV2;

public class LoginController {
	
	public UserModel validarLogin(String login, String senha) {
		RESTConnectionV2 rest = new RESTConnectionV2();
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("login", login);
		queryParams.put("senha", senha);
		String url = "http://localhost:8080/FuncionarioBack/api/login/validar";
		UserModel lista = (UserModel) rest.getObject(url, "GET", UserModel.class, null, queryParams);
		return lista;
		
	}

}

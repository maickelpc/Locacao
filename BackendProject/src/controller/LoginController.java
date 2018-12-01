package controller;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import DAO.LoginDAO;
import model.FuncionarioModel;
import model.UserModel;

@Path("login")
public class LoginController {
	private LoginDAO dao = new LoginDAO();
	
	@GET
	@Path("validar")
	@Produces(MediaType.APPLICATION_JSON)
	public UserModel validarLogin(@QueryParam("login") String login, @QueryParam("senha") String senha) {
		UserModel user = dao.findByLoginAndSenha(login, senha);
		// verificar alguma informação para melhorar retorno
		if (user != null)
			return user;
		else
			return user;
	}

}

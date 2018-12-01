package DAO;

import javax.persistence.Query;

import java.util.*;
import controller.UserController;
import model.FuncionarioModel;
import model.UserModel;

@SuppressWarnings("rawtypes")
public class LoginDAO extends DAO {

	public UserModel findByLoginAndSenha(String login, String senha){
		Object retorno = null;
		try{

			manager.clear(); //limpeza de cache de queries
			Query query = manager.createQuery("from UserModel u WHERE u.email = :login and u.senha = :senha");
			query.setParameter("login", login);
			query.setParameter("senha", senha);
			query.setMaxResults(1);
			retorno = query.getSingleResult();
			if(retorno != null)
				return (UserModel) retorno;
			else
				return null;
//
//
		
//			UserDAO daoUser = new UserDAO();
//			List<UserModel> users = daoUser.listaAll(UserModel.class);
//			if (users.size()==0) {
//				System.out.println("Nenhum usuário encontrado");
//				throw new Exception("Login não encontrado");
//			}else{
//				return users.get(0);
//			}
			
			
				
		
		}catch(Exception ex) {
			return null;
		}
			
			
			
	}

}

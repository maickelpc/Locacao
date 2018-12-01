package DAO;

import java.util.List;

import javax.persistence.Query;

import model.UserModel;

@SuppressWarnings("rawtypes")
public class UserDAO extends DAO {
	
	@SuppressWarnings("unchecked")
	public List<UserModel> listPaginado(int pagina, int limitePorPagina){
		manager.clear(); //limpeza de cache de queries
		Query query = manager.createQuery("from UserModel");
		query.setMaxResults(limitePorPagina);
		query.setFirstResult(pagina*limitePorPagina-limitePorPagina);
		return query.getResultList();
		
	}
	
}

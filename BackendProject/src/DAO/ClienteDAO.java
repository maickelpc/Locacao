package DAO;

import java.util.List;

import javax.persistence.Query;

import model.ClienteModel;

@SuppressWarnings("rawtypes")
public class ClienteDAO extends DAO{
	
	
	@SuppressWarnings("unchecked")
	public List<ClienteModel> listPaginado(int pagina, int limitePorPagina){
		manager.clear(); //limpeza de cache de queries
		Query query = manager.createQuery("Select c from ClienteModel c");
		query.setMaxResults(limitePorPagina);
		query.setFirstResult(pagina*limitePorPagina-limitePorPagina);
		return query.getResultList();
	}

}

package DAO;

import java.util.List;

import javax.persistence.Query;

import model.FuncionarioModel;

@SuppressWarnings("rawtypes")
public class FuncionarioDAO extends DAO{
	
	
	@SuppressWarnings("unchecked")
	public List<FuncionarioModel> listPaginado(int pagina, int limitePorPagina){
		manager.clear(); //limpeza de cache de queries
		Query query = manager.createQuery("Select f from FuncionarioModel f");
		query.setMaxResults(limitePorPagina);
		query.setFirstResult(pagina*limitePorPagina-limitePorPagina);
		return query.getResultList();
	}

}

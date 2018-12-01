package DAO;

import java.util.List;

import javax.persistence.Query;

import model.EmpresaModel;

@SuppressWarnings("rawtypes")
public class EmpresaDAO extends DAO {
	
	@SuppressWarnings("unchecked")
	public List<EmpresaModel> listPaginado(int pagina, int limitePorPagina){
		manager.clear(); //limpeza de cache de queries
		Query query = manager.createQuery("Select e from EmpresaModel e");
		query.setMaxResults(limitePorPagina);
		query.setFirstResult(pagina*limitePorPagina-limitePorPagina);
		return query.getResultList();
	}
	
}

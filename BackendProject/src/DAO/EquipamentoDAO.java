package DAO;

import java.util.List;

import javax.persistence.Query;

import model.EquipamentoModel;

@SuppressWarnings("rawtypes")
public class EquipamentoDAO extends DAO{
	@SuppressWarnings("unchecked")
	public List<EquipamentoModel> listPaginado(int pagina, int limitePorPagina){
		manager.clear(); //limpeza de cache de queries
		Query query = manager.createQuery("Select e from EquipamentoModel e");
		query.setMaxResults(limitePorPagina);
		query.setFirstResult(pagina*limitePorPagina-limitePorPagina);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<EquipamentoModel> listDisponiveis(int pagina, int limitePorPagina) {
		manager.clear(); //limpeza de cache de queries
		//SELECT * FROM equipamento e WHERE e.id NOT IN (SELECT equipamento_id FROM locacao l WHERE l.situacao LIKE "ATIVO") 
		Query query = manager.createQuery("Select e from EquipamentoModel e "
				+ "WHERE e.id NOT IN "
				+ "(SELECT l.equipamento.id from LocacaoModel l WHERE l.situacao = 'ATIVO')");
		query.setMaxResults(limitePorPagina);
		query.setFirstResult(pagina*limitePorPagina-limitePorPagina);
		return query.getResultList();
	}
}

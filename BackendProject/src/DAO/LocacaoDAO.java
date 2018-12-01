package DAO;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import model.FuncionarioModel;
import model.LocacaoModel;
import model.UserModel;

@SuppressWarnings("rawtypes")
public class LocacaoDAO extends DAO{
	@SuppressWarnings("unchecked")
	public List<LocacaoModel> listPaginado(int pagina, int limitePorPagina, String situacao){
		manager.clear(); //limpeza de cache de queries
		String sql = "Select e from LocacaoModel e";
		if(situacao != null)
			if(situacao.length() > 0) 
				sql = sql + " WHERE e.situacao = :situacao";
			
		Query query = manager.createQuery(sql);
		if(situacao != null)
			if(situacao.length() > 0) 
				query.setParameter("situacao", situacao);
			
		query.setMaxResults(limitePorPagina);
		query.setFirstResult(pagina*limitePorPagina-limitePorPagina);
		return query.getResultList();
	}

	
	
	@Transactional
	public void cancelaLocacao(long id, long idUserCancelado) {
		manager.clear(); //limpeza de cache de queries
		manager.getTransaction().begin();
		Query query = manager.createQuery("UPDATE LocacaoModel e SET e.situacao = :situacao, "
				+ "e.usuarioCancelamento = :userCancel "
				+ "WHERE id = :id");
		UserModel usuario = new UserModel();
		usuario.setId(idUserCancelado);
		query.setParameter("id", id).setParameter("userCancel", usuario).setParameter("situacao", "CANCELADO").executeUpdate();
		manager.getTransaction().commit();
	}

	@Transactional
	public void devolveLocacao(long id,long idUsuarioDevolucao,int danificado,int diarias,long idFuncDevolucao) {
		manager.clear(); //limpeza de cache de queries
		
		manager.getTransaction().begin();
		Query query = manager.createQuery("UPDATE LocacaoModel e SET e.situacao = :situacao, "
				+ "e.usuarioDevolucao = :usuarioDevolucao,"
				+ "e.qtdeDiarias = :diarias, e.danificado = :danificado, e.funcionarioDevolucao = :funcionarioDevolucao"
				+ "  WHERE id = :id");
		
		UserModel usuario = new UserModel();
		usuario.setId(idUsuarioDevolucao);
		
		FuncionarioModel funcionario = new FuncionarioModel();
		funcionario.setId(idFuncDevolucao);
		
		query.setParameter("id", id)
			.setParameter("usuarioDevolucao", usuario)
			.setParameter("situacao", "DEVOLVIDO")
			.setParameter("danificado", danificado)
			.setParameter("diarias", diarias)
			.setParameter("funcionarioDevolucao", funcionario)
			.executeUpdate();
		manager.getTransaction().commit();
	}




}

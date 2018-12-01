package controller;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import DAO.LocacaoDAO;
import model.LocacaoModel;

@Path("locacao")
public class LocacaoController {
	private LocacaoDAO dao = new LocacaoDAO();

	@SuppressWarnings("unchecked")
	@GET 
	@Path("listar")
	@Produces(MediaType.APPLICATION_JSON)
	public List<LocacaoModel> listar(@QueryParam("pagina") int pagina, @QueryParam("limitePorPagina") int limitePorPagina, @QueryParam("situacao") String situacao) {
		List<LocacaoModel> lista;
		if(pagina == 0 && limitePorPagina == 0) {
			lista = dao.listaAll(LocacaoModel.class);
		} else {
			lista = dao.listPaginado(pagina,limitePorPagina, situacao);
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@POST
	@Path("salvar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void salvar(LocacaoModel locacao) {
		if (locacao.getSituacao() == null) 
			locacao.setSituacao("ATIVO");
		if (locacao.getDanificado() == null)
			locacao.setDanificado(0);
		if(locacao.getQtdeDiarias() == null)
			locacao.setQtdeDiarias(1);
		dao.save(locacao);
	}

	@SuppressWarnings("unchecked")
	@PUT
	@Path("alterar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void alterar(LocacaoModel locacao) {
		dao.update(locacao);
	}

	@SuppressWarnings("unchecked")
	@GET
	@Path("buscar")
	@Consumes(MediaType.APPLICATION_JSON)
	public LocacaoModel buscarPorId(@QueryParam("id") long id) {
		return (LocacaoModel) dao.findById(LocacaoModel.class, id);
	}

	@SuppressWarnings("unchecked")
	@DELETE
	@Path("deletar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void deletarPorId(@QueryParam("id") long id) {
		dao.delete(LocacaoModel.class, id);
	}
	
	@PUT
	@Path("cancelar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void cancelarLocacao(@QueryParam("id") long id, @QueryParam("idUsuarioCancelamento") long idUsuarioCancelamento) {
		@SuppressWarnings("unchecked")
		LocacaoModel locacao = (LocacaoModel) dao.findById(LocacaoModel.class, id);
		if(locacao != null)
			if(locacao.getSituacao().equals("ATIVO") || locacao.getSituacao().equals("Ok"))
				dao.cancelaLocacao(id,idUsuarioCancelamento);
	}
	
	
	
	@PUT
	@Path("devolver")
	@Consumes(MediaType.APPLICATION_JSON)
	public void devolverLocacao(
			@QueryParam("id") long id, 
			@QueryParam("idUsuarioDevolucao") long idUsuarioDevolucao,
			@QueryParam("danificado") int danificado,
			@QueryParam("diarias") int diarias,
			@QueryParam("idFuncDevolucao") long idFuncDevolucao) {
		@SuppressWarnings("unchecked")
		LocacaoModel locacao = (LocacaoModel) dao.findById(LocacaoModel.class, id);
		if(locacao != null)
			if(locacao.getSituacao().equals("ATIVO") || locacao.getSituacao().equals("Ok"))
				dao.devolveLocacao(id,idUsuarioDevolucao, danificado, diarias, idFuncDevolucao);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

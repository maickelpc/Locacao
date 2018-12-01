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

import DAO.EquipamentoDAO;
import model.EquipamentoModel;

@Path("equipamento")
public class EquipamentoController {
	private EquipamentoDAO dao = new EquipamentoDAO();

	@GET 
	@Path("listar")
	@Produces(MediaType.APPLICATION_JSON)
	public List<EquipamentoModel> listar(@QueryParam("pagina") int pagina, @QueryParam("limitePorPagina") int limitePorPagina) {
		List<EquipamentoModel> lista = dao.listPaginado(pagina,limitePorPagina);
		return lista;
	}
	

	@GET
	@Path("listarDisponiveis")
	@Produces(MediaType.APPLICATION_JSON)
	public List<EquipamentoModel> listDisponiveis(
			@QueryParam("pagina") int pagina, 
			@QueryParam("limitePorPagina") int limitePorPagina) {
		List<EquipamentoModel> lista = dao.listDisponiveis(pagina, limitePorPagina);
		return lista;
	}

	@SuppressWarnings("unchecked")
	@POST
	@Path("salvar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void salvar(EquipamentoModel funcionario) {
		dao.save(funcionario);
	}

	@SuppressWarnings("unchecked")
	@PUT
	@Path("alterar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void alterar(EquipamentoModel funcionario) {
		dao.update(funcionario);
	}

	@SuppressWarnings("unchecked")
	@GET
	@Path("buscar")
	@Consumes(MediaType.APPLICATION_JSON)
	public EquipamentoModel buscarPorId(@QueryParam("id") long id) {
		return (EquipamentoModel) dao.findById(EquipamentoModel.class, id);
	}

	@SuppressWarnings("unchecked")
	@DELETE
	@Path("deletar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void deletarPorId(@QueryParam("id") long id) {
		dao.delete(EquipamentoModel.class, id);
	}
}

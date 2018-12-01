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

import DAO.FuncionarioDAO;
import model.FuncionarioModel;

@Path("funcionario")
public class FuncionarioController {
	private FuncionarioDAO dao = new FuncionarioDAO();

	@GET 
	@Path("listar")
	@Produces(MediaType.APPLICATION_JSON)
	public List<FuncionarioModel> listar(@QueryParam("pagina") int pagina, @QueryParam("limitePorPagina") int limitePorPagina) {
		List<FuncionarioModel> lista = dao.listPaginado(pagina,limitePorPagina);
		return lista;
	}

	@POST
	@Path("salvar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void salvar(FuncionarioModel funcionario) {
		dao.save(funcionario);
	}

	@PUT
	@Path("alterar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void alterar(FuncionarioModel funcionario) {
		dao.update(funcionario);
	}

	@GET
	@Path("buscar")
	@Consumes(MediaType.APPLICATION_JSON)
	public FuncionarioModel buscarPorId(@QueryParam("id") long id) {
		return (FuncionarioModel) dao.findById(FuncionarioModel.class, id);
	}

	@DELETE
	@Path("deletar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void deletarPorId(@QueryParam("id") long id) {
		dao.delete(FuncionarioModel.class, id);
	}

}

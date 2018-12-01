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

import DAO.ClienteDAO;
import model.ClienteModel;

@Path("cliente")
public class ClienteController {
	private ClienteDAO dao = new ClienteDAO();

	@GET 
	@Path("listar")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ClienteModel> listar(@QueryParam("pagina") int pagina, @QueryParam("limitePorPagina") int limitePorPagina) {
		List<ClienteModel> lista = dao.listPaginado(pagina,limitePorPagina);
		return lista;
	}

	@POST
	@Path("salvar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void salvar(ClienteModel funcionario) {
		dao.save(funcionario);
	}

	@PUT
	@Path("alterar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void alterar(ClienteModel funcionario) {
		dao.update(funcionario);
	}

	@GET
	@Path("buscar")
	@Consumes(MediaType.APPLICATION_JSON)
	public ClienteModel buscarPorId(@QueryParam("id") long id) {
		return (ClienteModel) dao.findById(ClienteModel.class, id);
	}

	@DELETE
	@Path("deletar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void deletarPorId(@QueryParam("id") long id) {
		dao.delete(ClienteModel.class, id);
	}

}

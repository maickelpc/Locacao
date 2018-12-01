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

import DAO.EmpresaDAO;
import model.EmpresaModel;

@Path("empresa")
public class EmpresaController {
	private EmpresaDAO dao = new EmpresaDAO();
	
	@GET 
	@Path("listar")
	@Produces(MediaType.APPLICATION_JSON)
	public List<EmpresaModel> listar(@QueryParam("pagina") int pagina, @QueryParam("limitePorPagina") int limitePorPagina) {
		List<EmpresaModel> lista = dao.listPaginado(pagina,limitePorPagina);
		return lista;
	}

	@POST
	@Path("salvar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void salvar(EmpresaModel user) {
		dao.save(user);
	}

	@PUT
	@Path("alterar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void alterar(EmpresaModel user) {
		dao.update(user);
	}

	@GET
	@Path("buscar")
	@Consumes(MediaType.APPLICATION_JSON)
	public EmpresaModel buscarPorId(@QueryParam("id") long id) {
		return (EmpresaModel) dao.findById(EmpresaModel.class, id);
	}

	@DELETE
	@Path("deletar")
	@Consumes(MediaType.APPLICATION_JSON)
	public void deletarPorId(@QueryParam("id") long id) {
		dao.delete(EmpresaModel.class, id);
	}
}

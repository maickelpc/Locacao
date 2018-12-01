package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Cliente;
import wsclient.RESTConnectionV2;

public class ClienteController {

	public ClienteController() {
		// TODO Auto-generated constructor stub
	}

	
	public List<Cliente> listar(int pagina, int limitePorPagina) {
		String url = "http://localhost:8080/FuncionarioBack/api/cliente/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<Cliente>) rest.getList(url, "GET", Cliente.class, null, queryParams);
	}

	public boolean salvarCliente(Cliente cliente) {
		String url = "http://localhost:8080/FuncionarioBack/api/cliente/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		
		rest.getObject(url, "POST", null, cliente, queryParams);
		
		//tratar retorno aqui
		return true;
	}

	public boolean alterarCliente(Cliente cliente, String nomeArquivoAnterior) {
		String url = "http://localhost:8080/FuncionarioBack/api/cliente/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("nomeArquivoAnterior", nomeArquivoAnterior);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "PUT", null, cliente, queryParams);
		
		//tratar retorno aqui
				return true;
	}

	public Cliente buscarClientePorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/cliente/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		Cliente cliente = (Cliente)rest.getObject(url, "GET", Cliente.class, null, queryParams);
		if (cliente == null)
			cliente = new Cliente();
		return cliente;
	}

	public boolean deletarPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/cliente/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "DELETE", null, null, queryParams);
		
		//tratar retorno aqui
				return true;
	}
	
}

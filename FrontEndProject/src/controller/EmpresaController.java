package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Empresa;
import wsclient.RESTConnectionV2;

public class EmpresaController {

	public EmpresaController() {
		// TODO Auto-generated constructor stub
	}

	
	public List<Empresa> listar(int pagina, int limitePorPagina) {
		String url = "http://localhost:8080/FuncionarioBack/api/empresa/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<Empresa>) rest.getList(url, "GET", Empresa.class, null, queryParams);
	}

	public boolean salvarEmpresa(Empresa empresa) {
		String url = "http://localhost:8080/FuncionarioBack/api/empresa/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		
		rest.getObject(url, "POST", null, empresa, queryParams);
		
		//tratar retorno aqui
		return true;
	}

	public boolean alterarEmpresa(Empresa empresa, String nomeArquivoAnterior) {
		String url = "http://localhost:8080/FuncionarioBack/api/empresa/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("nomeArquivoAnterior", nomeArquivoAnterior);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "PUT", null, empresa, queryParams);
		
		//tratar retorno aqui
				return true;
	}

	public Empresa buscarEmpresaPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/empresa/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		Empresa empresa = (Empresa)rest.getObject(url, "GET", Empresa.class, null, queryParams);
		if (empresa == null)
			empresa = new Empresa();
		return empresa;
	}

	public boolean deletarPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/empresa/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "DELETE", null, null, queryParams);
		
		//tratar retorno aqui
				return true;
	}
	
}

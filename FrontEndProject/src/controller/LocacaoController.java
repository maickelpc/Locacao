package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.QueryParam;

import model.Locacao;
import wsclient.RESTConnectionV2;

public class LocacaoController {

	public List<Locacao> listar(int pagina, int limitePorPagina, String situacao) {
		String url = "http://localhost:8080/FuncionarioBack/api/locacao/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		if (situacao != null && !situacao.toUpperCase().equals("TODOS"))
			queryParams.put("situacao", situacao);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<Locacao>) rest.getList(url, "GET", Locacao.class, null, queryParams);
	}

	public Locacao salvarLocacao(Locacao locacao) {
		locacao.setSituacao("ATIVO");
		String url = "http://localhost:8080/FuncionarioBack/api/locacao/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (Locacao)rest.getObject(url, "POST", null, locacao, queryParams);
		
	}

	public Locacao devolver(Locacao locacao, String nomeArquivoAnterior) {
		locacao.setSituacao("DEVOLVIDO");
		String url = "http://localhost:8080/FuncionarioBack/api/locacao/alterar";
		
		Map<String,Object> queryParams = new HashMap<String,Object>();
		//queryParams.put("nomeArquivoAnterior", nomeArquivoAnterior);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (Locacao)rest.getObject(url, "PUT", null, locacao, queryParams);
	}

	public Locacao buscarLocacaoPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/locacao/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (Locacao) rest.getObject(url, "GET", Locacao.class, null, queryParams);
	}

//	public Locacao cancelar(Locacao locacao) {
//		locacao.setSituacao("CANCELADO");
//		
//		String url = "http://localhost:8080/FuncionarioBack/api/locacao/alterar";
//		Map<String,Object> queryParams = new HashMap<String,Object>();
//		queryParams.put("nomeArquivoAnterior", "ArquivoAnterior");
//		
//		RESTConnectionV2 rest = new RESTConnectionV2();
//		return (Locacao)rest.getObject(url, "PUT", null, locacao, queryParams);
//
//	}

	public Locacao cancelarLocacao(long id, long idUserCancelamento) {
		
		String url = "http://localhost:8080/FuncionarioBack/api/locacao/cancelar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		
		queryParams.put("id", id);
		queryParams.put("idUsuarioCancelamento", idUserCancelamento);
		
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (Locacao)rest.getObject(url, "PUT", null, null, queryParams);
		
	}
	
	public Locacao devolverLocacao(long id,long idUsuarioDevolucao,int danificado,int diarias,long idFuncDevolucao) {
				String url = "http://localhost:8080/FuncionarioBack/api/locacao/devolver";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		
		queryParams.put("id", id);
		queryParams.put("idUsuarioDevolucao", idUsuarioDevolucao);
		queryParams.put("danificado", danificado);
		queryParams.put("diarias", diarias);
		queryParams.put("idFuncDevolucao", idFuncDevolucao);
		
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (Locacao)rest.getObject(url, "PUT", null, null, queryParams);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

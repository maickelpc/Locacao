package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Equipamento;
import wsclient.RESTConnectionV2;

public class EquipamentoController {

	public EquipamentoController() {
		// TODO Auto-generated constructor stub
	}

	public List<Equipamento> listarDisponiveis(int pagina, int limitePorPagina) {
		String url = "http://localhost:8080/FuncionarioBack/api/equipamento/listarDisponiveis";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<Equipamento>) rest.getList(url, "GET", Equipamento.class, null, queryParams);
	}
	
	public List<Equipamento> listar(int pagina, int limitePorPagina) {
		String url = "http://localhost:8080/FuncionarioBack/api/equipamento/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<Equipamento>) rest.getList(url, "GET", Equipamento.class, null, queryParams);
	}

	public boolean salvarEquipamento(Equipamento equipamento) {
		String url = "http://localhost:8080/FuncionarioBack/api/equipamento/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		
		rest.getObject(url, "POST", null, equipamento, queryParams);
		
		//tratar retorno aqui
		return true;
	}

	public boolean alterarEquipamento(Equipamento equipamento, String nomeArquivoAnterior) {
		String url = "http://localhost:8080/FuncionarioBack/api/equipamento/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("nomeArquivoAnterior", nomeArquivoAnterior);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "PUT", null, equipamento, queryParams);
		
		//tratar retorno aqui
				return true;
	}

	public Equipamento buscarEquipamentoPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/equipamento/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		Equipamento equipamento = (Equipamento)rest.getObject(url, "GET", Equipamento.class, null, queryParams);
		if (equipamento == null)
			equipamento = new Equipamento();
		return equipamento;
	}

	public boolean deletarPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/equipamento/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "DELETE", null, null, queryParams);
		
		//tratar retorno aqui
				return true;
	}
	
}

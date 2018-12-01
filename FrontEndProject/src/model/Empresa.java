package model;

import java.util.ArrayList;
import java.util.List;

import util.ValidarDados;

public class Empresa {
	private long id;
	private String nomeFantasia;
	private String razaoSocial;
	private String cnpj;
	private String ie;
	private String endereco;
	private String numero;
	private String cep;
	private String complemento;
	private String inscricaoMunicipal;
	private String bairro;
	private String cidade;
	private String estado;
	private String pais;	
	private List<Funcionario> funcionarios;
	private List<Equipamento> equipamentos;
	
	public Empresa() {
		this.id = 0;
		this.nomeFantasia = "";
		this.razaoSocial = "";
		this.cnpj = "";
		this.ie = "";
		this.endereco = "";
		this.numero = "";
		this.cep = "";
		this.complemento = "";
		this.inscricaoMunicipal = "";
		this.bairro = "";
		this.cidade = "";
		this.estado = "";
		this.pais = "";

	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNomeFantasia() {
		return nomeFantasia;
	}
	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}
	public String getRazaoSocial() {
		return razaoSocial;
	}
	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}
	public String getCnpj() {
		return cnpj;
	}
	public void setCnpj(String cnpj) {
		
		this.cnpj = cnpj.replaceAll("[^0-9]", "");
	}
	public String getIe() {
		return ie;
	}
	public void setIe(String ie) {
		this.ie = ie;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getInscricaoMunicipal() {
		return inscricaoMunicipal;
	}
	public void setInscricaoMunicipal(String inscricaoMunicipal) {
		this.inscricaoMunicipal = inscricaoMunicipal;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public List<Funcionario> getFuncionarios() {
		return funcionarios;
	}
	public void setFuncionarios(List<Funcionario> funcionarios) {
		this.funcionarios = funcionarios;
	}
	
	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	public List<Equipamento> getEquipamentos() {
		return equipamentos;
	}

	public void setEquipamentos(List<Equipamento> equipamentos) {
		this.equipamentos = equipamentos;
	}

	public List<String> validar(){
		List<String> retorno = new ArrayList<String>();
		
		if (this.nomeFantasia.isEmpty())
			retorno.add("Necessário informar o nome fantasia");
		
		if (this.razaoSocial.isEmpty())
			retorno.add("Necessário informar a Razão social");
		
		if (this.cnpj.isEmpty())
			retorno.add("Necessário informar o CNPJ");
		else if (!ValidarDados.isCNPJ(this.cnpj))
			retorno.add("CNPJ inválido");
		
		
	
		
		return retorno;
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

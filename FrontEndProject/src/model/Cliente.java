package model;

import java.util.ArrayList;
import java.util.List;

import util.ValidarDados;

public class Cliente{

	private long id;
	private String nome;
	private String sobrenome;
	private String telefone;
	private String celular;
	private String contato;
	private String telefoneContato;
	private String cpfCnpj;
	private String rgie;
	private String email;
	private String endereco;
	private String bairro;
	private String numero;
	private String cep;
	private String complemento;
	private String cidade;
	private String estado;
	private String pais;

	public Cliente() {
		this.id = 0;
		this.nome = "";
		this.sobrenome = "";
		this.telefone = "";
		this.celular = "";
		this.contato = "";
		this.telefoneContato = "";
		this.cpfCnpj = "";
		this.rgie = "";
		this.email = "";
		this.endereco = "";
		this.numero = "";
		this.cep = "";
		this.complemento = "";
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
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSobrenome() {
		return sobrenome;
	}
	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getContato() {
		return contato;
	}
	public void setContato(String contato) {
		this.contato = contato;
	}
	public String getTelefoneContato() {
		return telefoneContato;
	}
	public void setTelefoneContato(String telefoneContato) {
		this.telefoneContato = telefoneContato;
	}
	public String getCpfCnpj() {
		return cpfCnpj;
	}
	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj.replaceAll("[^0-9]", "");
	}
	public String getRgie() {
		return rgie;
	}
	public void setRgie(String rgie) {
		this.rgie = rgie;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	
	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public List<String> validar(){
		List<String> retorno = new ArrayList<String>();
		
		if(this.nome.isEmpty())
			retorno.add("Necessário preencher o Nome do cliente");
		else
			if (this.nome.trim().length() < 3)
				retorno.add("O nome do cliente é muito curto");
		
		if(this.sobrenome.isEmpty())
			retorno.add("Necessário preencher o sobrenome do cliente");
		else
			if (this.sobrenome.trim().length() < 3)
				retorno.add("O sobrenome do cliente é muito curto");
		
		if (this.cpfCnpj.isEmpty())
			retorno.add("Necessário preencher o campo CPF (Cnpj)");
		else
			if (!ValidarDados.isCNPJ(this.cpfCnpj) && !ValidarDados.isCPF(this.cpfCnpj))
				retorno.add("Necessário informar um CPF ou CNPJ válido!");
		
		if (this.email.isEmpty())
			retorno.add("Necessário preencher o email do cliente");
		else
			if (!ValidarDados.validarEmail(this.email))
				retorno.add("O Email informado é inválido!");
		
		if (this.telefone.isEmpty())
			retorno.add("Necessário preencher o telefone do cliente");
		
		if (this.contato.isEmpty())
			retorno.add("Necessário preencher o contato do cliente");
		
		if (this.telefoneContato.isEmpty())
			retorno.add("Necessário preencher o telefone do contato do cliente");
		
		return retorno;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

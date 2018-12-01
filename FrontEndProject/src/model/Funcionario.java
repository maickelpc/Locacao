package model;

import java.util.ArrayList;
import java.util.List;

import util.ValidarDados;

public class Funcionario {
	private long id;
	private String nome;
	private String sobrenome;
	private Empresa empresa;
	private String telefone;
	private String celular;
	private String nomeContato;
	private String telefoneContato;
	private String email;
	private String endereco;
	private String numero;
	private String cep;
	private String complemento;
	private String cidade;
	private String bairro;
	private String estado;
	private String pais;
	
	public Funcionario() {
		this.id = 0;
		this.nome = "";
		this.sobrenome = "";
		this.empresa = new Empresa();
		this.telefone = "";
		this.celular = "";
		this.nomeContato = "";
		this.telefoneContato = "";
		this.email = "";
		this.endereco = "";
		this.bairro = "";
		this.numero = "";
		this.cep = "";
		this.complemento = "";
		this.bairro = "";
		this.cidade = "";
		this.estado = "";
		this.pais = "";

		
	}
	
	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
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
	public String getTelefoneContato() {
		return telefoneContato;
	}
	public void setTelefoneContato(String telefoneContato) {
		this.telefoneContato = telefoneContato;
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
	public Empresa getEmpresa() {
		return empresa;
	}
	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}
	public String getNomeContato() {
		return nomeContato;
	}
	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	public List<String> validar(){
		List<String> retorno = new ArrayList<String>();
		
		if( this.nome.isEmpty())
			retorno.add("O Campo Nome não pode ser vazio");
		
		if( this.email.isEmpty())
			retorno.add("O Campo Email não pode ser vazio");
		else if (!ValidarDados.validarEmail(this.email))
			retorno.add("O Campo Email não contém um endereço de email válido");
		
		if( this.telefone.isEmpty())
			retorno.add("O Campo Celular não pode ser vazio");
		
		if( this.empresa == null || this.empresa.getId() == 0)
			retorno.add("É Necessário selecionar a empresa que o funcionário está vinculado");
		
		return retorno;
	}
	
	
	
}

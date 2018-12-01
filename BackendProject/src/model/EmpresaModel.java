package model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import DAO.EntidadeBase;

@Entity
@Table(name="empresa")
public class EmpresaModel implements EntidadeBase {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column
	private String nomeFantasia;
	@Column
	private String razaoSocial;
	@Column
	private String cnpj;
	@Column
	private String ie;
	@Column
	private String endereco;
	@Column
	private String numero;
	@Column
	private String cep;
	@Column
	private String complemento;
	@Column
	private String inscricaoMunicipal;
	@Column
	private String bairro;
	@Column
	private String cidade;
	@Column
	private String estado;
	@Column
	private String pais;

	@OneToMany(mappedBy="empresa", fetch = FetchType.LAZY)
	private List<FuncionarioModel> funcionarios;
	

	@OneToMany(mappedBy="empresa", fetch = FetchType.LAZY)
	private List<EquipamentoModel> equipamentos;
	
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
		this.cnpj = cnpj;
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
	public List<FuncionarioModel> getFuncionarios() {
		return funcionarios;
	}
	public void setFuncionarios(List<FuncionarioModel> funcionarios) {
		this.funcionarios = funcionarios;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public List<EquipamentoModel> getEquipamentos() {
		return equipamentos;
	}
	public void setEquipamentos(List<EquipamentoModel> equipamentos) {
		this.equipamentos = equipamentos;
	}

	
	
}

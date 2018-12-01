package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import DAO.EntidadeBase;

@Entity
@Table(name="locacao")
public class LocacaoModel implements EntidadeBase {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column
	private double valorLocacao;
	@Column
	private int prazo;
	@Column
	private String dataDevolucao;
	@Column
	private String dataRetirada;
	@Column
	private double valorDiaria;
	@Column
	private Integer qtdeDiarias = 0;
	@Column
	private double valorDanificado;
	@Column
	private Integer danificado = 0;
	@Column
	private double valorRecebido;
	@Column
	private String observacoes;
	@Column
	private String situacao = "ATIVO";
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="userRetirada_id", nullable = false)
	private UserModel usuarioRetirada;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userRecebimento_id", nullable = true)
	private UserModel usuarioRecebimento;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userDevolucao_id", nullable = true)
	private UserModel usuarioDevolucao;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userCancelamento_id", nullable = true)
	private UserModel usuarioCancelamento;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="cliente_id", nullable = false)
	private ClienteModel cliente;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="funcionarioRetirada_id", nullable = false)
	private FuncionarioModel funcionarioRetirada;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="funcionarioDevolucao_id", nullable = true)
	private FuncionarioModel funcionarioDevolucao;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="equipamento_id", nullable = false)
	private EquipamentoModel equipamento;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public double getValorLocacao() {
		return valorLocacao;
	}
	public void setValorLocacao(double valorLocacao) {
		this.valorLocacao = valorLocacao;
	}
	public int getPrazo() {
		return prazo;
	}
	public void setPrazo(int prazo) {
		this.prazo = prazo;
	}
	public String getDataDevolucao() {
		return dataDevolucao;
	}
	public void setDataDevolucao(String dataDevolucao) {
		this.dataDevolucao = dataDevolucao;
	}
	public String getDataRetirada() {
		return dataRetirada;
	}
	public void setDataRetirada(String dataRetirada) {
		this.dataRetirada = dataRetirada;
	}
	public double getValorDiaria() {
		return valorDiaria;
	}
	public void setValorDiaria(double valorDiaria) {
		this.valorDiaria = valorDiaria;
	}
	public Integer getQtdeDiarias() {
		return qtdeDiarias;
	}
	public void setQtdeDiarias(Integer qtdeDiarias) {
		this.qtdeDiarias = qtdeDiarias;
	}
	public double getValorDanificado() {
		return valorDanificado;
	}
	public void setValorDanificado(double valorDanificado) {
		this.valorDanificado = valorDanificado;
	}
	public Integer getDanificado() {
		return danificado;
	}
	public void setDanificado(Integer danificado) {
		this.danificado = danificado;
	}
	public double getValorRecebido() {
		return valorRecebido;
	}
	public void setValorRecebido(double valorRecebido) {
		this.valorRecebido = valorRecebido;
	}
	public String getObservacoes() {
		return observacoes;
	}
	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}
	public String getSituacao() {
		return situacao;
	}
	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}
	public UserModel getUsuarioRetirada() {
		return usuarioRetirada;
	}
	public void setUsuarioRetirada(UserModel usuarioRetirada) {
		this.usuarioRetirada = usuarioRetirada;
	}
	public UserModel getUsuarioRecebimento() {
		return usuarioRecebimento;
	}
	public void setUsuarioRecebimento(UserModel usuarioRecebimento) {
		this.usuarioRecebimento = usuarioRecebimento;
	}
	public UserModel getUsuarioDevolucao() {
		return usuarioDevolucao;
	}
	public void setUsuarioDevolucao(UserModel usuarioDevolucao) {
		this.usuarioDevolucao = usuarioDevolucao;
	}
	public UserModel getUsuarioCancelamento() {
		return usuarioCancelamento;
	}
	public void setUsuarioCancelamento(UserModel usuarioCancelamento) {
		this.usuarioCancelamento = usuarioCancelamento;
	}
	public ClienteModel getCliente() {
		return cliente;
	}
	public void setCliente(ClienteModel cliente) {
		this.cliente = cliente;
	}
	public FuncionarioModel getFuncionarioRetirada() {
		return funcionarioRetirada;
	}
	public void setFuncionarioRetirada(FuncionarioModel funcionarioRetirada) {
		this.funcionarioRetirada = funcionarioRetirada;
	}
	public FuncionarioModel getFuncionarioDevolucao() {
		return funcionarioDevolucao;
	}
	public void setFuncionarioDevolucao(FuncionarioModel funcionarioDevolucao) {
		this.funcionarioDevolucao = funcionarioDevolucao;
	}
	public EquipamentoModel getEquipamento() {
		return equipamento;
	}
	public void setEquipamento(EquipamentoModel equipamento) {
		this.equipamento = equipamento;
	}
	
	
}

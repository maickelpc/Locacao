package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Locacao  {
	private long id;
	private double valorLocacao;
	private int prazo;
	private String dataDevolucao;
	private String dataRetirada;
	private double valorDiaria;
	private int qtdeDiarias;
	private double valorDanificado;
	private int danificado;
	private double valorRecebido;
	private String observacoes;
	private String situacao;
	private UserModel usuarioRetirada;
	private UserModel usuarioRecebimento;
	private UserModel usuarioDevolucao;
	private UserModel usuarioCancelamento;
	private Cliente cliente;
	private Funcionario funcionarioRetirada;
	private Funcionario funcionarioDevolucao;
	private Equipamento equipamento;
	
	
	
	public Locacao() {
		super();
		this.id = 0;
		this.valorLocacao = 0;
		this.prazo = 0;
		this.dataDevolucao = "";
		this.dataRetirada = "";
		this.valorDiaria = 0;
		this.qtdeDiarias = 0;
		this.valorDanificado = 0;
		this.danificado = 0;
		this.valorRecebido = 0;
		this.observacoes = "";
		this.situacao = "";
		this.usuarioRetirada = null;
		this.usuarioRecebimento = null;
		this.usuarioDevolucao = null;
		this.usuarioCancelamento = null;
		this.cliente = null;
		this.funcionarioRetirada = null;
		this.funcionarioDevolucao = null;
		this.equipamento = null;
	}
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
	public int getQtdeDiarias() {
		return qtdeDiarias;
	}
	public void setQtdeDiarias(int qtdeDiarias) {
		this.qtdeDiarias = qtdeDiarias;
	}
	public double getValorDanificado() {
		return valorDanificado;
	}
	public void setValorDanificado(double valorDanificado) {
		this.valorDanificado = valorDanificado;
	}
	public int getDanificado() {
		return danificado;
	}
	public void setDanificado(int danificado) {
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
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Funcionario getFuncionarioRetirada() {
		return funcionarioRetirada;
	}
	public void setFuncionarioRetirada(Funcionario funcionarioRetirada) {
		this.funcionarioRetirada = funcionarioRetirada;
	}
	public Funcionario getFuncionarioDevolucao() {
		return funcionarioDevolucao;
	}
	public void setFuncionarioDevolucao(Funcionario funcionarioDevolucao) {
		this.funcionarioDevolucao = funcionarioDevolucao;
	}
	public Equipamento getEquipamento() {
		return equipamento;
	}
	public void setEquipamento(Equipamento equipamento) {
		this.equipamento = equipamento;
	}
	
	public List<String> validar(){
		List<String> retorno = new ArrayList<String>();
		Date dataRetirada = null;
		Date dataDevolucao = null;
		DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		try {
				dataRetirada = (Date)format.parse(this.dataRetirada);
				dataDevolucao = (Date)format.parse(this.dataDevolucao);
				
		}catch(Exception E){
			retorno.add("Datas de retirada e devolução fora do padrão ('DD/MM/AAAA')");
		}
		
		if(dataDevolucao.compareTo(dataRetirada) != 1 )
			retorno.add("A data de devolução deve ser futura em relação à data de retirada");
		if(dataDevolucao.compareTo(new Date()) == -1)
			retorno.add("A data de devolução deve ser uma data futura");
			
		return retorno;
	}
	
}

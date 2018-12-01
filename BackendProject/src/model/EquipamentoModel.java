package model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

import DAO.EntidadeBase;

@Entity
@Table(name="equipamento")
public class EquipamentoModel implements EntidadeBase {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column
	private String codigo;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="empresa_id", nullable = false)
	private EmpresaModel empresa;
	
	@Column
	private String descricao;
	
	@Column
	private String dataCompra;
	
	@Column
	private double valorcompra;
	
	@Column
	private double valorLocacao;
	
	@Column
	private int tempoLocacao;
	
	@Column
	private double valorDiaria;
	
	@Column
	private double valorDanificacao;
	
	@OneToMany(mappedBy="equipamento", fetch = FetchType.LAZY)
	private List<LocacaoModel> locacoes;
	
	public List<LocacaoModel> getLocacoes() {
		return locacoes;
	}

	public void setLocacoes(List<LocacaoModel> locacoes) {
		this.locacoes = locacoes;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public EmpresaModel getEmpresa() {
		return empresa;
	}

	public void setEmpresa(EmpresaModel empresa) {
		this.empresa = empresa;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDataCompra() {
		return dataCompra;
	}

	public void setDataCompra(String dataCompra) {
		this.dataCompra = dataCompra;
	}

	public double getValorcompra() {
		return valorcompra;
	}

	public void setValorcompra(double valorcompra) {
		this.valorcompra = valorcompra;
	}

	public double getValorLocacao() {
		return valorLocacao;
	}

	public void setValorLocacao(double valorLocacao) {
		this.valorLocacao = valorLocacao;
	}

	public int getTempoLocacao() {
		return tempoLocacao;
	}
	
	public void setTempoLocacao(int tempoLocacao) {
		this.tempoLocacao = tempoLocacao;
	}

	public double getValorDiaria() {
		return valorDiaria;
	}

	public void setValorDiaria(double valorDiaria) {
		this.valorDiaria = valorDiaria;
	}

	public double getValorDanificacao() {
		return valorDanificacao;
	}

	public void setValorDanificacao(double valorDanificacao) {
		this.valorDanificacao = valorDanificacao;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Override
	public long getId() {
		return this.id;
	}
	
	
}

package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Equipamento {

	private long id;
	private String codigo;
	private Empresa empresa;
	private String descricao;
	private String dataCompra;
	private double valorcompra;
	private double valorLocacao;
	private int tempoLocacao;
	private double valorDiaria;
	private double valorDanificacao;
	private List<Locacao> locacoes;
	
	public Equipamento() {
		
		this.id = 0;
		this.codigo = "";
		this.empresa = new Empresa();
		this.descricao = "";
		this.dataCompra = "";
		this.valorcompra = 0;
		this.valorLocacao = 0;
		this.tempoLocacao =0;
		this.valorDiaria = 0;
		this.valorDanificacao = 0;	
	}
	
	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
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

	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	

	public List<Locacao> getLocacoes() {
		return locacoes;
	}

	public void setLocacoes(List<Locacao> locacoes) {
		this.locacoes = locacoes;
	}

	public List<String> validar(){
		List<String> retorno = new ArrayList<String>();
		
		if (this.codigo.isEmpty())
			retorno.add("Necessário informar um código de identificação do equipamento");
		
		if (this.getEmpresa().getId() == 0)
			retorno.add("Necessário informar a empresa que o equipamento pertence");
		
		if(this.valorDanificacao <= 0)
			retorno.add("Necessário informar o valor de cobrança em caso de danificação do equipamento");
		
		if(this.valorLocacao <= 0)
			retorno.add("Necessário informar o valor de locação do equipamento");
		
		if(this.valorDiaria <= 0)
			retorno.add("Necessário informar o valor de cobrança de diárias extras do equipamento");
		
		if(this.tempoLocacao <= 0)
			retorno.add("Necessário informar tempo de locação padrão do equipamento");
		
		
		return retorno;
	}
	
}

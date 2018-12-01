package util;

import java.util.ArrayList;
import java.util.List;

public class ExceptionPersonalizada extends Exception{

	private List<String> erros;
	private Object objeto;
	private String mensagemAmigavel;
	
	public ExceptionPersonalizada() {
		super();
		this.erros = new ArrayList<String>();
	}
	
	

	public ExceptionPersonalizada(List<String> erros, Object objeto, String mensagemAmigavel) {
		super();
		this.erros = erros;
		this.objeto = objeto;
		this.mensagemAmigavel = mensagemAmigavel;
	}



	public List<String> getErros() {
		return erros;
	}

	public void setErros(List<String> erros) {
		this.erros = erros;
	}
	
	public void addErros(String error) {
		this.erros.add(error);
	}

	public Object getObjeto() {
		return objeto;
	}

	public void setObjeto(Object objeto) {
		this.objeto = objeto;
	}

	public String getMensagemAmigavel() {
		return mensagemAmigavel;
	}

	public void setMensagemAmigavel(String mensagem) {
		this.mensagemAmigavel = mensagem;
	}
	
	

}

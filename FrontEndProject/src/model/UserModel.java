package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import util.ValidarDados;


public class UserModel {

	
		private long id;
		private String name;
		private String lastname;
		private String email;
		private String telefone;
		private String celular;
		private String senha;
		
		public UserModel() {
			super();
			this.id = 0;
			this.name = "";
			this.lastname = "";
			this.email = "";
			this.telefone = "";
			this.celular = "";
			this.senha = "";
		}

		public UserModel(long id, String name, String lastname, String email, String telefone, String celular,
				String senha) {
			super();
			this.id = id;
			this.name = name;
			this.lastname = lastname;
			this.email = email;
			this.telefone = telefone;
			this.celular = celular;
			this.senha = senha;
		}

		public long getId() {
			return id;
		}

		public void setId(long id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getLastname() {
			return lastname;
		}

		public void setLastname(String lastname) {
			this.lastname = lastname;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getTelefone() {
			return telefone;
		}

		public void setTelefone(String telefone) {
			this.telefone = telefone;
		}

		public String getCelular() {
			return celular;
		}

		public void setCelular(String celular) {
			this.celular = celular;
		}

		public String getSenha() {
			return senha;
		}

		public void setSenha(String senha) {
			this.senha = senha;
		}
		
		public List<String> validar(){
			List<String> retorno = new ArrayList<String>();
			
			if( this.name.isEmpty())
				retorno.add("O Campo Nome não pode ser vazio");
			
			if( this.email.isEmpty())
				retorno.add("O Campo Email não pode ser vazio");
			else if (!ValidarDados.validarEmail(this.email) )
				retorno.add("O Campo Email não contém um endereço de email válido");
			
			if( this.celular.isEmpty())
				retorno.add("O Campo Celular não pode ser vazio");
			
			return retorno;
		}
		
		

}

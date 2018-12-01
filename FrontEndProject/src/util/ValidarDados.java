package util;

import java.util.InputMismatchException;

public class ValidarDados{


	public static boolean validarEmail(String email) {
		if (email != null) {
			if (!email.isEmpty()) {
				if(email.contains("@")) {
					String[] campos = email.split("@");
					if (campos[1].contains(".")) {
						if (campos[1].indexOf(".") > 0 && campos[1].indexOf(".") < (campos[1].length()-1))
							return true;
					}

				}
			}
		}

		return false;
	}

	public static boolean isCNPJ(String cnpj) {
		
		
		String cnpjLimpo = cnpj.replaceAll("[^0-9]", "");
				
		// considera-se erro CNPJ's formados por uma sequencia de numeros iguais
		if (cnpjLimpo.equals("00000000000000") || cnpjLimpo.equals("11111111111111") ||
				cnpjLimpo.equals("22222222222222") || cnpjLimpo.equals("33333333333333") ||
				cnpjLimpo.equals("44444444444444") || cnpjLimpo.equals("55555555555555") ||
				cnpjLimpo.equals("66666666666666") || cnpjLimpo.equals("77777777777777") ||
				cnpjLimpo.equals("88888888888888") || cnpjLimpo.equals("99999999999999") ||
				(cnpjLimpo.length() != 14))
			return(false);

		char dig13, dig14;
		int sm, i, r, num, peso;

		// "try" - protege o código para eventuais erros de conversao de tipo (int)
		try {
			// Calculo do 1o. Digito Verificador
			sm = 0;
			peso = 2;
			for (i=11; i>=0; i--) {
				// converte o i-ésimo caractere do CNPJ em um número:
				// por exemplo, transforma o caractere '0' no inteiro 0
				// (48 eh a posição de '0' na tabela ASCII)
				num = (int)(cnpjLimpo.charAt(i) - 48);
				sm = sm + (num * peso);
				peso = peso + 1;
				if (peso == 10)
					peso = 2;
			}

			r = sm % 11;
			if ((r == 0) || (r == 1))
				dig13 = '0';
			else dig13 = (char)((11-r) + 48);

			// Calculo do 2o. Digito Verificador
			sm = 0;
			peso = 2;
			for (i=12; i>=0; i--) {
				num = (int)(cnpjLimpo.charAt(i)- 48);
				sm = sm + (num * peso);
				peso = peso + 1;
				if (peso == 10)
					peso = 2;
			}

			r = sm % 11;
			if ((r == 0) || (r == 1))
				dig14 = '0';
			else dig14 = (char)((11-r) + 48);

			// Verifica se os dígitos calculados conferem com os dígitos informados.
			if ((dig13 == cnpjLimpo.charAt(12)) && (dig14 == cnpjLimpo.charAt(13)))
				return(true);
			else return(false);
		} catch (InputMismatchException erro) {
			return(false);
		}
	}

	public static String imprimeCNPJ(String cnpj) {
		// máscara do CNPJ: 99.999.999.9999-99
		String cnpjLimpo = cnpj.replaceAll("[^0-9]", "");
		return(cnpjLimpo.substring(0, 2) + "." + cnpjLimpo.substring(2, 5) + "." +
				cnpjLimpo.substring(5, 8) + "." + cnpjLimpo.substring(8, 12) + "-" +
				cnpjLimpo.substring(12, 14));
	}




	public static boolean isCPF(String cpf) {
		String cpfLimpo = cpf.replaceAll("[^0-9]", "");
		// considera-se erro CPF's formados por uma sequencia de numeros iguais
		if (cpfLimpo.equals("00000000000") ||
				cpfLimpo.equals("11111111111") ||
				cpfLimpo.equals("22222222222") || cpfLimpo.equals("33333333333") ||
				cpfLimpo.equals("44444444444") || cpfLimpo.equals("55555555555") ||
				cpfLimpo.equals("66666666666") || cpfLimpo.equals("77777777777") ||
				cpfLimpo.equals("88888888888") || cpfLimpo.equals("99999999999") ||
				(cpfLimpo.length() != 11))
			return(false);

		char dig10, dig11;
		int sm, i, r, num, peso;

		// "try" - protege o codigo para eventuais erros de conversao de tipo (int)
		try {
			// Calculo do 1o. Digito Verificador
			sm = 0;
			peso = 10;
			for (i=0; i<9; i++) {              
				// converte o i-esimo caractere do CPF em um numero:
				// por exemplo, transforma o caractere '0' no inteiro 0         
				// (48 eh a posicao de '0' na tabela ASCII)         
				num = (int)(cpfLimpo.charAt(i) - 48); 
				sm = sm + (num * peso);
				peso = peso - 1;
			}

			r = 11 - (sm % 11);
			if ((r == 10) || (r == 11))
				dig10 = '0';
			else dig10 = (char)(r + 48); // converte no respectivo caractere numerico

			// Calculo do 2o. Digito Verificador
			sm = 0;
			peso = 11;
			for(i=0; i<10; i++) {
				num = (int)(cpfLimpo.charAt(i) - 48);
				sm = sm + (num * peso);
				peso = peso - 1;
			}

			r = 11 - (sm % 11);
			if ((r == 10) || (r == 11))
				dig11 = '0';
			else dig11 = (char)(r + 48);

			// Verifica se os digitos calculados conferem com os digitos informados.
			if ((dig10 == cpfLimpo.charAt(9)) && (dig11 == cpfLimpo.charAt(10)))
				return(true);
			else return(false);
		} catch (InputMismatchException erro) {
			return(false);
		}
	}

	public static String imprimeCPF(String cpf) {
		String cpfLimpo = cpf.replaceAll("[^0-9]", "");
		return(cpfLimpo.substring(0, 3) + "." + cpfLimpo.substring(3, 6) + "." +
				cpfLimpo.substring(6, 9) + "-" + cpfLimpo.substring(9, 11));
	}

}

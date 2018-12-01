function proximaPagina(endereco,paginaAtual){
	window.location.replace(endereco+"?pag="+(paginaAtual+1));
}

function paginaAnterior(endereco,paginaAtual){
	window.location.replace(endereco+"?pag="+(paginaAtual-1));
}

function confirmacaoDelecao(){
	return confirm('Tem certeza que deseja deletar este registro?');
}

function buscarCep(){
    var str = $('#cep').val();
    str = str.toString();
    var cep = str.replace(/\D/g, "");
    if (cep.length > 0) {
        $.ajax({
            method: "GET",
            timeout: 5000,
            url: "https://viacep.com.br/ws/" + cep + "/json/",
            beforeSend: function () {
                $('#endereco').val("....Carregando");
                $('#cidade').val("....Carregando");
                $('#bairro').val("....Carregando");
                $('#estado').val("....Carregando");
                $('#pais').val("....Carregando");

            },
            success: function (data) {
                $('#numero').focus();
                $('#endereco').val(data.logradouro);  
                $('#bairro').val(data.bairro);
                $('#cidade').val(data.localidade);
                $('#estado').val(data.uf);
                $('#pais').val("Brasil");
                
                
                $('#enderecoLabel').addClass("active");
                $('#bairroLabel').addClass("active");
                $('#cidadeLabel').addClass("active");
                $('#estadoLabel').addClass("active");
                $('#paisLabel').addClass("active");

            },
            error: function (msg) {
                $('#endereco').val("");
                $('#bairro').val("");
                $('#cidade').val("");
                $('#estado').val("");
                $('#pais').val("");


            }
        });
    }
};

function mascararCpfCnpj(){
		var str = $('#cpfCnpj').unmask().val();
		console.log(str);
		if (str.length < 11){
			$('#cpfCnpj').removeClass('cnpj');
			$('#cpfCnpj').removeClass('cpf');
			$('#labelCpfCnpj').html("CPF / CNPJ");
			
		}else if(str.length == 11){
			$('#cpfCnpj').removeClass('cnpj');
			$('#cpfCnpj').addClass('cpf');
			$('#labelCpfCnpj').html("CPF:");
		}else{
			$('#cpfCnpj').addClass('cnpj');
			$('#cpfCnpj').removeClass('cpf');
			$('#labelCpfCnpj').html("CNPJ:");
		}	
}

//Mascaras
$(document).ready(function () { 	
	$('.date').mask('00/00/0000');
	$('.date_time').mask('00/00/0000 00:00:00');
	$('.cep').mask('00000-000');
	$('.phone_with_ddd').mask('(00) Z0000-0000');
	
	$('.telefone').mask('(00) 0000Z-0000', {
	    translation: {
	      'Z': {
	        pattern: /[0-9]/, optional: true
	      }
	    }
	  });
	
	
	$('.cpf').mask('000.000.000-00', {reverse: true});
	$('.cnpj').mask('00.000.000/0000-00', {reverse: true});
	$('.monetario').mask("#.##0,00", {reverse: true});
	mascararCpfCnpj();

});


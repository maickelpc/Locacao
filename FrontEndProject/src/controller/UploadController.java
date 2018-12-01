package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Part;

import wsclient.RESTConnectionV2;

public class UploadController {

	public String salvar(Part file) {
		RESTConnectionV2 rest = new RESTConnectionV2();
		Map<String,Object> queryParams = new HashMap<String,Object>();
		String url = "http://localhost:8080/FuncionarioBack/api/upload/salvar";
		return (String) rest.upload(url, "POST", String.class, file, queryParams);		
	}
	
}

package wsclient;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import com.fasterxml.jackson.databind.ObjectMapper;

public class RESTConnectionV2 {

	public String getSendJson(String url, String verboHTTP,Map<?,?> queryParams, Object body) {
		
		HttpURLConnection con = null;
		
		try {
			String fullUrl = url;
			String parteUrl = getQueryParams(queryParams);
			if(parteUrl != null)
				if(!parteUrl.equals("")) {
					fullUrl = fullUrl+"?"+parteUrl;
				}
			System.out.println(fullUrl);
			URL url_ = new URL(fullUrl);
			con = (HttpURLConnection) url_.openConnection();

			//Se for upload
			if(body instanceof Part) {
				con.setRequestProperty("Connection", "Keep-Alive");
				con.setRequestProperty("Cache-Control", "no-cache");
				con.setRequestProperty(
						"Content-Type", "multipart/form-data;boundary=*****");
			}else {
				con.setRequestProperty("Content-Type", "application/json");
			}
			if(verboHTTP.equals("PUT"))
				con.setRequestProperty("Accept", "application/json");

			con.setRequestMethod(verboHTTP);
			con.setConnectTimeout(10000);
			con.setReadTimeout(10000);

			if(body != null) {
				con.setDoOutput(true);				
				DataOutputStream output = new DataOutputStream(con.getOutputStream());

				//Se for upload
				if(body instanceof Part) {
					String fileName = getFileName((Part) body);
					String fieldName = "file";
					output.writeBytes("--*****\r\n");
					output.writeBytes("Content-Disposition: form-data; name=\"" +
							fieldName + "\";filename=\"" +
							fileName + "\"\r\n");
					output.writeBytes("\r\n");
					InputStream filecontent = ((Part) body).getInputStream();
					int read = 0;
					final byte[] bytes = new byte[1024];
					while ((read = filecontent.read(bytes)) != -1) {
						output.write(bytes, 0, read);
					}
					output.writeBytes("\r\n");
					output.writeBytes("--*****--\r\n");
				}else {
					ObjectMapper mapper = new ObjectMapper();
					String content = mapper.writeValueAsString(body);
					System.out.println("Json gerado "+content);
					output.writeBytes(content);	
				}
				output.flush();
				output.close();
			}

			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				String output = null, json = "";
				while ((output = br.readLine()) != null) {
					json+=output;
				}
				//System.out.println("JSON CHEGOU ASSIM: " +json);
				return json;
			}else {
					System.err.println(con.getResponseCode() + "   " + con.getResponseMessage() );
			}
			return "";

		} catch (Exception e) {
			e.printStackTrace();
			try {
				System.err.println(con.getResponseCode() + "   " + con.getResponseMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			return "";
		}finally{
			con.disconnect();
		}
	}


	public List<?> getList(String url, String verboHTTP, Class<?> classe, Object body, Map<?,?> queryParams) {
		try {
			String json = getSendJson(url, verboHTTP,queryParams,body);
			if(json.equals("") || classe == null)
				return null;
			else {
				ObjectMapper objectMapper = new ObjectMapper();
				return objectMapper.readValue(json, objectMapper .getTypeFactory().constructCollectionType(List.class, Class.forName(classe.getName())));
			} 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}

	public Object getObject(String url, String verboHTTP, Class<?> classe, Object body, Map<?,?> queryParams) {
		try {
			String json = getSendJson(url, verboHTTP,queryParams,body);
			System.out.println("Json Enviado "+json);
			if(json.equals("")  || classe == null)
				return null;
			else {
				ObjectMapper objectMapper = new ObjectMapper();
				return objectMapper.readValue(json, objectMapper.getTypeFactory().constructType(Class.forName(classe.getName())));
			} 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}


	public Object upload(String url, String verboHTTP, Class<?> classe, Object body, Map<?,?> queryParams) {
		try {
			String json = getSendJson(url, verboHTTP,queryParams,body);
			if(json.equals("")  || classe == null)
				return null;
			else{
				if(json != null)
					if(!json.contains(":"))
						return json;
				ObjectMapper objectMapper = new ObjectMapper();
				return objectMapper.readValue(json, objectMapper.getTypeFactory().constructType(Class.forName(classe.getName())));
			} 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}


	public String getQueryParams(Map<?,?> map) throws UnsupportedEncodingException {
		if(map == null)
			return null;
		StringBuilder sb = new StringBuilder();
		for (Map.Entry<?,?> entry : map.entrySet()) {
			if (sb.length() > 0) {
				sb.append("&");
			}
			Object valor = "";
			if(entry.getValue() != null) {
				valor = entry.getValue(); 
			}
			sb.append(String.format("%s=%s",
					URLEncoder.encode(entry.getKey().toString(), "UTF-8"),
					URLEncoder.encode(valor.toString(), "UTF-8")
					));
		}
		return sb.toString();       
	}

	private String getFileName(Part part) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String nomereal = "";
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				nomereal = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		if(nomereal.length() >= 4 ) {
			return format.format(new Date()) + nomereal.substring(nomereal.length() - 5, nomereal.length());
		}else
			return null;
	}

}

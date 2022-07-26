package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

@Service
public class XMLDataService {

	@Value("classpath:xml_sample.txt")	// classpath (src/main/java, src/main/resources)
	private Resource xmlFile;
	
	public String getXMLData() throws IOException {
		File f = xmlFile.getFile();
//		System.out.println(f.exists());
		String data  = "";
		Scanner sc = null;
		if(f.exists()) {
			sc = new Scanner(f);
			while(sc.hasNextLine()) {
				data += sc.nextLine() + "\n";
			}
			sc.close();
		}
		return data;
	}

	private String serviceKey = "K7G5hCA%2FRqnmALDK%2F7POZXDGSgTgQFRIcOqpF8HUf9rqLn17QSaJ4Q0Ox732h%2BF%2FgxuyB3bXrdEWApNVwrOtWA%3D%3D";
	
	public String getCovidXML() throws IOException {
		String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson";
		
		// 1) 서비스키, pageNo, numOfRows, startCreateDt, endCreateDt
		// 오늘 날짜 기준 7일의 데이터를 불러와야 한다 (날짜와 문자열을 처리하기 위해서 SimpleDateFormat 사용)
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date end = new Date(today.getTime() - (1000 * 60 * 60 * 24 * 1));
		Date start = new Date(end.getTime() - (1000 * 60 * 60 * 24 * 6));
		
		String startCreateDt = sdf.format(start);
		String endCreateDt = sdf.format(end);
		
		System.out.println(startCreateDt);
		System.out.println(endCreateDt);
		
		// 2) 요청 주소를 만들기 위해서 각 값을 hashmap에 넣어둔다
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("serviceKey", serviceKey);
		param.put("pageNo", "1");
		param.put("numOfRows", "10");
		param.put("startCreateDt", startCreateDt);
		param.put("endCreateDt", endCreateDt);
		
		// 3) 요청주소와 파라미터를 결합하여 새로 만든다
		url += "?";
		for(String key : param.keySet()) {
			url += key + "=" + param.get(key) + "&";
		}
		
		// 4) 만들어진 주소로 요청하여 응답을 받는다
		URL requestURL = new URL(url);
		HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
		conn.setRequestMethod("GET");
		
		Scanner sc = null;
		String data = "";
		
		if(conn.getResponseCode() == 200) {
			sc = new Scanner(conn.getInputStream());
			while(sc.hasNextLine()) {
				data += sc.nextLine();
			}
			sc.close();
			conn.disconnect();
			return data;
		}
		return null;
	}
	
}

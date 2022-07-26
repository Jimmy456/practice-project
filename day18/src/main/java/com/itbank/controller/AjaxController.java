package com.itbank.controller;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.itbank.service.XMLDataService;

@RestController
public class AjaxController {
	
	@Autowired private XMLDataService xs;
	private ObjectMapper objectMapper = new ObjectMapper();
	private XmlMapper xmlMapper = new XmlMapper();
	
	
	// jsp에서 사용하던 application의 getRealPath를 이용하여 파일을 참조하던 방식
	@GetMapping("/test1")	// 원래는 이런 방식으로 파일을 꺼내서 써야하는데 많이 불편하다
	public void test1(HttpServletRequest request) throws IOException {
		String name = "WEB-INF/classes/xml_sample.txt";
		String path = request.getSession().getServletContext().getRealPath(name);
		File f = new File(path);
		System.out.println(path);
		System.out.println("파일이 실제로 존재하는가 : " + f.exists());
		
		Scanner sc = new Scanner(f);
		
		while(sc.hasNextLine()) {
			System.out.println(sc.nextLine());
		}
		sc.close();
		System.out.println("종료");
	}
	
	
	// 파일에 저장된 XML데이터를 json형태로 변환하여 jsp에게 넘겨주는 메서드
	@GetMapping(value="/test2", produces = "application/json; charset=utf-8")
	public String test2() throws IOException {
		String xml = xs.getXMLData();
//		System.out.println(xml);
		
		JsonNode node = xmlMapper.readTree(xml.getBytes());
		String json = objectMapper.writeValueAsString(node);
		
//		System.out.println(json);
		return json;
	}

	
	@GetMapping(value = "/covid19", produces = "application/json; charset=utf-8")
	public String covid19() throws IOException {
		
		// 1) 공공데이터포털 서버에 요청하여 xml 데이터를 받는다
		String xml = xs.getCovidXML();
		
		// 2) xml을 json으로 변환하여 반환한다
		JsonNode node = xmlMapper.readTree(xml.getBytes());
		String json = objectMapper.writeValueAsString(node);
		
		return json;
	}
	
	
}

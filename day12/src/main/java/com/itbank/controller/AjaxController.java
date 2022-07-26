package com.itbank.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.kfc.KfcDTO;
import com.itbank.service.KfcService;

@RestController
public class AjaxController {
	
	@Autowired private KfcService kfcService;
	
	@GetMapping("/kfc")
	public List<KfcDTO> kfc() {
		List<KfcDTO> list = kfcService.getMenuList();
		return list;
	}
	
	@GetMapping("/imgList")
	public String[] imgList(HttpServletRequest request) {
		String p = "resources/img";	// 지정한 경로 내부에
		String path = request.getSession().getServletContext().getRealPath(p);
		System.out.println(path);
		
		File dir = new File(path);
		for(String s : dir.list()) {	// 포함된 파일이나 디렉토리의 이름을
			System.out.println(s);
		}
		return dir.list();	// 문자열의 배열 형태로 반환 (jackson-databind가 javascript형태로 변환)
	}
	
	@GetMapping("/bookList")
	public void bookList(HttpServletRequest request) {
		String p = "resources/img";
		
	}
	
	
}

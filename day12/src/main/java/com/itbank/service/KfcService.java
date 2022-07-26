package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.kfc.KfcDAO;
import com.itbank.kfc.KfcDTO;

@Service
public class KfcService {

	@Autowired private KfcDAO dao;
	
	public List<KfcDTO> getMenuList() {
		return dao.selectList();
	}

}

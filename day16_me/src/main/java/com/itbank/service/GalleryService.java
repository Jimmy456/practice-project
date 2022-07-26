package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itbank.gallery.GalleryDAO;
import com.itbank.gallery.GalleryDTO;

public class GalleryService {

	@Autowired GalleryDAO dao;
	
	public List<GalleryDTO> selectList() {
		return dao.selectList();
	}

	public int insert(GalleryDTO dto) {
		return dao.insert(dto);
	}

	public GalleryDTO getDTO(int idx) {
		return dao.getDTO(idx);
	}

}

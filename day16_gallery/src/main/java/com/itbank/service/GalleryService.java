package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.gallery.GalleryDAO;
import com.itbank.gallery.GalleryDTO;

@Service
public class GalleryService {

	@Autowired private GalleryDAO dao;
	private String uploadPath = "D:\\day16_gallery";
	
	public GalleryService() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}

	public List<GalleryDTO> selectList() {
		return dao.selectList();
	}

	public int insert(GalleryDTO dto) throws IllegalStateException, IOException {
		File dest = new File(uploadPath, dto.getFile().getOriginalFilename());
		dto.getFile().transferTo(dest);
		dto.setImg(dto.getFile().getOriginalFilename());
		return dao.insert(dto);
	}

	public GalleryDTO getDTO(int idx) {
		return dao.getDTO(idx);
	}
	
}

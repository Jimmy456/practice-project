package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.gallery.GalleryDTO;
import com.itbank.service.GalleryService;

@RestController
@RequestMapping("/gallery")
public class GalleryController {
	
	@Autowired private GalleryService galleryService;
	
	@GetMapping
	public List<GalleryDTO> list() {
		return galleryService.selectList();
	}
	
	@PostMapping
	public int insert(GalleryDTO dto) throws IllegalStateException, IOException {
		return galleryService.insert(dto);
	}
	
	@GetMapping("/{idx}")
	public GalleryDTO getDTO(@PathVariable int idx) {
		return galleryService.getDTO(idx);
	}

}

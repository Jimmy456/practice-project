package com.itbank.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.board.BoardDTO;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired private BoardService boardService;
	
	@GetMapping("")
	public ModelAndView board(@RequestParam HashMap<String, String> param) {
		System.out.println(param);
		ModelAndView mav = new ModelAndView("/board/list");
		List<BoardDTO> list = boardService.selectList(param);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView view(@PathVariable int idx, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("board/view");
		
		String referer = request.getHeader("referer");
		String requestURL = request.getRequestURL().toString();
//		System.out.println("referer : " + referer);
//		System.out.println("requestURL : " + requestURL);
//		System.out.println();
		
		if(requestURL.equals(referer) == false) {
			boardService.updateViewCount(idx);
			mav.addObject("url", "board/view/" + idx);
			mav.setViewName("rd");
			return mav;
		}
		
		BoardDTO dto = boardService.selectOne(idx);			// 서비스에서 수정할때와 읽기를 구분하여 작성
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String write(BoardDTO dto) throws IllegalStateException, IOException {
		
		int row = boardService.write(dto);
		System.out.println(row != 0 ? "작성 성공" : "작성 실패");
		return "redirect:/board";
	}
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable int idx) {
		int row = boardService.delete(idx);
		System.out.println(row != 0 ? "삭제 성공" : "삭제 실패");
		return "redirect:/board";
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView("board/modify");
		BoardDTO dto = boardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public String modify(BoardDTO dto) throws IllegalStateException, IOException {
		int row = boardService.modify(dto);
		System.out.println(row != 0 ? "수정 성공" : "수정 실패");
		return "redirect:/board/view/" + dto.getIdx();
	}

}









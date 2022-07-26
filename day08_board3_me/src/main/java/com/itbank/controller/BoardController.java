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
import com.itbank.board.Paging;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired private BoardService boardService;
	
	@GetMapping("")
	public ModelAndView board(@RequestParam HashMap<String, Object> param, Integer page) {
		System.out.println(param);
		ModelAndView mav = new ModelAndView("/board/list");
		int boardCount = boardService.selectBoardCount(param);	// 개수를 가져와서
		page = page == null ? 1 : page;							// 요청받은 페이지를 더해서
		Paging paging = new Paging(page, boardCount);			// 페이징 객체를 생성
		param.put("paging", paging);							// 리스트를 불러오기 위해 param에 포함
		
		List<BoardDTO> list = boardService.selectList(param);	// 리스트를 불러와서
		mav.addObject("list", list);							// 리스트도 jsp에게 보내주고
		mav.addObject("paging", paging);						// paging 객체도 jsp에게 보내준다
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









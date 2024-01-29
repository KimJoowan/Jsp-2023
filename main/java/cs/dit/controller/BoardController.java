package cs.dit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cs.dit.domain.BoardDTO;
import cs.dit.domain.Criteria;
import cs.dit.domain.pageDTO;
import cs.dit.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@RequiredArgsConstructor 
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("/boardupload")
	public String BoardUpload() {
		log.info("BoardUpload");
		return "/board/BoardUpload";		
	}
	
	@PostMapping("/register")
	// 세션에서 "sessionid"라는 이름의 속성을 가져와 String 변수에 바인딩
	public String register(@SessionAttribute("sessionid") String id, BoardDTO board) {
		board.setId(id);
		service.register(board);
		return "redirect:/board/list";	
	}
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {	
		
		if(cri.getPageNum()<1) {
			cri.setPageNum(1);
		}
			
		pageDTO page = new pageDTO(cri, service.total());
		model.addAttribute("page", page);
		
		if(page.isNextWell()) {
			cri.setPageNum(page.getRealEnd());
			model.addAttribute("list", service.getlist(cri));	
		}

		model.addAttribute("list", service.getlist(cri));	
		return "/board/list";					
	}
	
	@GetMapping("/get")
	public String getlist(int bcode, Model model) {
		log.info("get ");
		model.addAttribute("BoardDto", service.get(bcode));
		return "/board/Get";	
	}
	
	@PostMapping("/modify")
	public String modify(BoardDTO dto) {
		service.modify(dto);
		return "redirect:/board/list";
		
	}
	
	@GetMapping("/remove")
	public String remove(int bcode) {
		service.remove(bcode);
		return "redirect:/board/list";	
	}
	
	
	
	
	
}

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
	public String register(HttpServletRequest request, BoardDTO board) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionid");	
		board.setId(id);
		service.register(board);
		return "redirect:/board/list";	
	}
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info("list");

		if(service != null) {
			int total = service.total();
			model.addAttribute("list", service.getlist(cri));
			
			pageDTO page = new pageDTO(cri, total);
			model.addAttribute("page", page);
			log.info("getStartPage"+page.getStartPage());
			log.info("getEndPage"+page.getEndPage());
			
			return "/board/list";
		}else {
			return "/error";
		}			
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

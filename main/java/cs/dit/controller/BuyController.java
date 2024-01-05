package cs.dit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cs.dit.domain.BuyDTO;
import cs.dit.service.BuyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/buy/*")
@RequiredArgsConstructor 
public class BuyController {
	
	@Autowired
	private BuyService service;

	@PostMapping("/register")
	public String register(HttpServletRequest request, BuyDTO dto) {
		log.info("register");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionid");	
		dto.setId(id);
		service.register(dto);		
		return "/main/main";	
	}
	
	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		log.info("list");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionid");	
		
		model.addAttribute("value", service.getlist(id));
		return "/buy/List";	
	}
}

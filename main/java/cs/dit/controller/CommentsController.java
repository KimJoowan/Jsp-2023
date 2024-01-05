package cs.dit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cs.dit.service.CommentsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/comment/*")
@RequiredArgsConstructor 
public class CommentsController {
	
	@Autowired
	private final CommentsService service;
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String insert(int bcode, String content) {
		log.info("register");
		log.info("bcode:"+bcode);
		log.info("content:"+content);
		
		service.register(bcode, content);
		return "/main/main";
	}
	
	@GetMapping("/list")
	public String list(Model model, @RequestParam(name = "bcode", required = false) Integer bcode) {
		
		if (bcode != null) {
			log.info("list");
			log.info("bcode:"+bcode);
			model.addAttribute("value", service.list(bcode));
			return "/main/main";
		}else {
			log.info("error");
			return "error";
		}
			
	}
	
	
	
	
	
	
	

}

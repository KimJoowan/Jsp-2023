package cs.dit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@RequiredArgsConstructor 
public class HomeController2 {
	
	
	@RequestMapping("main")
	public String main() {
		log.info("main");
		return "main/main";
	}
	
	@RequestMapping("index")
	public String index() {
		log.info("index");
		return "main/index";
	}
	
	
}

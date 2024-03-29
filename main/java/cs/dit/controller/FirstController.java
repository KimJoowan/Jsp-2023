package cs.dit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor 
public class FirstController {
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/main/index";
	}

}

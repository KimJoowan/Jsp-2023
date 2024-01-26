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
	
	@PostMapping("/register")
	@ResponseBody
	public ResponseEntity<Boolean> insert(int bcode, String content) {
		boolean data = false;
			
		if(service.register(bcode, content)) {
			data = true;
		}
		
		return new ResponseEntity<>(data, HttpStatus.OK);
	}
	
	@GetMapping("/list")
	@ResponseBody
	public List<CommentsDTO> list(Model model, int bcode) {
			
		if (bcode > 0) {
			log.info("list");
			log.info("bcode:"+bcode);
			List<CommentsDTO> value = service.list(bcode);
			return value;	
		}
		
		return null;
		
			
	}
	
	
	
	
	
	
	

}

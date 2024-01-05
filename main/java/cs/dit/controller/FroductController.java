package cs.dit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cs.dit.domain.Criteria;
import cs.dit.domain.PrDTO;
import cs.dit.domain.StockpageDTO;
import cs.dit.service.PrService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/froduct/*")
@RequiredArgsConstructor 
public class FroductController {
	
	@Autowired
	private final PrService service;
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info("list-----------------------------------------------------------");
		int count = service.total();
		model.addAttribute("list", service.list(cri));
		model.addAttribute("page", new StockpageDTO(cri, count));
		return "froduct/List";	
	}
	
	@GetMapping("/getlist")
	public String getlist(PrDTO pr, Model model) {
		log.info("getlist-----------------------------------------------------------");
		model.addAttribute("value", service.selectlist(pr));
		return "froduct/Getlist";
	}
	
	@GetMapping("/get")
	public String get(int pcode, Model model) {
		log.info("/get-----------------------------------------------------------");
		
		model.addAttribute("value", service.get(pcode));
		return "/froduct/Get";
	}
	
	
	
	
	
}

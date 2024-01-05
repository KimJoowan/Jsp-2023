package cs.dit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import cs.dit.domain.Criteria;
import cs.dit.domain.PrDTO;
import cs.dit.domain.pageDTO;
import cs.dit.service.PrService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/stakeholder/*")
@RequiredArgsConstructor
public class StakeholderController {
	
	@Autowired
	private PrService service;
	
	@RequestMapping("/addproduct")
	public String addprdoduct() {
		return "/stakeholder/Addproduct";		
	}
	
	@RequestMapping("/main")
	public String main() {		
		return "/stakeholder/Main";		
	}
	
	@PostMapping("/register")
	public String register(PrDTO pr) {
		log.info("register");
	    int count = service.register(pr);
	        if (count == 1) {
	            return "/stakeholder/Main";
	        } else {
	            return null;
	        }
	        
	}
	
	@GetMapping("/productlist")
	public String list(Criteria cri, Model model) {
		log.info("list");
		int count = service.total();
		
		model.addAttribute("list", service.list(cri));
		model.addAttribute("page", new pageDTO(cri, count));
		return "/stakeholder/ProductList";
	}
	
	@GetMapping("/get")
	public String get(Model model, int pcode) {
		service.get(pcode);
		model.addAttribute("dto", service.get(pcode));
		return "/stakeholder/Get";
	}
	
	@PostMapping("/update")
	public String update(PrDTO pr) {
		service.modify(pr);
		return "/stakeholder/Main";
	}
	
	@RequestMapping("/delete")
	public String delete(int pcode) {
		service.remove(pcode);
		return "/stakeholder/Main";
	}
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	

}

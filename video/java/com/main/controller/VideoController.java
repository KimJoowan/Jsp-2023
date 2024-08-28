package com.main.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.main.domain.Criteria;
import com.main.domain.VideoDto;
import com.main.service.VideoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/video/*")
@RequiredArgsConstructor 
@Log4j
public class VideoController {
	
	@Autowired
	private final VideoService service;
			
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("/upload")
	public String upload() {
		return "/video/upload";
		
	}
	
	@PostMapping("/upload")
    public String uploads(VideoDto dto, Model model) {	
		log.info("dto:"+dto);
        service.saveFile(dto, servletContext);
        log.info("dto:"+dto);    
        return "redirect:/video/getlist";
    }	

	@GetMapping("/getlist")
	public String getlist(Criteria cri, Model model) {
		model.addAttribute("videoDto", service.getlist(cri));
		return "/video/index";
	}
	
	@GetMapping("/get")
	public String get(int acode, Model model) {
		model.addAttribute("videoDto", service.get(acode));
		return "/video/get";		
	}

}

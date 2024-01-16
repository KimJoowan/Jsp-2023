package cs.dit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;

import cs.dit.domain.MemberDTO;
import cs.dit.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@RequiredArgsConstructor 
public class MemberController {
	
	@Autowired
	private final MemberService service;
	
	@RequestMapping("joinmembership")
	public String joinmembership() {
		log.info("joinmembership");
		return "/member/Memberadd";
	}
	
	@RequestMapping("login")
	public String login() {
		log.info("login");
		return "member/Login";
	}
	
	@RequestMapping("/unregister")
	public String unregister(){
		return "/member/Unregister";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("sessionid");
		return "redirect:/main/index";
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
	public ResponseEntity<Boolean> confirmId(String id){
		boolean result = true;
		if(id.trim().isEmpty()) {
			log.info("id : " + id);
			result = false;
		}else {
			if (service.chack(id)) {
				result = false;
			} else {
				result = true;
			}
		}
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
		
	@PostMapping("/regiseter")
	public String regiseter(MemberDTO member) {
		log.info("regiseter");
		int count = service.register(member);
		
		if(count == 1) {
			return"redirect:/main/index";
		}else {			
			return null;
		}
	}
	
	@PostMapping("/check")
	@ResponseBody
	public ResponseEntity<Boolean> login(HttpServletRequest request, MemberDTO member) {		
		log.info("check");
		
		boolean result = service.check(member);
		
		if(result) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionid", member.getId());
			result = true;
		}else {
			result = false;
		}	
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("/get")
	public String get(HttpServletRequest request, Model model) {
		log.info("get");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionid");	
		MemberDTO  Dto = new MemberDTO();
		Dto = service.get(id);
		log.info(Dto);
		
		if(Dto != null) {
			model.addAttribute("Dto", Dto);
			return "/member/Get";
		}else {
			return null;
		}	
	}
	
	@PostMapping("/modify")
	public String modify(MemberDTO member) {
		log.info("get");
		
		int count = service.modify(member);
		
		if(count == 1) {
			return "main/main";
		}else {
			return null;
		}		
	}
	
	@RequestMapping("/remove")
	public String remove(HttpServletRequest request) {
		log.info("remove");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionid");	
		int count = service.remove(id);
		
		if(count == 1) {
			return "main/index";
		}else {
			return null;
		}
		
		
	}
		
	
	
	
	
	
	
	
	
}

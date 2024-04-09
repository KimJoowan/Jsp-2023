package cs.dit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
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
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("joinmembership")
	public String joinmembership() {
		return "/member/Memberadd";
	}
	
	@RequestMapping("login")
	public String login() {
		return "member/Login";
	}
	
	@RequestMapping("/unregister")
	public String unregister(){
		return "/member/Unregister";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
	    HttpSession session = request.getSession(false);
	    
	    if (session != null) {
	        session.invalidate();
	    }
	    
	    return "redirect:/main/index";
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
	public ResponseEntity<Boolean> confirmId(String id){
		boolean result = service.idCheck(id);
		return new ResponseEntity<>(result, HttpStatus.OK);	
	}		
				
	@PostMapping("/register")
	public String regiseter(MemberDTO member) {
	
		String encdoePassword = passwordEncoder.encode(member.getPwd());
		member.setPwd(encdoePassword);
				
		if(service.register(member)) {
			return"redirect:/main/index";
		}
		
		//보류
		return null;
	}
	
	@PostMapping("/check")
	@ResponseBody
	public ResponseEntity<Boolean> login(HttpServletRequest request, MemberDTO member) {
		boolean result = false;	
		MemberDTO getMember = service.get(member.getId());
		
		if(getMember != null) {
			result = passwordEncoder.matches(member.getPwd(), getMember.getPwd());
		}
								
		if(result) {
			// 로그인 성공 => 세션 생성
			// 세션을 생성하기 전에 기존의 세션 파기
			request.getSession().invalidate();
			
			 // Session이 없으면 생성
			HttpSession session = request.getSession(true);
			
			 // 세션에 sessionid를 넣어줌
			session.setAttribute("sessionid", member.getId());
			
			// Session의 유효 시간 설정 (1800초 = 30분)
			session.setMaxInactiveInterval(1800);	
		}
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("/get")
	public String get(@SessionAttribute(name = "sessionid", required = false) String id, Model model) {		
		if(id != null) {
			model.addAttribute("Dto", service.get(id));
			return "/member/Get";
		}
		
		return "redirect:/main/index";			
	}
	
	@PostMapping("/modify")
	public String modify(MemberDTO member) {
		if(service.modify(member)) {
			return "redirect:/main/main";			
		}
		
		return "redirect:/main/index";	
	}
	
	@RequestMapping("/remove")
	public String remove(@SessionAttribute(name = "sessionid", required = false) String id, HttpServletRequest request) {
		 HttpSession session = request.getSession(false);
		 
		if(service.remove(id)) {
			session.invalidate();
			return "redirect:/main/index";
		}
		
		return "redirect:/main/index";
		
	}	
}

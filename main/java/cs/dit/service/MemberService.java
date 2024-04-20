package cs.dit.service;

import cs.dit.domain.MemberDTO;

public interface MemberService {
	public Boolean register(MemberDTO member);
	
	public Boolean check(MemberDTO member);
	
	public MemberDTO get(String id);
	
	public Boolean modify(MemberDTO member);
	
	public Boolean pwdModify(MemberDTO member);
	
	public Boolean remove(String id);
	
	public Boolean idCheck(String id);
	
}

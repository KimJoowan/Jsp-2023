package cs.dit.service;

import cs.dit.domain.MemberDTO;

public interface MemberService {
	public int register(MemberDTO member);
	
	public Boolean check(MemberDTO member);
	
	public MemberDTO get(String id);
	
	public int modify(MemberDTO member);
	
	public int remove(String id);

	public Boolean chack(String id);

}

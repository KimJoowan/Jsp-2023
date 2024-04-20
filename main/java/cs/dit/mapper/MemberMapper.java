package cs.dit.mapper;

import cs.dit.domain.MemberDTO;

public interface MemberMapper {
	public Boolean insert(MemberDTO member);
	
	public Boolean login(MemberDTO member);
	
	public MemberDTO selectone(String id);
	
	public Boolean update(MemberDTO member);
	
	public Boolean pwdupdate(MemberDTO member);
	
	public Boolean delete(String id);
	
	public Boolean idCheck(String id);

}

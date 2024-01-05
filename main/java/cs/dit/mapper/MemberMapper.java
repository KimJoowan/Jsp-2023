package cs.dit.mapper;

import cs.dit.domain.MemberDTO;

public interface MemberMapper {
	public int insert(MemberDTO member);
	
	public MemberDTO login(MemberDTO member);
	
	public MemberDTO selectone(String id);
	
	public int update(MemberDTO member);
	
	public int delete(String id);

}

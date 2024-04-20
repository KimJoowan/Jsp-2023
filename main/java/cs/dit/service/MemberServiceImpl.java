package cs.dit.service;

import org.springframework.stereotype.Service;

import cs.dit.domain.MemberDTO;
import cs.dit.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	//spring 4.3 이상에서 자동 처리
	private final MemberMapper mapper;
	
	@Override
	public Boolean register(MemberDTO member) {
		log.info("insert------------------------------");
		return mapper.insert(member);
	}

	@Override
	public Boolean check(MemberDTO member) {
		log.info("Login------------------------------");
		return mapper.login(member);
	}
	
	@Override
	public MemberDTO get(String id) {
		return mapper.selectone(id);
	}

	@Override
	public Boolean modify(MemberDTO member) {
		log.info("update------------------------------");
		if(member != null) {
			return mapper.update(member);
		}
		return false;	
	}

	@Override
	public Boolean remove(String id) {	
		if(id != null && !id.trim().isEmpty()) {
			return mapper.delete(id);
		}
		return false;
	}

	@Override
	public Boolean idCheck(String id) {
		log.info("chack------------------------------");
		return mapper.idCheck(id);
	}

	@Override
	public Boolean pwdModify(MemberDTO member) {
		return mapper.pwdupdate(member);
	}	
}

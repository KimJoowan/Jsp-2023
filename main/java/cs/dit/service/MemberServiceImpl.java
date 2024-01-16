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
	//spring 4.3 ÀÌ»ó¿¡¼­ ÀÚµ¿ Ã³¸®
	private final MemberMapper mapper;
	
	@Override
	public int register(MemberDTO member) {
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
		log.info("selectone------------------------------");
		return mapper.selectone(id);
	}

	@Override
	public int modify(MemberDTO member) {
		log.info("update------------------------------");
		return mapper.update(member);
	}

	@Override
	public int remove(String id) {
		log.info("delect------------------------------");
		return mapper.delete(id);
	}

	@Override
	public Boolean chack(String id) {
		log.info("chack------------------------------");
		return mapper.chack(id);
	}
	
	
}

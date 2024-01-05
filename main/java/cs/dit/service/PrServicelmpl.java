package cs.dit.service;

import java.io.File;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.springframework.stereotype.Service;

import cs.dit.domain.Criteria;
import cs.dit.domain.PrDTO;
import cs.dit.mapper.PrMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class PrServicelmpl implements PrService {
	private final PrMapper Mapper;

	@Override
	public int register(PrDTO pr) {
		log.info("insert---------------------------------------------------");				
		return Mapper.insert(pr);
		
	}

	@Override
	public List<PrDTO> list(Criteria cri) {
		log.info("list---------------------------------------------------");		
		return Mapper.list(cri);
	}

	@Override
	public PrDTO get(int pcode) {
		log.info("selectone---------------------------------------------------");
		return Mapper.selectone(pcode);
	}

	@Override
	public int modify(PrDTO pr) {
		log.info("update---------------------------------------------------");
		return Mapper.update(pr);
		
	}

	@Override
	public int remove(int pr) {
		log.info("delete---------------------------------------------------");
		return Mapper.delete(pr);
		
	}

	@Override
	public int total() {
		log.info("total---------------------------------------------------");
		return Mapper.total();
	}

	@Override
	public List<PrDTO> selectlist(PrDTO pr) {
		log.info("selectlist---------------------------------------------------");
		return Mapper.selectlist(pr);
	}
	

	

}

package cs.dit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cs.dit.domain.CommentsDTO;
import cs.dit.mapper.CommentsMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class CommentsServicelmpl implements CommentsService{
	
	//spring 4.3 �̻󿡼� �ڵ� ó��
	private final CommentsMapper Mapper;
	
	@Override
	public List<CommentsDTO> list(int bcode) {
		log.info("list");
		return Mapper.list(bcode);
		
	}

	@Override
	public void register(int bcode, String content) {
		log.info("register");
		Mapper.insert(bcode,content);
		
	}

}

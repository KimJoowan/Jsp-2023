package cs.dit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cs.dit.domain.BoardDTO;
import cs.dit.domain.Criteria;
import cs.dit.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class BoardServicelmpl implements BoardService {

	private final BoardMapper Mapper;
	
	@Override
	public void register(BoardDTO board) {
		log.info("register-----------------------------------");
		Mapper.insert(board);

	}

	@Override
	public List<BoardDTO> getlist(Criteria cri) {
		log.info("list-----------------------------------");
		log.info(cri);
		return Mapper.list(cri);
	}

	@Override
	public BoardDTO get(int bcode) {
		log.info("selectone-----------------------------------");
		return Mapper.selectone(bcode);
	}

	@Override
	public void modify(BoardDTO board) {
		log.info("update-----------------------------------");
		Mapper.update(board);

	}

	@Override
	public void remove(int bcode) {
		log.info("delete-----------------------------------");
		Mapper.delete(bcode);

	}

	@Override
	public int total() {
		log.info("total-----------------------------------");
		return Mapper.total();
	}

}

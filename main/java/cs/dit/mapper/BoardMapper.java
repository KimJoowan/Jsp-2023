package cs.dit.mapper;

import java.util.List;

import cs.dit.domain.BoardDTO;
import cs.dit.domain.Criteria;

public interface BoardMapper {
	public void insert(BoardDTO board);
	
	public List<BoardDTO> list(Criteria cri);
	
	public BoardDTO selectone(int bcode);
	
	public int update(BoardDTO board);
	
	public void delete(int bcode);
	
	public int total();
	
}

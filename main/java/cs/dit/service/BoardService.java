package cs.dit.service;

import java.util.List;

import cs.dit.domain.BoardDTO;
import cs.dit.domain.Criteria;

public interface BoardService {
	public void register(BoardDTO board);
	
	public List<BoardDTO> getlist(Criteria cri);
	
	public BoardDTO get(int bcode);
	
	public void modify(BoardDTO board);
	
	public void remove(int bcode);
	
	public int total();
}

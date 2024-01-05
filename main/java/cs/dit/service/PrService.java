package cs.dit.service;

import java.util.List;

import cs.dit.domain.Criteria;
import cs.dit.domain.PrDTO;

public interface PrService {
	public int register(PrDTO pr);
	
	public List<PrDTO> list(Criteria cri);
	
	public List<PrDTO> selectlist(PrDTO pr);
	
	public PrDTO get(int pcode);
	
	public int modify(PrDTO pr);
	
	public int remove(int pr);
	
	public int total();

	
}

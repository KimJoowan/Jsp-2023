package cs.dit.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cs.dit.domain.Criteria;
import cs.dit.domain.PrDTO;

public interface PrMapper {
	public int insert(PrDTO pr);
	
	public List<PrDTO> list(Criteria cri);
	
	public List<PrDTO> selectlist(PrDTO pr);
	
	public PrDTO selectone(int pcode);
		
	public int update(PrDTO pr);
	
	public int delete(int pr);
	
	public int total();

}

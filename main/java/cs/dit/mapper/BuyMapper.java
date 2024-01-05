package cs.dit.mapper;

import java.util.List;

import cs.dit.domain.BuyDTO;

public interface BuyMapper {
	
	public void insert(BuyDTO dto);
	
	public List<BuyDTO> list(String id);
	

}

package cs.dit.service;

import java.util.List;

import cs.dit.domain.BuyDTO;

public interface BuyService {
	public void register(BuyDTO dto);
	
	public List<BuyDTO> getlist(String id);
}

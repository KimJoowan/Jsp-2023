package cs.dit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cs.dit.domain.BuyDTO;
import cs.dit.mapper.BuyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class BuyServicelmpl implements BuyService{
	
	//spring 4.3 이상에서 자동 처리
	private final BuyMapper mapper;
	
	@Override
	public void register(BuyDTO dto) {
		mapper.insert(dto);
	}

	@Override
	public List<BuyDTO> getlist(String id) {	
		return mapper.list(id);
	}
		
	
	
	
	
	
	
	
	
	

}

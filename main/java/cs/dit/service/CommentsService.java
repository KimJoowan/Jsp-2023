package cs.dit.service;

import java.util.List;

import cs.dit.domain.CommentsDTO;

public interface CommentsService {
	public List<CommentsDTO> list(int bcode);
	
	public Boolean register(int bcode, String content);
}

package com.main.mapper;

import java.util.List;

import com.main.domain.Criteria;
import com.main.domain.VideoDto;

public interface VideoMapper {
	
	public void insert(VideoDto dto);
		
	public List<VideoDto> list(Criteria cri);
	
	public VideoDto get(int acode);
	
	public void update(VideoDto dto);
	
	public void delete(int acode); 

}

package com.main.service;

import java.util.List;

import javax.servlet.ServletContext;

import com.main.domain.Criteria;
import com.main.domain.VideoDto;

public interface VideoService {

	public void register(VideoDto dto);
	
	public List<VideoDto> getlist(Criteria cri);
	
	public VideoDto get(int acode);
	
	public void modify(VideoDto dto);
	
	public void remove(int acode);
	
	public void saveFile(VideoDto dto, ServletContext servletContext);
	
}

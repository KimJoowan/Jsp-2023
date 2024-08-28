package com.main.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class VideoDto {
	int acode;
	String title, explanation, videoName, imgName;
	MultipartFile uploadfile, uploadimg;
	Date regdate, updatedate;
}

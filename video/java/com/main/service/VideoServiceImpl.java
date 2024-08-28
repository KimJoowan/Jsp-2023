package com.main.service;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.domain.Criteria;
import com.main.domain.VideoDto;
import com.main.mapper.VideoMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.bramp.ffmpeg.FFmpeg;
import net.bramp.ffmpeg.FFmpegExecutor;
import net.bramp.ffmpeg.FFprobe;
import net.bramp.ffmpeg.builder.FFmpegBuilder;

@Service
@RequiredArgsConstructor
@Log4j
public class VideoServiceImpl implements VideoService {
	
	@Autowired
	private final VideoMapper mapper;
	 
	@Override
	public void register(VideoDto dto) {
		mapper.insert(dto);	
	}

	@Override
	public List<VideoDto> getlist(Criteria cri) {
		return mapper.list(cri);
	}

	@Override
	public VideoDto get(int acode) {
		return mapper.get(acode);
	}

	@Override
	public void modify(VideoDto dto) {
		mapper.update(dto);
		
	}

	@Override
	public void remove(int acode) {
		mapper.delete(acode);
		
	}
	
	@Override
	public void saveFile(VideoDto dto, ServletContext servletContext) {	
		String uploadPath = servletContext.getRealPath("/resources/static/upload/");	  
		
        try {  	        	
        	MultipartFile file1 = dto.getUploadimg();
            MultipartFile file2 = dto.getUploadfile();
        	
            dto.setImgName(randomUUID(file1.getOriginalFilename()));
            file1.transferTo(new File(uploadPath + dto.getImgName()));
            
            dto.setVideoName(file2.getOriginalFilename());  
            file2.transferTo(new File(uploadPath + dto.getVideoName()));
            
            mapper.insert(dto);
            //encodings(dto.getVideoName());           
        } catch (IOException e) {
            log.error("upload failed", e);            
        }
	}
	
	public String randomUUID(String originalFileName) {
		String ext = FilenameUtils.getExtension(originalFileName);
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString() + "." + ext;
		return fileName;		
	}
	
	public void encodings(String fileName) {
		/*
		String inputPath = "\"C:\\Users\\kimjoowan\\Documents\\video\\ShowDown(쇼다운).mp4\"";
        String outputPath = "\"C:\\Users\\kimjoowan\\Documents\\video - 복사본\\ShowDown(쇼다운).mp4\"";
        */
	    try {	     	      	       
	        FFmpeg ffmpeg = new FFmpeg("src/test/resources/ffmpeg/bin/ffmpeg.exe");
			FFprobe ffprobe = new FFprobe("src/test/resources/ffmpeg/bin/ffprobe.exe");
			
			log.info(fileName);
			String inputPath = "\"C:\\Spring\\video-A3\\src\\main\\webapp\\resources\\static\\upload\\"+fileName+"\"";
	        String outputPath = "\"C:\\Spring\\video-A3\\src\\main\\webapp\\resources\\video\\"+fileName+"\"";
	        	        
	        FFmpegBuilder builder = createFFmpegBuilder(inputPath, outputPath);
	        FFmpegExecutor executor = new FFmpegExecutor(ffmpeg, ffprobe);
	        executor.createJob(builder).run();	        
	    } catch (Exception e) {
	        log.info("비디오 인코딩 중 오류 발생", e);
	    }		
	}
	
	public FFmpegBuilder createFFmpegBuilder(String inputPath, String outputPath) {
	    return new FFmpegBuilder()
	        .setInput(inputPath)              // Set the input file path
	        .overrideOutputFiles(true)       // Overwrite the output file if it already exists
	        .addOutput(outputPath)           // Set the output file path
	            .setFormat("mp4")            // Specify the format of the output file
	            .setVideoCodec("libx265")    // Use libx265 codec for video encoding
	            .disableSubtitle()           // Disable subtitle encoding
	            .setAudioChannels(2)         // Set the number of audio channels to 2 (stereo)
	            .setAudioBitRate(96000)      // Set audio bitrate to 96 kbps
	            .setVideoResolution(640, 480) // Set video resolution to 640x480
	            .setVideoBitRate(800000)     // Set video bitrate to 800 kbps (reduce if needed)      
	            .setStrict(FFmpegBuilder.Strict.EXPERIMENTAL) // Allow experimental codecs/features
	        .done();                          // Complete the builder configuration
	}
	
}

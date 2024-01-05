package cs.dit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private int bcode;
	private String id;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
}
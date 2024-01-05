package cs.dit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentsDTO {
	private int num;
	private int bcode;
	private int ccode;
	private String content;
	private Date regdate;
}

package cs.dit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PrDTO {
	private int pcode,price,count;
	private String subject,content;
	private Date regdate, updatedate;
}

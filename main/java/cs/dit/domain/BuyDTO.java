package cs.dit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BuyDTO {
	private int bcode;
	private int count;
	private int price;
	private String id;
	private String subject;
	private Date regdate;
}

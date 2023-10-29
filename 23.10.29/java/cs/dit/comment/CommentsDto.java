package cs.dit.comment;

import java.sql.Date;


public class CommentsDto {
	private int num;
	private int bcode;
	private int ccode;
	private String content;
	private Date regdate;
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getBcode() {
		return bcode;
	}

	public void setBcode(int bcode) {
		this.bcode = bcode;
	}

	public int getCcode() {
		return ccode;
	}

	public void setCcode(int ccode) {
		this.ccode = ccode;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	CommentsDto(int num, int ccode, int bcode, String content, Date regdate) {
		this.num = num;
		this.ccode = ccode;
		this.bcode = bcode;
		this.content = content;
		this.regdate = regdate;
			
	}
	
	CommentsDto(){}
	
	
	
}

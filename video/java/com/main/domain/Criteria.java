package com.main.domain;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int amount;	  

	public Criteria() {
		this(1, 10);
	}
	
	public int getPageStart() {
	    return (this.pageNum - 1) * this.amount;
	}
	
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
				
	}	
}

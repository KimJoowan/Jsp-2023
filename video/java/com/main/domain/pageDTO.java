package com.main.domain;

import lombok.Data;

@Data
public class pageDTO {
	private int startPage;
	private int endPage;
	private int realEnd;
	private boolean nextWell;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public pageDTO(Criteria cri, int total) {
		
		// 시작페이지, 한페이지당 게시글 수
		this.cri = cri;
		
		// 게시글수
		this.total = total;
		
		// 한 페이지에 있는 페이지버튼 갯수
		int numOfPages = 5;
		
		// 페이지 블록수
		this.realEnd = (int)Math.ceil((float)total/(float)cri.getAmount());
		
		// 한 페이지에 있는 블록 끝 번호
		this.endPage = (int)Math.ceil((float)cri.getPageNum()/(float)numOfPages) * numOfPages;
					
		//사용자가 ednNo 값을 realEnd 기준으로 크거나 작게 설정했을 경우 
		this.endPage = this.endPage > realEnd? realEnd:this.endPage;
		
		// 한 페이지에 있는 블록 시작번호
		this.startPage = this.endPage > numOfPages ? this.endPage - (numOfPages-1):1;
		
		// 강제 이동 여부
		this.nextWell =  this.endPage < cri.getPageNum();
			
		//블록 이전 버튼 여부
		this.prev = this.startPage > 1;
		
		//블록 다음 버튼 여부
		this.next = this.endPage < realEnd;
				
	}
	
	
	
}

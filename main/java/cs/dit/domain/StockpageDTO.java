package cs.dit.domain;

import lombok.Data;

@Data
public class StockpageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public StockpageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		int numOfPages = 5;
		
		this.endPage = (int)Math.ceil((float)cri.getPageNum()/(float)numOfPages) * numOfPages;
		
		this.startPage = this.endPage - (numOfPages-1);
		
		int realEnd = (int)Math.ceil((float)total/(float)cri.getAmount());
		
		this.endPage = this.endPage > realEnd? realEnd:this.endPage;
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
				
	}
	
	
	
}

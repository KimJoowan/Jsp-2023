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
		
		// ����������, ���������� �Խñ� ��
		this.cri = cri;
		
		// �Խñۼ�
		this.total = total;
		
		// �� �������� �ִ� ��������ư ����
		int numOfPages = 5;
		
		// ������ ��ϼ�
		this.realEnd = (int)Math.ceil((float)total/(float)cri.getAmount());
		
		// �� �������� �ִ� ��� �� ��ȣ
		this.endPage = (int)Math.ceil((float)cri.getPageNum()/(float)numOfPages) * numOfPages;
					
		//����ڰ� ednNo ���� realEnd �������� ũ�ų� �۰� �������� ��� 
		this.endPage = this.endPage > realEnd? realEnd:this.endPage;
		
		// �� �������� �ִ� ��� ���۹�ȣ
		this.startPage = this.endPage > numOfPages ? this.endPage - (numOfPages-1):1;
		
		// ���� �̵� ����
		this.nextWell =  this.endPage < cri.getPageNum();
			
		//��� ���� ��ư ����
		this.prev = this.startPage > 1;
		
		//��� ���� ��ư ����
		this.next = this.endPage < realEnd;
				
	}
	
	
	
}

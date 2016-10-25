package com.board.mvc;

import org.springframework.stereotype.Service;

@Service
public class Pageing {

	private int pageSize = 15; // �ѹ��� ������ �Խñ� ��
	private int beginPage = 0; // ���� ������
	private int endPage = 0; // �� ������
	
	public int getBeginPage(int selectPage) {
		
		this.beginPage = ( selectPage -1 ) / this.pageSize * this.pageSize + 1;
		
		return beginPage;
	}

	public int getEndPage(int totalpage) {
		
		this.endPage = this.beginPage + this.pageSize - 1;
		
		if(endPage > totalpage) {
			
			this.endPage = totalpage;
		}
		
		return endPage;
	}

	public int getPageSize() {
		return pageSize;
	}



}

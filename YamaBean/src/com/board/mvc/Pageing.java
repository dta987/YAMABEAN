package com.board.mvc;

import org.springframework.stereotype.Service;

@Service
public class Pageing {

	private int pageSize = 15; // 한번에 보여줄 게시글 수
	private int beginPage = 0; // 시작 페이지
	private int endPage = 0; // 끝 페이지
	
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

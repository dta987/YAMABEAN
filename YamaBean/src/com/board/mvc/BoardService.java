package com.board.mvc;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dto.Board;
import com.board.dto.BoardPage;

@Service
public class BoardService {

	@Autowired
	private BoardRepository repository;
	
	@Autowired
	private Pageing pageing;

	public List<Board> getBoardByPage(BoardPage boardPage) {
		RowBounds rowBounds = new RowBounds((boardPage.getSelectPage() - 1)
				* pageing.getPageSize(), pageing.getPageSize());
		
		if(boardPage.getMode() != null && boardPage.getMode().equals("title")) {
			boardPage.setKeyword("%" + boardPage.getKeyword() + "%");
		}
		
		List<Board> boardList = repository.selectAll(rowBounds, boardPage);

		return boardList;
	}

	public int getCustomerPageing(BoardPage boardPage) {
		return (int)Math.ceil((double)repository.Count(boardPage) / pageing.getPageSize());
	}

	public Board findByBoard(int num) {
		return repository.selectByBoard(num);
	}

	public int addBoard(Board board) {
		return repository.insertBoard(board);
		
	}

	public int modifyBoard(Board board) {
		return repository.updateBoard(board);
	}

}

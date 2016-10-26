package com.board.mvc;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.Board;
import com.board.dto.BoardPage;
import com.board.mapper.BoardMapper;

@Repository
public class BoardRepository {

	@Autowired
	private BoardMapper mapper;

	public List<Board> selectAll(RowBounds rowBounds, BoardPage boardPage) {
		return mapper.selectAll(rowBounds, boardPage);
	}

	public int Count(BoardPage boardPage) {
		return mapper.count(boardPage);
	}

	public Board selectByBoard(int num) {
		return mapper.selectByBoard(num);
	}

	public int insertBoard(Board board) {
		return mapper.insertBoard(board);
	}

	public int updateBoard(Board board) {
		return mapper.updateBoard(board);
	}

}

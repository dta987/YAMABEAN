package com.board.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.Board;
import com.board.dto.BoardPage;
import com.board.mapper.BoardMapper;

@Repository
public class BoardRepository {

	@Autowired
	private BoardMapper mapper;

	public List<Board> selectAll(BoardPage boardPage) {
		return mapper.selectAll(boardPage);
	}

	public int Count(BoardPage boardPage) {
		return mapper.count(boardPage);
	}

}

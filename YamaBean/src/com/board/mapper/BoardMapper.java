package com.board.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.board.dto.Board;
import com.board.dto.BoardPage;


public interface BoardMapper {

	List<Board> selectAll(RowBounds rowBounds, BoardPage boardPage);

	int count(BoardPage boardPage);

	Board selectByBoard(int num);

	int insertBoard(Board board);

}

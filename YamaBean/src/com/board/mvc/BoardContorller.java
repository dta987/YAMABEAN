package com.board.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dto.Board;
import com.board.dto.BoardPage;

@Controller
public class BoardContorller {

	@Autowired
	private BoardService service;

	@Autowired
	private Pageing pageing;

	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String Boardmove(@ModelAttribute BoardPage boardPage, Model model) {
		System.out.println("==Board이동==");
		
		System.out.println(boardPage.toString());
		
		List<Board> boardList = null;
		
		
		boardList = service.getBoardByPage(boardPage);
		int totalpage = service.getCustomerPageing(boardPage);

		int beginPage = pageing.getBeginPage(boardPage.getSelectPage());
		int endPage = pageing.getEndPage(totalpage);

		model.addAttribute("boardList", boardList);
		model.addAttribute("selectPage", boardPage.getSelectPage());
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		
		System.out.println(boardList.toString());

		return "board";
	}
	
	@RequestMapping(value = "/boardForm", method = RequestMethod.GET)
	public String BoardFrom() {
		System.out.println("==boardForm이동==");
		

		return "boardForm";
	}
	
	@RequestMapping(value = "/boardWriter", method = RequestMethod.POST)
	public String BoardWriter() {
		System.out.println("==boardWriter이동==");
		

		return "boardForm";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String BoardDetail(@RequestParam int num, Model model) {
		System.out.println("==boardWriter이동==");
		
		Board board = service.findByBoard(num);
		
		model.addAttribute("board", board);
		

		return "boardDetail";
	}

}

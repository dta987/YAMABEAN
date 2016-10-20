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
		System.out.println("==Board¿Ãµø==");
		
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

		System.out.println("totalpage : " + totalpage);
		System.out.println("selectPage : " + boardPage.getSelectPage());
		System.out.println("beginPage : " + beginPage);
		System.out.println("endPage : " + endPage);

		return "board";
	}

}

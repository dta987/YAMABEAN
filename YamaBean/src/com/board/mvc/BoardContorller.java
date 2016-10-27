package com.board.mvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dto.Board;
import com.board.dto.BoardPage;
import com.member.dto.Member;

@Controller
public class BoardContorller {

	@Autowired
	private BoardService service;

	@Autowired
	private BoardPageing pageing;

	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String Boardmove(@ModelAttribute BoardPage boardPage, Model model) {
		System.out.println("==Board�̵�==");
		
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
		return "board";
	}
	
	@RequestMapping(value = "/boardForm", method = RequestMethod.GET)
	public String BoardFrom() {
		System.out.println("==boardForm�̵�==");
		

		return "boardForm";
	}
	
	@RequestMapping(value = "/boardWriter", method = RequestMethod.POST)
	public String BoardWriter(@ModelAttribute Board board, HttpSession seeion) {
		System.out.println("==boardWriter�̵�==");
		
		Member member = (Member)seeion.getAttribute("loginInfo");
		board.setMember_id(member.getId());
		
		System.out.println(board.toString());
		
		int cnt = service.addBoard(board);
		
		return "redirect:/board/move";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String BoardDetail(@RequestParam int num, Model model) {
		System.out.println("==boardDetail�̵�==");
		
		Board board = service.findByBoard(num);
		
		model.addAttribute("board", board);
		

		return "boardDetail";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String BoardUpdate(@RequestParam int num, Model model) {
		System.out.println("==BoardUpdate�̵�==");
		
		Board board = service.findByBoard(num);
		
		model.addAttribute("board", board);
		

		return "updateForm";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String BoardUpdate(@ModelAttribute Board board, Model model) {
		System.out.println("==BoardUpdate�̵�==");
		
		int cnt = service.modifyBoard(board);
		

		return "redirect:/board/detail?num=" + board.getBoard_num();
	}
	


}

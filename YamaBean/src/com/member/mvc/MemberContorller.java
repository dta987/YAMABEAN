package com.member.mvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.admin.dto.OrderList;
import com.member.dto.Forgotten;
import com.member.dto.Member;

@Controller
public class MemberContorller {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("==Member이동==");
		return "login";

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "login";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		List<OrderList> orderList = memberService.findByOrderList(loginInfo.getId());
		
		Member member = memberService.findByMember(loginInfo.getId());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("member", member);
		
		
		
		return "mypage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String password, Model model,
			HttpSession httpSession) {
		System.out.println("login 컨트롤러 접근");

		System.out.println("Id: " + id);
		System.out.println("Password: " + password);

		Member member = memberService.findByMember(id, password);
		String msg = "";

		if (id.equals(member.getId())) {
			if (password.equals(member.getPassword())) {
				if(member.getId().equals("admin")) {
					msg = member.getId()+"님 환영합니다.";
					httpSession.setAttribute("loginInfo", member);
					httpSession.setAttribute("whologin", 2);
					model.addAttribute("msg", msg);
					return "redirect:/";
				} else {
					msg = member.getId()+"님 환영합니다.";
					httpSession.setAttribute("loginInfo", member);
					httpSession.setAttribute("whologin", 1);
					model.addAttribute("msg", msg);
					return "redirect:/";
				}
				

			} else {
				msg = "아이디나 비밀번호가 잘못 되었습니다";
				model.addAttribute("msg", msg);
				return "login";
			}
		} else {
			msg = "아이디나 비밀번호가 잘못 되었습니다";
			model.addAttribute("msg", msg);
			return "login";
		}
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String createMember() {

		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String createMember(@ModelAttribute Member member) {
		int count = memberService.addMember(member);
		if (count > 0) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}

		return "redirect:/";
	}
	
	@RequestMapping(value="/forgotten", method=RequestMethod.GET)
	public String forgotten() {
		System.out.println("forgotten 컨트롤러 접근");

		return "forgotten";
	}

	@RequestMapping(value="/forgotten", method=RequestMethod.POST)
	public String forgottenID(@ModelAttribute Forgotten forgotten, Model model) {
		System.out.println("forgottenID 컨트롤러 접근");
		
		System.out.println(forgotten.toString());
		boolean bool = memberService.overLapCheck(forgotten);
		String path = "";

		if(bool) {
			path = "login";
			model.addAttribute("msg", "메일을 확인해주세요");
		} else {
			path = "forgotten";
			model.addAttribute("msg", "입력정보를 확인해주세요");
		}
	
		return path;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteMember(@RequestParam String id) {
		System.out.println("deleteMember 컨트롤러 접근");
		int count = memberService.removeMember(id);

		return "redirect:/member/listmember";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateMember(@RequestParam String id) {
		Member member = memberService.updateMember(id);
		return "listmember";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String alertMember(Member member, Model model) {
		System.out.println("회원수정 컨트롤러 접근");
		memberService.modifyMember(member);

		return "listmember";
	}
}

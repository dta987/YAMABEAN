package com.member.mvc;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.dto.OrderList;
import com.member.dto.Forgotten;
import com.member.dto.Member;
import com.member.dto.MemberModel;
import com.mymenu.dto.MyMenuModel;

@Controller
public class MemberContorller {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		System.out.println("==Member이동==");
		System.out.println();
		
		return "login";

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "login";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, Model model) {
		
		Member member = (Member)session.getAttribute("loginInfo");
		boolean bool = memberService.findByOrder(member.getId());
		
		String msg=null;
		if(bool) {
			msg = "주문 후 수령하지 않은 물품이 존재합니다. 수령 후 다시 시도해주세요";
			model.addAttribute("msg", msg);
		} else {
			model.addAttribute("msg", msg);
		}
		
		return "delete";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginInfo");
		
		int cnt = memberService.removeMember(member.getId());
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		
		List<OrderList> orderList = null;
		orderList = memberService.findBylatelyOrderList(loginInfo.getId());		
		Member member = memberService.findByMember(loginInfo.getId());
		List<MyMenuModel> allListMyMenu = memberService.mymenuList(loginInfo.getId());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("member", member);
		model.addAttribute("allListMyMenu", allListMyMenu);
		
		System.out.println(allListMyMenu.toString());
		
		
		
		return "mypage";
	}

	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) {
		
		Member loginInfo = (Member)session.getAttribute("loginInfo");
		List<OrderList> orderList = null;
		orderList = memberService.findByOrderList(loginInfo.getId());		
		Member member = memberService.findByMember(loginInfo.getId());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("member", member);
		
		
		
		return "orderListPage";
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
				if (member.getId().equals("admin")) {
					msg = member.getId() + "님 환영합니다.";
					httpSession.setAttribute("loginInfo", member);
					httpSession.setAttribute("whologin", 2);
					model.addAttribute("msg", msg);
					return "redirect:/";
				} else {
					msg = member.getId() + "님 환영합니다.";
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

	@RequestMapping(value = "/mymember", method = RequestMethod.GET)
	public String move() {
		System.out.println("mymember 컨트롤러 이동");
		return "mymember";

	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String createMember() {

		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String createMember(@ModelAttribute MemberModel memberModel) {
		int count = memberService.addMember(memberModel);
		if (count > 0) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}

		return "redirect:/member/login";
	}
	
	@RequestMapping(value="/forgotten", method=RequestMethod.GET)
	public String forgotten() {
		System.out.println("forgotten 컨트롤러 접근");

		return "forgotten";
	}

	@RequestMapping(value="/forgotten", method=RequestMethod.POST)
	public String forgotten(@ModelAttribute Forgotten forgotten, Model model) {
		System.out.println("forgottenID 컨트롤러 접근");
		
		System.out.println(forgotten.toString());
		boolean bool = memberService.forgotten(forgotten);
		String path = "";

		if(bool) {
			path = "login";
			model.addAttribute("msg", "등록한 메일 내용을 전송하였습니다.");
		} else {
			path = "forgotten";
			model.addAttribute("msg", "입력정보를 확인해주세요");
		}
	
		return path;
	}
	
	@RequestMapping(value = "/overlabCheck", method = RequestMethod.POST, produces = "application/JSON; charset=utf-8")
	public @ResponseBody Boolean overLapCheck(@RequestParam String keyword, @RequestParam String mode) {
		
		System.out.println("OverLapCheck");
		
		boolean bool = memberService.overLapCheck(keyword, mode);

		System.out.println(bool);
		
		return bool;
		
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateMember(HttpSession sesstion, Model model) {
		System.out.println("updateMember 컨트롤러 접근");
		
		Member loginInfo = (Member)sesstion.getAttribute("loginInfo");
		
		MemberModel member = memberService.updateMember(loginInfo.getId());

		model.addAttribute("member", member);
	
		return "update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String alertMember(MemberModel memberModel, Model model, HttpSession sesstion) {
		System.out.println("alertMember 컨트롤러 접근");
		
		Member loginInfo = (Member)sesstion.getAttribute("loginInfo");
		
		memberModel.setId(loginInfo.getId());
		
		System.out.println(memberModel.toString());
		
		int count = memberService.modifyMember(memberModel);
		
		return "redirect:/member/mypage";
	}
}

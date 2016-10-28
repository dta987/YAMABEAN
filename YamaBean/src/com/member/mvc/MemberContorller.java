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
		System.out.println("==Member�̵�==");
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
			msg = "�ֹ� �� �������� ���� ��ǰ�� �����մϴ�. ���� �� �ٽ� �õ����ּ���";
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
		System.out.println("login ��Ʈ�ѷ� ����");

		System.out.println("Id: " + id);
		System.out.println("Password: " + password);

		Member member = memberService.findByMember(id, password);
		String msg = "";

		if (id.equals(member.getId())) {
			if (password.equals(member.getPassword())) {
				if (member.getId().equals("admin")) {
					msg = member.getId() + "�� ȯ���մϴ�.";
					httpSession.setAttribute("loginInfo", member);
					httpSession.setAttribute("whologin", 2);
					model.addAttribute("msg", msg);
					return "redirect:/";
				} else {
					msg = member.getId() + "�� ȯ���մϴ�.";
					httpSession.setAttribute("loginInfo", member);
					httpSession.setAttribute("whologin", 1);
					model.addAttribute("msg", msg);
					return "redirect:/";
				}

			} else {
				msg = "���̵� ��й�ȣ�� �߸� �Ǿ����ϴ�";
				model.addAttribute("msg", msg);
				return "login";
			}
		} else {
			msg = "���̵� ��й�ȣ�� �߸� �Ǿ����ϴ�";
			model.addAttribute("msg", msg);
			return "login";
		}
	}

	@RequestMapping(value = "/mymember", method = RequestMethod.GET)
	public String move() {
		System.out.println("mymember ��Ʈ�ѷ� �̵�");
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
			System.out.println("ȸ������ ����");
		} else {
			System.out.println("ȸ������ ����");
		}

		return "redirect:/member/login";
	}
	
	@RequestMapping(value="/forgotten", method=RequestMethod.GET)
	public String forgotten() {
		System.out.println("forgotten ��Ʈ�ѷ� ����");

		return "forgotten";
	}

	@RequestMapping(value="/forgotten", method=RequestMethod.POST)
	public String forgotten(@ModelAttribute Forgotten forgotten, Model model) {
		System.out.println("forgottenID ��Ʈ�ѷ� ����");
		
		System.out.println(forgotten.toString());
		boolean bool = memberService.forgotten(forgotten);
		String path = "";

		if(bool) {
			path = "login";
			model.addAttribute("msg", "����� ���� ������ �����Ͽ����ϴ�.");
		} else {
			path = "forgotten";
			model.addAttribute("msg", "�Է������� Ȯ�����ּ���");
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
		System.out.println("updateMember ��Ʈ�ѷ� ����");
		
		Member loginInfo = (Member)sesstion.getAttribute("loginInfo");
		
		MemberModel member = memberService.updateMember(loginInfo.getId());

		model.addAttribute("member", member);
	
		return "update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String alertMember(MemberModel memberModel, Model model, HttpSession sesstion) {
		System.out.println("alertMember ��Ʈ�ѷ� ����");
		
		Member loginInfo = (Member)sesstion.getAttribute("loginInfo");
		
		memberModel.setId(loginInfo.getId());
		
		System.out.println(memberModel.toString());
		
		int count = memberService.modifyMember(memberModel);
		
		return "redirect:/member/mypage";
	}
}

package com.member.mvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import oracle.jdbc.util.Login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.member.dto.Member;

@Controller
public class MemberContorller {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("==Member�̵�==");
		return "login";

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String password, Model model,
			HttpSession httpSession) {
		System.out.println("login ��Ʈ�ѷ� ����");

		System.out.println("Id: " + id);
		System.out.println("Password" + password);

		Member member = memberService.findByMember(id, password);
		String msg = "";
		model.addAttribute("msg", msg);

		if (id.equals(member.getId())) {
			if (password.equals(member.getPassword())) {
				httpSession.setAttribute("loginInfo", id);
				msg = "�α��� ����";
				model.addAttribute("msg", msg);
				return "redirect:/";

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

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String createMember() {

		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String createMember(@ModelAttribute Member member) {
		int count = memberService.addMember(member);
		if (count > 0) {
			System.out.println("ȸ������ ����");
		} else {
			System.out.println("ȸ������ ����");
		}

		return "redirect:/";
	}

	public String forgottenID(String name, String email, Model model) {
		System.out.println("forgottenID ��Ʈ�ѷ� ����");

		return null;
	}

	public String forgottenPW(String name, String email, String id, Model model) {

		return null;
	}

	public String overLapCheck(String mode, String keyword) {

		return null;
	}

	@RequestMapping(value = "/memberlist", method = RequestMethod.GET)
	public String memberList(String mode, String keyword, Model model) {
		System.out.println("�������Ʈ ��Ʈ�ѷ� ���� ");

		List<Member> members = memberService.findByList(mode, keyword);
		System.out.println(members.size());

		model.addAttribute("members", members);
		return "list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteMember(@RequestParam String id) {
		System.out.println("deleteMember ��Ʈ�ѷ� ����");
		int count = memberService.removeMember(id);

		return "redirect:/member/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateMember(@RequestParam String id) {
		Member member = memberService.updateMember(id);
		return "list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String alertMember(Member member, Model model) {
		System.out.println("ȸ������ ��Ʈ�ѷ� ����");
		memberService.modifyMember(member);

		return "list";
	}

}

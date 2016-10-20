package com.member.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.admin.dto.OrderList;
import com.member.dto.Email;
import com.member.dto.Forgotten;
import com.member.dto.Member;
import com.member.dto.OvelapCheck;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private EmailSender emailSender;

	@Autowired
	private JavaMailSender mailSender;

	public int addMember(Member member) {
		return memberRepository.insertMember(member);
	}

	public Member findByMember(String id, String password) {

		Member member = new Member();

		if (memberRepository.selectByMember(id) != null) {
			member = memberRepository.selectByMember(id);
		}
		return member;
	}

	public Member findByMember(String id) {

		return memberRepository.selectByMember(id);
	}

	public boolean forgotten(Forgotten forgotten) {

		boolean bool = false;
		Member member = null;

		member = memberRepository.forgotten(forgotten);

		if (forgotten.getId() == null) {
			if (member != null) {
				Email email = new Email();
				String reciver = member.getEmail(); // 받을사람의 이메일입니다.
				String subject = "YamaBean";
				String content = "회원님의 아이디는 '" + member.getId()
						+ "' 입니다.";

				email.setReciver(reciver);
				email.setSubject(subject);
				email.setContent(content);

				try {
					emailSender.SendEmail(email);
					bool = true;
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else {
				bool = false;
			}
		} else {
			if (member != null) {
				Email email = new Email();
				String reciver = member.getEmail(); // 받을사람의 이메일입니다.
				String subject = "YamaBean";
				String content = "회원님의 아이디는 '" + member.getPassword()
						+ "' 입니다. <br> 보안을 위해 로그인후 비밀번호를 변경해주세요";

				email.setReciver(reciver);
				email.setSubject(subject);
				email.setContent(content);

				try {
					emailSender.SendEmail(email);
					bool = true;
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else {
				bool = false;
			}
			
		}

		return bool;
	}

	public List<Member> findByList(String mode, String keyword) {
		return memberRepository.selectByList(mode, keyword);
	}

	public int removeMember(String id) {
		return memberRepository.deleteMember(id);
	}

	public Member updateMember(String id) {
		return memberRepository.selectByMember(id);
	}

	public int modifyMember(Member member) {
		return memberRepository.updateMember(member);
	}


	public List<OrderList> findByOrderList(String id) {
		return memberRepository.selectByOrderList(id);
	}

	public boolean overLapCheck(String keyword, String mode) {

		Member member = null;
		boolean bool = false;
		
		if(mode.equals("id")) {
			member = memberRepository.overLapCheckID(keyword);			
		} else if(mode.equals("nickname")) {
			member = memberRepository.overLapCheckNickName(keyword);
		} else if(mode.equals("email")) {
			member = memberRepository.overLapCheckEmail(keyword);
		}
		
		
		if(member == null) {
			bool = false;
		} else {
			bool = true;
		}
		
		return bool;
	}

}

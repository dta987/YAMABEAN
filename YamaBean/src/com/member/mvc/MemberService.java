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
import com.member.dto.MemberModel;
import com.member.dto.OvelapCheck;
import com.mymenu.dto.MyMenuModel;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private EmailSender emailSender;

	@Autowired
	private JavaMailSender mailSender;

	public int addMember(MemberModel memberModel) {
		
		Member member = new Member();
		member.setId(memberModel.getId());
		member.setPassword(memberModel.getPassword());
		member.setName(memberModel.getName());
		member.setGender(memberModel.getGender());
		member.setPhone(memberModel.getPhone());
		member.setNickname(memberModel.getNickname());
		member.setZipcode(memberModel.getZipcode());
		member.setAddress(memberModel.getAddress());
		member.setBday(memberModel.getBday());
		member.setEmail(memberModel.getFirst_email() + "@" + memberModel.getLast_email());

		
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

	public MemberModel updateMember(String id) {
		Member member = memberRepository.selectByMember(id);
		
		MemberModel memberModel = new MemberModel();
		memberModel.setId(member.getId());
		memberModel.setPassword(member.getPassword());
		memberModel.setName(member.getName());
		memberModel.setGender(member.getGender());
		memberModel.setPhone(member.getPhone());
		memberModel.setNickname(member.getNickname());
		memberModel.setZipcode(member.getZipcode());
		memberModel.setAddress(member.getAddress());
		memberModel.setBday(member.getBday());
		String email = member.getEmail();
		int index = email.indexOf("@");
		
		memberModel.setFirst_email(email.substring(0, index));
		memberModel.setLast_email(email.substring(index+1, email.length()));
		
		
		return memberModel;
	}

	public int modifyMember(MemberModel memberModel) {
		
		Member member = new Member();
		member.setId(memberModel.getId());
		member.setPassword(memberModel.getPassword());
		member.setName(memberModel.getName());
		member.setGender(memberModel.getGender());
		member.setPhone(memberModel.getPhone());
		member.setNickname(memberModel.getNickname());
		member.setZipcode(memberModel.getZipcode());
		member.setAddress(memberModel.getAddress());
		member.setBday(memberModel.getBday());
		member.setEmail(memberModel.getFirst_email() + "@" + memberModel.getLast_email());
		
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

	public List<OrderList> findBylatelyOrderList(String id) {
		return memberRepository.findBylatelyOrderList(id);
	}

	public List<MyMenuModel> mymenuList(String id) {
		return memberRepository.mymenuList(id);
	}

}

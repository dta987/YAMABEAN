package com.member.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberContorller {
	
	@RequestMapping(value="/move", method=RequestMethod.GET)
	public String moveMenu() {
		System.out.println("==Member�̵�==");
		return "member";
		
	}


}

package com.admin.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/page", method=RequestMethod.GET)
	public String AdminPage() {
		System.out.println("=== ������ ������ ===");
		
		return "page";
	}
	
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String AdminMemberPage() {
		System.out.println("=== ������ ������ ===");
		
		return "member";
	}
	
	@RequestMapping(value="/menu", method=RequestMethod.GET)
	public String AdminMenuPage() {
		System.out.println("=== ������ ������ ===");
		
		return "menu";
	}
	
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public String AdminOrderPage() {
		System.out.println("=== ������ ������ ===");
		
		return "menu";
	}
	

}

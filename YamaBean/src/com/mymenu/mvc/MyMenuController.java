package com.mymenu.mvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.member.dto.Member;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuDomain;
import com.mymenu.dto.MyMenuModel;

@Controller
public class MyMenuController implements MineControllerInterface {
	
	@Autowired
	private MyMenuService myMenuService ;
	
	@RequestMapping(value="/mymenu", method=RequestMethod.GET)
	public String move(){
		System.out.println("==mymenu �̵�==");
		return "mymenu";
	}

	
	
	@Override
	@RequestMapping(value="/registerMyMenu", method=RequestMethod.GET)
	@ModelAttribute("allFindMenus")
	public List<MenuModel> menusAllList() {
		System.out.println("==menus ��� ����Ʈ �ҷ�����==");
		return myMenuService.menuAllList();
	}

	
	
	@Override
	@RequestMapping(value="/registerMyMenu", method=RequestMethod.POST)
	public String registerMyMenu(@ModelAttribute MyMenuDomain mymenuDomain, HttpSession session) {
		Member sessionid = (Member) session.getAttribute("loginInfo") ;
		mymenuDomain.setMember_id(sessionid.getId());		
		myMenuService.register(mymenuDomain);
		
		System.out.println(mymenuDomain.getMember_id());
		System.out.println(mymenuDomain.getMenu_num());
		System.out.println(mymenuDomain.getMy_optionShot());
		System.out.println(mymenuDomain.getMy_optionSize());
		System.out.println(mymenuDomain.getMy_optionWhip());
		System.out.println(mymenuDomain.getMymenu_num());
		System.out.println(mymenuDomain.getMymenu_price());
		System.out.println(mymenuDomain.getSub_day());
		System.out.println("controller_mymenuName : " +mymenuDomain.getMymenu_name());
		
		return "redirect:/mymenu/listMyMenu";
	}

	
	@Override
	@RequestMapping(value="/listMyMenu", method=RequestMethod.GET)
	@ModelAttribute("allListMyMenu")
	public List<MyMenuModel> mymenuList(HttpSession session) {
		Member member = (Member)session.getAttribute("loginInfo");
		System.out.println("==mymenuList �ҷ�����==");
		return myMenuService.mymenuList(member.getId());
	}
	
	
	@Override
	@RequestMapping(value="/deleteMyMenu", method=RequestMethod.GET)
	public String deleteMyMenu(@RequestParam int mymenu_num) {
		int deleteMyMenu_num = myMenuService.deleteMyMenu(mymenu_num);
		System.out.println("deleteMyMenu_num : " +mymenu_num +" / "+ deleteMyMenu_num);
		return "redirect:/mymenu/listMyMenu";
	}



	@Override
	@RequestMapping(value="/updateMyMenu", method=RequestMethod.GET)
	@ModelAttribute("myMenuModel")
	public MyMenuModel updateMyMenuForm(@RequestParam int mymenu_num) {
		System.out.println(mymenu_num);
		return myMenuService.findByMymenu(mymenu_num);		  
	}

	@Override
	@RequestMapping(value="/updateMyMenu", method=RequestMethod.POST)
	public String updateMyMenu(@ModelAttribute MyMenuDomain mymenuDomain, HttpSession session) {
		Member updateid = (Member) session.getAttribute("loginInfo") ;
		mymenuDomain.setMember_id(updateid.getId());		
	
		int modify = myMenuService.updateMyMenu(mymenuDomain);
		
		System.out.println("update�ұ���");	
		System.out.println("mymenu ���� : " + modify );
		System.out.println(mymenuDomain.getMymenu_num());
		System.out.println(mymenuDomain.getMember_id());
		return "redirect:/mymenu/listMyMenu";
	}

	



}

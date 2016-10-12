package com.mymenu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.menu.dto.MenuModel;
import com.menu.mvc.MenuService;
import com.mymenu.dto.MyMenuDomain;

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
	public String registerMyMenu(@ModelAttribute MyMenuDomain mymenuDomain) {
		System.out.println(mymenuDomain.getMember_id());
		System.out.println(mymenuDomain.getMenu_num());
		System.out.println(mymenuDomain.getMy_optionAmount());
		System.out.println(mymenuDomain.getMy_optionShot());
		System.out.println(mymenuDomain.getMy_optionSize());
		System.out.println(mymenuDomain.getMy_optionWhip());
		System.out.println(mymenuDomain.getMymenu_num());
		System.out.println(mymenuDomain.getMymenu_price());
		System.out.println(mymenuDomain.getSub_day());
		System.out.println("controller_mymenuName : " +mymenuDomain.getMymenu_name());
		myMenuService.register(mymenuDomain);
		return "redirect:/mymenu/listMyMenu";
	}

	
	@Override
	@RequestMapping(value="/listMyMenu", method=RequestMethod.GET)
	@ModelAttribute("allListMyMenu")
	public List<MyMenuDomain> mymenuList() {
		System.out.println("==mymenuList �ҷ�����==");
		return myMenuService.mymenuList();
	}
	
	@Override
	@RequestMapping(value="/deleteMyMenu", method=RequestMethod.GET)
	public String deleteMyMenu(@RequestParam int mymenu_num) {
		int deleteMyMenu_num = myMenuService.deleteMyMenu(mymenu_num);
		System.out.println("deleteMyMenu_num : " +mymenu_num +" / "+ deleteMyMenu_num);
		return "redirect:/mymenu/listMyMenu";
	}


	@Override
	@RequestMapping(value="/detailMyMenu", method=RequestMethod.GET)
	public MyMenuDomain detailMyMenu(@RequestParam int mymenu_num, @ModelAttribute MyMenuDomain mymenuDomain) {
		mymenuDomain = myMenuService.detailMyMenu(mymenu_num);
		return mymenuDomain;
	}
	
	@Override
	public String updateMyMenu(MyMenuDomain mymenuDomain) {
		return null;
	}




}

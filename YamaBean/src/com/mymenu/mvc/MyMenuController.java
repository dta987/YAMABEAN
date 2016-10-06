package com.mymenu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mymenu.dto.MyMenuDomain;

@Controller
public class MyMenuController implements MineControllerInterface {
	
	@Autowired
	private MyMenuService myMenuService ;
	
	
	@Override
	@RequestMapping(value="/registerMyMenu", method=RequestMethod.GET)
	public String register() {
		System.out.println("==MYMENU_controller==");
		return "registerMyMenu";
	}

	@Override
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerMyMenu(@ModelAttribute MyMenuDomain mymenuDomain) {
		System.out.println("controller_mymenuName : " +mymenuDomain.getMymenu_name());
		myMenuService.register(mymenuDomain);
		return "redirect:/mymenu/listMyMenu";
	}

	@Override
	public String deleteMyMenu(int mymenu_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MyMenuDomain> mymenuList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateMyMenu(MyMenuDomain mymenuDomain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MyMenuDomain detailMyMenu(int mymenu_num, MyMenuDomain mymenuDomain) {
		// TODO Auto-generated method stub
		return null;
	}



}

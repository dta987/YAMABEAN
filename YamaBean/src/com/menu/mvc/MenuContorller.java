package com.menu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.menu.dto.MenuDomain;
import com.menu.dto.MenuModel;

@Controller
public class MenuContorller implements MuContorllerInterface{
	
	@Autowired
	private MenuService menuService;
	
		
	@RequestMapping(value="/move", method=RequestMethod.GET)
	public String moveMenu() {
		System.out.println("==Menu이동==");
		return "menu";
	}
	
	
	
	@RequestMapping(value="/createMenu", method=RequestMethod.GET)
	public String insertMenu() {
		System.out.println("--메뉴추가하기로이동--");
		return "createMenu";
	}
	@Override
	@RequestMapping(value="/createMenu", method=RequestMethod.POST)
	public String createMenu(@ModelAttribute MenuDomain menuDomain) {
		System.out.println("m_group : " +menuDomain.getM_group());
		System.out.println("m_category : "+menuDomain.getM_category());
		System.out.println("m_name : " +menuDomain.getM_name());
		System.out.println("image : " +menuDomain.getImage().getOriginalFilename());
		System.out.println("Price : " +menuDomain.getPrice());
		System.out.println("Content : " +menuDomain.getContent());
		menuService.addMenu(menuDomain) ;		
		return "redirect:/menu/listMenu";
	}
	
	@Override
	@RequestMapping(value="/listMenu", method=RequestMethod.GET)
	@ModelAttribute("findByList")
	public List<MenuModel> menuList() {
		System.out.println("--menuList--");
		return menuService.findByList();
	}
	
	@Override
	@RequestMapping(value="/deleteMenu", method=RequestMethod.GET)
	public String deleteMenu(@RequestParam int menu_num) {
		boolean deleteMenu_num = menuService.removeMenu(menu_num);
		System.out.println("deleteMenu_num : " +menu_num +" / "+ deleteMenu_num);
		return "redirect:/menu/listMenu";
	}
	
	
	@Override
	@RequestMapping(value="/updateMenu", method=RequestMethod.GET)
	public MenuDomain updateMenuForm(@RequestParam int menu_num, @ModelAttribute MenuDomain menuDomain) {
		menuDomain = menuService.findByMenu(menu_num);
		return menuDomain;
	}
	@Override
	@RequestMapping(value="/updateMenu", method=RequestMethod.POST)
	public String updateMenu(@ModelAttribute MenuDomain menuDomain) {
		menuService.modifyMenu(menuDomain);
		return "redirect:/menu/listMenu";
	}

	

	
	@Override
	public String searchMenu(int menu_num) {
		// TODO Auto-generated method stub
		return null;
	}



	



	
	


}

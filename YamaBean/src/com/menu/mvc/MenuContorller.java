package com.menu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.menu.dto.MenuDomain;
import com.menu.dto.MenuModel;

@Controller
public class MenuContorller{
	
	@Autowired
	private MenuService menuService;
	
		
	@RequestMapping(value="/move", method=RequestMethod.GET)
	public String moveMenu() {
		System.out.println("==controller_Menu이동==");
		return "menu";
	}

	@RequestMapping(value="/createMenu", method=RequestMethod.GET)
	public String insertMenu() {
		System.out.println("--controller_메뉴추가하기로이동--");
		return "createMenu";
	}
	
	@RequestMapping(value="/createMenu", method=RequestMethod.POST)
	public String createMenu(@ModelAttribute MenuDomain menuDomain) {
		System.out.println("controller_menu_num : " +menuDomain.getMenu_num());
		System.out.println("controller_m_group : " +menuDomain.getM_group());
		System.out.println("controller_m_category : "+menuDomain.getM_category());
		System.out.println("controller_m_name : " +menuDomain.getM_name());
		System.out.println("controller_image : " +menuDomain.getImage().getOriginalFilename());
		System.out.println("controller_Price : " +menuDomain.getPrice());
		System.out.println("controller_Content : " +menuDomain.getContent());
		menuService.addMenu(menuDomain) ;		
		return "redirect:/menu/listMenu";
	}
	
	@RequestMapping(value="/listMenu", method=RequestMethod.GET)
	@ModelAttribute("findByList")
	public List<MenuModel> menuList() {
		System.out.println("--controller_menuList--");
		return menuService.findByList();
	}
	
	@RequestMapping(value="/deleteMenu", method=RequestMethod.GET)
	public String deleteMenu(@RequestParam int menu_num) {
		boolean deleteMenu_num = menuService.removeMenu(menu_num);
		System.out.println("controller_deleteMenu_num : " +menu_num +" / "+ deleteMenu_num);
		return "redirect:/menu/listMenu";
	}
	
	
	@RequestMapping(value="/updateMenu", method=RequestMethod.GET)
	public MenuDomain updateMenuForm(@RequestParam int menu_num, @ModelAttribute MenuDomain menuDomain) {
		menuDomain = menuService.findByMenu(menu_num);
		return menuDomain;
	}
	
	@RequestMapping(value="/updateMenu", method=RequestMethod.POST)
	public String updateMenu(@ModelAttribute MenuDomain menuDomain) {
		int modify = menuService.modifyMenu(menuDomain);
		System.out.println("controller_modify : " +modify);
		return "redirect:/menu/listMenu";
	}

	@RequestMapping(value="/order")
	public String OrderMenu(){
		return "order";
		
	}


	



	
	


}

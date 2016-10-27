package com.menu.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.admin.mvc.AdminService;
import com.menu.dto.MenuDomain;
import com.menu.dto.MenuModel;
import com.storeMap.dto.Store;

@Controller
public class MenuContorller {

	@Autowired
	private MenuService menuService;

	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String moveMenu() {
		System.out.println("==controller_Menu이동==");
		return "menu";
	}

	@RequestMapping(value = "/createMenu", method = RequestMethod.GET)
	public String insertMenu(Model model) {
		System.out.println("--controller_메뉴추가하기로이동--");		
		return "createMenu";
	}

	@RequestMapping(value = "/createMenu", method = RequestMethod.POST)
	public String createMenu(@ModelAttribute MenuDomain menuDomain) {

		menuService.addMenu(menuDomain);

		return "redirect:/admin/menu";
	}

	@RequestMapping(value = "/listMenu", method = RequestMethod.GET)
	@ModelAttribute("findByList")
	public List<MenuModel> menuList() {
		System.out.println("--controller_menuList--");
		return menuService.findByList();
	}

	@RequestMapping(value = "/deleteMenu", method = RequestMethod.GET)
	public String deleteMenu(@RequestParam int menu_num) {
		boolean deleteMenu_num = menuService.removeMenu(menu_num);
		System.out.println("controller_deleteMenu_num : " + menu_num + " / "
				+ deleteMenu_num);
		return "redirect:/admin/menu";
	}

	@RequestMapping(value = "/updateMenu", method = RequestMethod.GET)
	public MenuDomain updateMenuForm(@RequestParam int menu_num,
			@ModelAttribute MenuDomain menuDomain) {
		menuDomain = menuService.findByMenu(menu_num);
		return menuDomain;
	}

	@RequestMapping(value = "/updateMenu", method = RequestMethod.POST)
	public String updateMenu(@ModelAttribute MenuDomain menuDomain) {
		int modify = menuService.modifyMenu(menuDomain);
		System.out.println("controller_modify : " + modify);
		return "redirect:/admin/menu";
	}

	@RequestMapping(value = "/detailMenu", method = RequestMethod.GET)
	public MenuModel detailMenu(@RequestParam int menu_num,
			@ModelAttribute MenuModel menuModel) {
		menuModel = menuService.detailManeu(menu_num);
		return menuModel;
	}

}

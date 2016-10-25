package com.order.mvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.member.dto.Member;
import com.menu.dto.MenuModel;
import com.mymenu.dto.MyMenuModel;
import com.order.dto.OrderCheckModel;
import com.order.dto.OrderDomin;
import com.storeMap.dto.Store;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String OrderMenu(Model model, HttpSession session) {
		System.out.println("=== order controller ===");
		
		Member loginInfo = (Member)session.getAttribute("loginInfo");
	
		List<MenuModel> findByList = service.findByMenuList();
		List<Store> findByStoreList = service.findByStoreList();
		List<MyMenuModel> allListMyMenu = service.mymenuList(loginInfo.getId());
		model.addAttribute("findByList", findByList);
		model.addAttribute("findByStoreList", findByStoreList);
		model.addAttribute("allListMyMenu", allListMyMenu);
		
		
		
		return "order";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String OrderMenu(@ModelAttribute OrderDomin orderDomin, Model model, HttpSession session) {
		System.out.println("=== order controller post===");		
		System.out.println(orderDomin.toString());
		OrderCheckModel orderCheckModel = service.createOrder(orderDomin);
		session.setAttribute("loginInfo", service.findByMember(orderDomin.getMember_id()));
		model.addAttribute("orderCheckModel", orderCheckModel);
		
		System.out.println(orderCheckModel.toString());
		
		return "check";
	}

}

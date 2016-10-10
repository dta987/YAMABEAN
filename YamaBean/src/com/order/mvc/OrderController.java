package com.order.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.menu.dto.MenuModel;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@RequestMapping(value = "/order")
	public String OrderMenu(Model model) {
		System.out.println("=== 주문 하자 ===");
	
		List<MenuModel> findByList = service.findByList();
		model.addAttribute("findByList", findByList);
		return "order";
	}

}
